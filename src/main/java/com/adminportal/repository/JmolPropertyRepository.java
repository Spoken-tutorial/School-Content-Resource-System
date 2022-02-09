package com.adminportal.repository;

import org.springframework.data.repository.CrudRepository;

import com.adminportal.content.ArticleExternal;
import com.adminportal.content.JmolProperty;

public interface JmolPropertyRepository extends CrudRepository<JmolProperty, Integer>{
	
}
