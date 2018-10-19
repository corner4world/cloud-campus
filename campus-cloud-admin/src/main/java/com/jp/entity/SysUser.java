package com.jp.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.google.common.collect.Sets;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * <p>
 * InnoDB free: 93184 kB
 * </p>
 *
 * @author jiaopan
 * @since 2018-10-17
 */
@TableName("sys_user")
public class SysUser extends Model<SysUser> {

    private static final long serialVersionUID = 1L;

    private String id;
    private String username;
    private String icon;
    private String password;
    /**
     * shiro加密盐
     */
    private String salt;
    /**
     * 是否锁定
     */
    private Integer locked;
    private String email;
    /**
     * 创建时间
     */
    @TableField("create_date")
    private Date createDate;
    public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
     * 删除标识
     */
    @TableField("del_state")
    private Integer delState;
    
    @TableField(exist=false)
	private Set<SysRole> roles = Sets.newHashSet();
	
	@TableField(exist=false)
	private Set<SysMenu> menus = Sets.newHashSet();

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Integer getLocked() {
        return locked;
    }

    public void setLocked(Integer locked) {
        this.locked = locked;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getDelState() {
        return delState;
    }

    public void setDelState(Integer delState) {
        this.delState = delState;
    }

    public Set<SysRole> getRoles() {
		return roles;
	}

	public void setRoles(Set<SysRole> roles) {
		this.roles = roles;
	}

	public Set<SysMenu> getMenus() {
		return menus;
	}

	public void setMenus(Set<SysMenu> menus) {
		this.menus = menus;
	}

	@Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "SysUser{" +
        ", id=" + id +
        ", username=" + username +
        ", icon=" + icon +
        ", password=" + password +
        ", salt=" + salt +
        ", locked=" + locked +
        ", email=" + email +
        ", delState=" + delState +
        "}";
    }
}
