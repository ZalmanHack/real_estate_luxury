package com.company.realestate.configs;

import com.company.realestate.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserService userService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/real_estate/*/new_post", "/real_estate/*/edit").authenticated()
                .antMatchers("/api/posts/*/new_post", "/api/posts/*/add_img", "/api/posts/*/del_img").authenticated()
//                .antMatchers("/admin/login", "/admin/logout").permitAll()
//                .antMatchers("/**", "/static/**", "/activate/*").permitAll()
                .antMatchers("/**", "/registration", "/static/**", "/activate/*")
                .permitAll()
                .anyRequest()
                .authenticated()
            .and()
                .formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/home")
                .failureUrl("/login?error=true")
                .permitAll()
            .and()
                .logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/login")
                .permitAll();


//        http.exceptionHandling().authenticationEntryPoint(new AuthenticationEntryPoint() {
//            @Override
//            public void commence  (HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
//                if (authException != null) {
//                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
////                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
////                    response.getWriter().print("Unauthorizated....");
////                    throw new ResourceNotFoundException();
//                }
//            }
//        });
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService)
                .passwordEncoder(passwordEncoder);
    }
}
