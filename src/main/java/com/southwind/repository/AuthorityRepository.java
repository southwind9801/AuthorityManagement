package com.southwind.repository;

import java.util.Iterator;
import java.util.List;

import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.southwind.entity.Authority;

@Repository
public interface AuthorityRepository extends CrudRepository<Authority, String>{
	public Authority findById(String id);
	public void deleteById(String id);
	public PageImpl findAll(Pageable pageable);
}
