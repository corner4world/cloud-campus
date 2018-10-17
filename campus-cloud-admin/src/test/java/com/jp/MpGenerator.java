package com.jp;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.TemplateConfig;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

/**
 * 代码生成器
 * @Description:TODO
 * @author jiaopan
 * @date 2018年8月20日 上午10:29:49  
 * modify history
 */
public class MpGenerator {
	public static void create() {
		AutoGenerator mpg = new AutoGenerator();
		// 全局配置
        GlobalConfig gc = new GlobalConfig();
        gc.setOutputDir("D:\\temp\\AutoGenerator");
        gc.setFileOverride(true);
        gc.setActiveRecord(true);// ActiveRecord特性
        gc.setEnableCache(false);// XML 二级缓存
        gc.setBaseResultMap(true);// XML ResultMap
        gc.setBaseColumnList(false);// XML columList
        gc.setAuthor("jiaopan");
        
        mpg.setGlobalConfig(gc);
     // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setDbType(DbType.MYSQL);
        dsc.setTypeConvert(new MySqlTypeConvert(){
            @Override
            public DbColumnType processTypeConvert(String fieldType) {
                System.out.println("转换类型：" + fieldType);
                return super.processTypeConvert(fieldType);
            }
        });
        dsc.setDriverName("com.mysql.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("root");
        dsc.setUrl("jdbc:mysql://127.0.0.1:3306/campus_cloud_admin?characterEncoding=utf8");
        mpg.setDataSource(dsc);
        
        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        // strategy.setCapitalMode(true);// 全局大写命名 ORACLE 注意
        strategy.setNaming(NamingStrategy.underline_to_camel);// 表名生成策略
        strategy.setInclude(new String[] { "sys_menu" }); // 需要生成的表
        
        mpg.setStrategy(strategy);
        
        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setParent("com.jp");
        pc.setController("controller");
        pc.setService("service");
        
        mpg.setPackageInfo(pc);
        
        
        mpg.execute();
	}
}
