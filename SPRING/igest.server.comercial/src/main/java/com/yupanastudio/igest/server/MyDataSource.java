/*
 * Document   : MyDataSource
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

@Configuration
public class MyDataSource {

    @Primary
    @Bean(name = "dsPG")
    @ConfigurationProperties(prefix = "spring.ds.pg")
    public DataSource getDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean(name = "jdbc")
    public JdbcTemplate jdbcPG(@Qualifier("dsPG") DataSource ds) {
        return new JdbcTemplate(ds);
    }

    @Bean(name = "jdbcX")
    public NamedParameterJdbcTemplate jdbcTemplateName(@Qualifier("dsPG") DataSource ds) {
        return new NamedParameterJdbcTemplate(ds);
    }

}
