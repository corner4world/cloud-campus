package com.jp.realm;

import com.google.common.base.Objects;
import com.google.common.collect.Sets;
import com.jp.entity.SysMenu;
import com.jp.entity.SysRole;
import com.jp.entity.SysUser;
import com.jp.service.ISysUserService;
import com.jp.util.Encodes;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by wangl on 2017/11/22.
 * todo:
 */
@Component(value = "authRealm")
public class AuthRealm extends AuthorizingRealm {

    @Autowired
    @Lazy
    private ISysUserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        ShiroUser shiroUser = (ShiroUser)principalCollection.getPrimaryPrincipal();
        SysUser user = userService.findUserByUsername(shiroUser.getUserName());
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        Set<SysRole> roles = user.getRoles();
        Set<String> roleNames = Sets.newHashSet();
        
        for (SysRole role : roles) {
            if(StringUtils.isNotBlank(role.getName())){
                roleNames.add(role.getName());
            }
        }
        Set<SysMenu> menus = user.getMenus();
        Set<String> permissions = Sets.newHashSet();
        for (SysMenu menu : menus) {
            if(StringUtils.isNotBlank(menu.getPermission())){
                permissions.add(menu.getPermission());
            }
        }
        info.setRoles(roleNames);
        info.setStringPermissions(permissions);
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;

        String username = (String)token.getPrincipal();
        SysUser user = userService.findUserByUsername(username);
        if(user == null) {
            throw new UnknownAccountException();//没找到帐号
        }
        if(Boolean.TRUE.equals(user.getLocked())) {
            throw new LockedAccountException(); //帐号锁定
        }
        byte[] salt = Encodes.decodeHex(user.getSalt());
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                new ShiroUser(user.getId(),user.getUsername(),user.getIcon()),
                user.getPassword(), //密码
                ByteSource.Util.bytes(salt),
                getName()  //realm name
        );
        return authenticationInfo;
    }

    public void removeUserAuthorizationInfoCache(String username) {
        SimplePrincipalCollection pc = new SimplePrincipalCollection();
        pc.add(username, super.getName());
        super.clearCachedAuthorizationInfo(pc);
    }

    /**
     * 设定Password校验的Hash算法与迭代次数.
     */
    @PostConstruct
    public void initCredentialsMatcher() {
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher("SHA-1");
        matcher.setHashIterations(1024);
        setCredentialsMatcher(matcher);
    }

    public void setUserService(ISysUserService userService) {
        this.userService = userService;
    }

    /**
     * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息.
     */
    public static class ShiroUser implements Serializable {
        private static final long serialVersionUID = -1373760761780840081L;
        public String id;
        public String username;
        public String icon;

        public ShiroUser(String id, String username,String icon) {
            this.id = id;
            this.username = username;
            this.icon=icon;
        }

        public String getUserName() {
            return username;
        }
        public String getIcon() {
            return icon;
        }
        public String getId() {
            return id;
        }

        /**
         * 重载hashCode,只计算loginName;
         */
        @Override
        public int hashCode() {
            return Objects.hashCode(username);
        }

        /**
         * 重载equals,只计算loginName;
         */
        @Override
        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null) {
                return false;
            }
            if (getClass() != obj.getClass()) {
                return false;
            }
            ShiroUser other = (ShiroUser) obj;
            if (username == null) {
                return other.username == null;
            } else return username.equals(other.username);
        }
    }
}
