package com.devpro.shop13.conf;

import com.devpro.shop13.services.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.InMemoryTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

@Configuration
@EnableWebSecurity
public class SecureConf extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsServiceImpl userDetailsServiceImpl;

    @Autowired
    private CustomSuccessHandler customSuccessHandler;

    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http.csrf().disable().authorizeRequests()
                .antMatchers("/login/**", "/user/**", "/upload/**", "/css/**", "/js/**", "/images/**", "/summernote/**", "/file/upload/**").permitAll()
                .antMatchers("/admin/**").hasAnyAuthority("ADMIN")
                .antMatchers("/home/**").hasAnyAuthority("USER")
                .antMatchers("/profile/**").hasAnyAuthority("USER")
                .antMatchers("/profile/**").hasAnyAuthority("ADMIN")
                .and()
                .formLogin()
                .loginPage("/cai-nay-la-mapping-trong-adminlogincontroller")
                .loginProcessingUrl("/cai-nay-la-thuoc-tinh-action-trong-form-login")
                .successHandler(customSuccessHandler)
                .failureUrl("/cai-nay-la-mapping-trong-adminlogincontroller?co_loi_xay_ra=true")
                .permitAll()
                .and()
                .logout()
                .logoutUrl("/cai-nay-la-thuoc-tinh-href-trong-the-a-logout")
                .logoutSuccessUrl("/cai-nay-la-mapping-trong-adminlogincontroller")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .permitAll();
        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");

        http.authorizeRequests().and()
                .rememberMe().tokenRepository(this.persistentTokenRepository())
                .tokenValiditySeconds(1 * 24 * 60 * 60);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth)
            throws Exception {
        auth.userDetailsService(userDetailsServiceImpl)
                .passwordEncoder(passwordEncoder());
    }

    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        InMemoryTokenRepositoryImpl memory = new InMemoryTokenRepositoryImpl();
        return memory;
    }
}
