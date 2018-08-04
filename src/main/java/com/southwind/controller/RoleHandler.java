package com.southwind.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.southwind.entity.Authority;
import com.southwind.entity.AuthorityVO;
import com.southwind.entity.Role;
import com.southwind.entity.RoleVO;
import com.southwind.repository.AuthorityRepository;
import com.southwind.repository.RoleRepository;

@Controller
@RequestMapping("/role")
public class RoleHandler {

	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private AuthorityRepository authorityRepository;
	
	@GetMapping("/getAuths")
	public ModelAndView getAuths() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("role_add");
		mav.addObject("list",authorityRepository.findAll().iterator());
		return mav;
	}
	
	@PostMapping("/add")
	public String add(Role role) {
		roleRepository.save(role);
		return "redirect:/role_index.jsp";
	}
	
	@GetMapping(value="/getAll")
	@ResponseBody
	public RoleVO getAll(int page,int limit) {
		//分页处理
		Pageable pageable = new PageRequest(page-1, limit);
		PageImpl pageImpl = roleRepository.findAll(pageable);
		List<Role> list =  pageImpl.getContent();
		RoleVO roleVO = new RoleVO();
		roleVO.setData(list);
		roleVO.setCount(roleRepository.count());
		return roleVO;
		
	} 
	
	@GetMapping("/deleteById/{id}")
	public String deleteById(@PathVariable(value="id")String id) {
		roleRepository.deleteById(id);
		return "redirect:/role_index.jsp";
	}
	
	@GetMapping("/findById/{id}")
	public ModelAndView findById(@PathVariable(value="id")String id) {
		Role role = roleRepository.findById(id);
		Iterator<Authority> allAuths = authorityRepository.findAll().iterator();
		List<Authority> list = new ArrayList<Authority>();
		if(role.getAuths() == null) {
			while(allAuths.hasNext()) {
				Authority item = allAuths.next();
				list.add(item);
			}
		}else {
			Iterator<Authority> myAuths = authorityRepository.findAll(role.getAuths()).iterator();
			while(allAuths.hasNext()) {
				Authority item = allAuths.next();
				myAuths = authorityRepository.findAll(role.getAuths()).iterator();
				while(myAuths.hasNext()) {
					Authority item2 = myAuths.next();
					if(item2.getId().equals(item.getId())) {
						item.setHas(true);
					}
				}
				list.add(item);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("role_update");
		mav.addObject("role", role);
		mav.addObject("auths", list);
		return mav;
	}
	
	@PostMapping("/update")
	public String update(Role role) {
		roleRepository.save(role);
		return "redirect:/role_index.jsp";
	}
}
