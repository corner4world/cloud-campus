package com.jp.controller;


import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.jp.entity.SysUser;
import com.jp.service.ISysUserService;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

/**
 * <p>
 * InnoDB free: 93184 kB 前端控制器
 * </p>
 *
 * @author jiaopan
 * @since 2018-10-17
 */
@Controller
@RequestMapping("/admin/sysUser")
public class SysUserController {
	@Autowired
	private ISysUserService userService; 
	
	@RequiresPermissions("sys:user:list")
	@PostMapping("/list")
	@ResponseBody
	public Page<SysUser> list(Model model,@RequestParam(value="page",defaultValue="1")Integer page,
										  @RequestParam(value="size",defaultValue="10")Integer size){
		Wrapper<SysUser> entity = new EntityWrapper<SysUser>();
		Page<SysUser> users = userService.selectPage(new Page<>(page, size),entity);
		return users;
	}
}

