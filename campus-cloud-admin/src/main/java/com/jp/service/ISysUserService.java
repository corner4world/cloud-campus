package com.jp.service;

import com.jp.entity.SysUser;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * InnoDB free: 93184 kB 服务类
 * </p>
 *
 * @author jiaopan
 * @since 2018-10-17
 */
public interface ISysUserService extends IService<SysUser> {
	SysUser findUserByUsername(String username);
	SysUser findUserByUserId(String id);
	boolean save(SysUser user);
}
