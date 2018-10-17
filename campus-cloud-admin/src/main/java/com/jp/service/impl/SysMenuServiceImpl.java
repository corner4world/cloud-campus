package com.jp.service.impl;

import com.jp.entity.SysMenu;
import com.jp.entity.VO.ShowMenu;
import com.jp.mapper.SysMenuMapper;
import com.jp.service.ISysMenuService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.Maps;

import java.util.List;
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
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements ISysMenuService {

	@Override
	public List<ShowMenu> getShowMenuByUser(String userId) {
		Map<String,Object> map = Maps.newHashMap();
        map.put("userId",userId);
        map.put("parentId",null);
        return baseMapper.selectShowMenuByUser(map);
	}

}
