package com.jp.web;

/**
 * 控制器返回结果包装工具类
 * @Description:TODO
 * @author jiaopan
 * @date 2018年9月29日 下午5:09:18  
 * modify history
 */
public class ResultUtil {
	public static Result error(String msg,Object data) {
		Result res = new Result();
		res.setCode("error");
		res.setData(data);
		res.setMsg(msg);
		return res;
	}
	
	public static Result success(String msg, Object data) {
		Result res = new Result();
		res.setCode("success");
		res.setData(data);
		res.setMsg(msg);
		return res;
	}
	
}

