package com.crud.config;

import com.crud.service.custom.UserService;
import com.crud.service.custom.impl.UserServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.SecurityBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.WebSecurityConfigurer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http.authorizeHttpRequests(auth -> auth
//                        .requestMatchers("/user/save","/customer/list", "/saveCustomer", "customer/saveCustomer", "customer/viewCustomer/{nic}", "customer/updateCustomer/{nic}", "customer/deleteCustomer/{nic}").permitAll()
//
//                        .anyRequest().authenticated())
//                .httpBasic(withDefaults())

        //                .formLogin(withDefaults())
//                .csrf(AbstractHttpConfigurer::disable);
        http
                .authorizeRequests()
                .requestMatchers("/user/save","/customer/list", "/saveCustomer", "customer/saveCustomer", "customer/viewCustomer/{nic}","customer/updateCustomer/", "customer/updateCustomer/{nic}", "customer/deleteCustomer/{nic}")
//                .antMatchers("/", "/home").permitAll()
//                .anyRequest()
                .authenticated()
                .and()
                .formLogin(withDefaults())
//                .loginPage("/login") // URL mapping to the custom login page
//                .permitAll()
//                .and()
                .logout()
                .permitAll();


        return http.build();


    }

    @Bean
    public UserDetailsService userDetailsService(){
        return new UserInfoUserDetailsService();
    }



    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setUserDetailsService(userDetailsService());
        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
        return daoAuthenticationProvider;

    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
