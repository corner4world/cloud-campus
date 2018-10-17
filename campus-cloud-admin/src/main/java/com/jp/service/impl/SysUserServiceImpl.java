package com.jp.service.impl;

import com.jp.entity.SysUser;
import com.jp.mapper.SysUserMapper;
import com.jp.service.ISysUserService;
import com.jp.util.ToolUtil;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.Maps;

import java.util.Map;

import org.springframework.stereotype.Service;

/**
 * <p>
 * InnoDB free: 93184 kB 服务实现类
 * </p>
 *
 * @author jiaopan
 * @since 2018-10-17
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {

	@Override
	public SysUser findUserByUsername(String username) {
		Map<String,Object> map = Maps.newHashMap();
		map.put("username", username);
		SysUser user = baseMapper.selectUserByMap(map);
		return user;
	}

	@Override
	public boolean save(SysUser user) {
		ToolUtil.entryptPassword(user);
		user.setLocked(0);
		boolean flag = insert(user);
		//保存用户角色关系
		//this.saveUserRoles(user.getId(),user.getRoles());
		return flag;
	}

	@Override
	public SysUser findUserByUserId(String id) {
		Map<String,Object> map = Maps.newHashMap();
		map.put("id", id);
		SysUser user = baseMapper.selectUserByMap(map);
		return user;
	}

}
