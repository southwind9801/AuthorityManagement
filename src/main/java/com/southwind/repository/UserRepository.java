package com.southwind.repository;

import java.util.Iterator;
import java.util.List;

import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.southwind.entity.User;

@Repository
public interface UserRepository extends CrudRepository<User, String>{
	public User findById(String id);
	public void deleteById(String id);
	public User findByName(String name);
	public PageImpl findAll(Pageable pageable);
}
