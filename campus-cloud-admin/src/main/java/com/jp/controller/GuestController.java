package com.jp.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 页面控制器
 * </p>
 *
 * @author jiaopan
 * @since 2018-09-29
 */
@RestController
@RequestMapping("/guest")
public class GuestController {
    @RequestMapping(value = "/enter", method = RequestMethod.GET)
    public String  login() {
        return "欢迎进入，您的身份是游客";
    }

    @RequestMapping(value = "/getMessage", method = RequestMethod.GET)
    public String submitLogin() {
        return "您拥有获得该接口的信息的权限！";
    }
}

