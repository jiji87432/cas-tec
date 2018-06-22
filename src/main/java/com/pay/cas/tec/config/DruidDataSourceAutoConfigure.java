package com.pay.cas.tec.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.pay.dsmclient.druid.DruidPooledDataSource;

/**
 * @author lihengming [89921218@qq.com]
 */
@Configuration
public class DruidDataSourceAutoConfigure {

	@Value("${com.pay.cas.tec.ds.name}")
	private String dsName;

	@ConditionalOnMissingBean
	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		DruidPooledDataSource ds = new DruidPooledDataSource();
		ds.setDataSourceName(dsName);
		ds.setTestWhileIdle(true);
		ds.setValidationQuery("select 1");
		return ds;
	}

}
