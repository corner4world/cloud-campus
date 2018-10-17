package com.jp;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.jp.entity.SysUser;
import com.jp.service.ISysUserService;
import com.jp.web.Result;
import com.jp.web.ResultUtil;

@RunWith(SpringRunner.class)
@SpringBootTest
public class JpCampusCloudApplicationTests {

	@Test
	public void create() {
		MpGenerator.create();
	} 
	@Autowired
	ISysUserService userService;
	@Test
	public void insert() {
		SysUser user = new SysUser();
		user.setUsername("admin");
		user.setPassword("1");
		userService.save(user);
	}
}
