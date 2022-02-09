package com.adminportal.repository;

import org.springframework.data.repository.CrudRepository;

import com.adminportal.content.Jmol;
import com.adminportal.content.QuizQuestion;

public interface JmolRepository extends CrudRepository<Jmol, Integer>{
	
}
