package com.mw.tour.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	CustomSuccessHandler customSuccessHandler;

	@Autowired
	@Qualifier("mwUserDetailsService")
	UserDetailsService userDetailsService;

	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/", "/home").access("hasRole('EMPLOYEE')").antMatchers("/manager/**")
				.access("hasRole('MANAGER')").antMatchers("/finance/**")
				//.access("hasRole('MANAGER') and hasRole('FINANCE')").and().formLogin().loginPage("/login")
				.access("hasRole('FINANCE')").and().formLogin().loginPage("/login")
				.successHandler(customSuccessHandler).usernameParameter("ssoId").passwordParameter("password").and()
				.csrf().and().exceptionHandling().accessDeniedPage("/Access_Denied");
	}

}
