package com.jp.mapper;

import com.jp.entity.SysUser;

import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 * InnoDB free: 93184 kB Mapper 接口
 * </p>
 *
 * @author jiaopan
 * @since 2018-10-17
 */
public interface SysUserMapper extends BaseMapper<SysUser> {

	SysUser selectUserByMap(Map<String, Object> map);

}
