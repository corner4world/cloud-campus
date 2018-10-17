package com.jp.service;

import com.jp.entity.SysMenu;
import com.jp.entity.VO.ShowMenu;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * InnoDB free: 93184 kB 服务类
 * </p>
 *
 * @author jiaopan
 * @since 2018-10-17
 */
public interface ISysMenuService extends IService<SysMenu> {
	List<ShowMenu> getShowMenuByUser(String userId);
}
