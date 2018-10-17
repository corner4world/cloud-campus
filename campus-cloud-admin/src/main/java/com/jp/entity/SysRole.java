package com.jp.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import java.util.Set;

/**
 * <p>
 * InnoDB free: 93184 kB
 * </p>
 *
 * @author jiaopan
 * @since 2018-10-17
 */
@TableName("sys_role")
public class SysRole extends Model<SysRole> {

    private static final long serialVersionUID = 1L;

    private String id;
    private String name;
    @TableField("del_state")
    private Integer delState;
    @TableField(exist = false)
	private Set<SysMenu> menuSet;

	public Set<SysMenu> getMenuSet() {
		return menuSet;
	}

	public void setMenuSet(Set<SysMenu> menuSet) {
		this.menuSet = menuSet;
	}

	public Set<SysUser> getUserSet() {
		return userSet;
	}

	public void setUserSet(Set<SysUser> userSet) {
		this.userSet = userSet;
	}

	@TableField(exist = false)
	private Set<SysUser> userSet;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getDelState() {
        return delState;
    }

    public void setDelState(Integer delState) {
        this.delState = delState;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "SysRole{" +
        ", id=" + id +
        ", name=" + name +
        ", delState=" + delState +
        "}";
    }
}
