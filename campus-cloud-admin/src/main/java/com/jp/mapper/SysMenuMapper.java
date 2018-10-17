package com.jp.mapper;

import com.jp.entity.SysMenu;
import com.jp.entity.VO.ShowMenu;

import java.util.List;
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
public interface SysMenuMapper extends BaseMapper<SysMenu> {
	List<ShowMenu> selectShowMenuByUser(Map<String,Object> map);
}
