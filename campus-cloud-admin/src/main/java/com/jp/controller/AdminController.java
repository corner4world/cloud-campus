package com.jp.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.jp.entity.SysUser;
import com.jp.service.ISysUserService;
import com.jp.web.Result;
import com.jp.web.ResultUtil;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
@RestController
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping(value = "/getMessage", method = RequestMethod.GET)
    public String submitLogin() {
        return "您拥有获得该接口的信息的权限！";
    }
}

