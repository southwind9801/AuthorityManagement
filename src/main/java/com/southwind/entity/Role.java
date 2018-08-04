package com.southwind.entity;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document
public class Role {
	@Id
	private String id;
	@Field
	private String name;
	@Field
	private List<String> auths;
	private boolean has;
	
	public boolean isHas() {
		return has;
	}
	public void setHas(boolean has) {
		this.has = has;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<String> getAuths() {
		return auths;
	}
	public void setAuths(List<String> auths) {
		this.auths = auths;
	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + ", auths=" + auths + "]";
	}
	
}
