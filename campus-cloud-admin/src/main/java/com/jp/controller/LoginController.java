package com.jp.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.jp.entity.SysUser;
import com.jp.entity.VO.ShowMenu;
import com.jp.mapper.SysUserMapper;
import com.jp.realm.AuthRealm.ShiroUser;
import com.jp.service.ISysMenuService;
import com.jp.service.ISysUserService;
import com.jp.web.Result;
import com.jp.web.ResultUtil;

import java.util.Currency;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

/**
 * <p>
 * 登陆页面控制器
 * </p>
 *
 * @author jiaopan
 * @since 2018-09-29
 */
@Controller
@RequestMapping("/")
public class LoginController {

	@GetMapping(value = "/login")
	public String login(Model model) {
		return "login";
	}
	/**
	 * 登陆检查
	 */
	@PostMapping(value = "/login_check")
	@ResponseBody
	public Result login_check(Model model,String username,String password) {
		Map<String, Object> data = new HashMap<>();
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		
		try {
			subject.login(token);
			if (subject.isAuthenticated()) {
				data.put("url","admin/index");
				return ResultUtil.success("登陆成功", data);
			}
		} catch (Exception e) {
			data.put("url", "login");
			System.out.println(e);
		}
		return ResultUtil.error("登录名或密码错误", data);
	}
}

