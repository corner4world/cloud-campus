package com.mysiteforme.admin.base;

import com.mysiteforme.admin.realm.AuthRealm.ShiroUser;
import org.apache.shiro.SecurityUtils;

/**
 * Created by wangl on 2017/11/25.
 * todo:
 */
public class MySysUser {

    public static String icon() {
        return ShiroUser().getIcon();
    }

    public static Long id() {
        return ShiroUser().getId();
    }

    public static String loginName() {
        return ShiroUser().getloginName();
    }

    public static String nickName(){
        return ShiroUser().getNickName();
    }
    
    public static String schoolCode() {
        return ShiroUser().getSchoolCode();
    }
    
    public static ShiroUser ShiroUser() {
        ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return user;
    }
}
