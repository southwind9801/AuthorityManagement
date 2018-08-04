package com.southwind.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.southwind.entity.Authority;
import com.southwind.entity.Role;
import com.southwind.entity.User;
import com.southwind.repository.AuthorityRepository;
import com.southwind.repository.RoleRepository;
import com.southwind.repository.UserRepository;

@Controller
@RequestMapping("/login")
public class LoginHandler {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private AuthorityRepository authorityRepository;
	
	@PostMapping("/login")
	public ModelAndView lgoin(User user) {
		User item = userRepository.findByName(user.getName());
		List<String> authsId = new ArrayList<String>();
		if(item.getRoles()!=null) {
			Iterator<Role> roles = roleRepository.findAll(item.getRoles()).iterator();
			while(roles.hasNext()) {
				Role role = roles.next();
				List<String> ids = role.getAuths();
				if(ids!=null) {
					for(String id:ids) {
						authsId.add(id);
					}
				}
			}
		}
		Iterator<Authority> auths = authorityRepository.findAll(authsId).iterator();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		mav.addObject("auths", auths);
		return mav;
	}
	
}
