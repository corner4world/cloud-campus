package com.jp.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.jp.entity.SysUser;
import com.jp.entity.VO.ShowMenu;
import com.jp.realm.AuthRealm.ShiroUser;
import com.jp.service.ISysMenuService;
import com.jp.service.ISysUserService;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

/**
 * 首页控制器
 * @author jiaopan
 * @since 2018-09-29
 */
@Controller
@RequestMapping("/admin")
public class MainController {
	
	@Autowired 
	private ISysMenuService menuService;
	
	@GetMapping(value = "/index")
	public String index(Model model) {
		return "index";
	}
	@PostMapping("/show_menu")
	@ResponseBody
	public List<ShowMenu> menu(){
		ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		List<ShowMenu> showMenus = menuService.getShowMenuByUser(shiroUser.getId());
		return showMenus;
	}
}

