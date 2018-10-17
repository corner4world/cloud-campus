package com.jp.web;

/**
 * 控制器返回结果类
 * @Description:TODO
 * @author jiaopan
 * @date 2018年9月29日 下午5:08:05  
 * modify history
 */
public class Result {
	private String code;
    public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	private Object data;
	
	private String msg;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
