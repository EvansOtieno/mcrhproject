package com.mcrh.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mcrh.data.Users;
import com.mcrh.data.UsersRepo;

@Component("customUserDetailsService")
@Service
@Transactional
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	UsersRepo userrepo;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users user = userrepo.findByUsername(username);

		return new User(user.getUsername(), user.getPassword(), AuthorityUtils.createAuthorityList(user.getRole()));

	}
}
