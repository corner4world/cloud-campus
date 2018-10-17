package com.jp.util;

import com.jp.entity.SysUser;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * 密码加密工具类
 * @Description:TODO
 * @author jiaopan
 * @date 2018年10月17日 上午9:35:32  
 * modify history
 */
public class ToolUtil {

	public static final Logger LOGGER = LoggerFactory.getLogger(ToolUtil.class);

	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	public static void entryptPassword(SysUser user) {
		byte[] salt = Digests.generateSalt(8);
		user.setSalt(Encodes.encodeHex(salt));
		byte[] hashPassword = Digests.sha1(user.getPassword().getBytes(), salt, 1024);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}

	/**
	 *
	 * @param paramStr 输入需要加密的字符串
	 * @return
	 */
	public static String entryptPassword(String paramStr,String salt) {
		if(StringUtils.isNotEmpty(paramStr)){
			byte[] saltStr = Encodes.decodeHex(salt);
			byte[] hashPassword = Digests.sha1(paramStr.getBytes(), saltStr, 1024);
			String password = Encodes.encodeHex(hashPassword);
			return password;
		}else{
			return null;
		}
	}
}
