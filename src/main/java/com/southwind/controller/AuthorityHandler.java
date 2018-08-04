package com.southwind.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.southwind.entity.Authority;
import com.southwind.entity.AuthorityVO;
import com.southwind.repository.AuthorityRepository;

@Controller
@RequestMapping("/authority")
public class AuthorityHandler {
	
	@Autowired
	private AuthorityRepository authorityRepository;

	@PostMapping("/add")
	public String add(Authority authority) {
		authorityRepository.save(authority);
		return "redirect:/authority_index.jsp";
	}
	
	@GetMapping("/findById/{id}")
	public ModelAndView findById(@PathVariable(value="id")String id) {
		Authority authority = authorityRepository.findById(id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("authority_update");
		mav.addObject("authority", authority);
		return mav;
	}
	
	@PostMapping("/update")
	public String update(Authority authority) {
		authorityRepository.save(authority);
		return "redirect:/authority_index.jsp";
	}
	
	@GetMapping("/deleteById/{id}")
	public String deleteById(@PathVariable(value="id")String id) {
		authorityRepository.deleteById(id);
		return "redirect:/authority_index.jsp";
	}
	
	@GetMapping(value="/getAll")
	@ResponseBody
	public AuthorityVO getAll(int page,int limit) {
		//分页处理
		Pageable pageable = new PageRequest(page-1, limit);
		PageImpl pageImpl = authorityRepository.findAll(pageable);
		List<Authority> list =  pageImpl.getContent();
		AuthorityVO authorityVO = new AuthorityVO();
		authorityVO.setData(list);
		authorityVO.setCount(authorityRepository.count());
		return authorityVO;
	} 
}
