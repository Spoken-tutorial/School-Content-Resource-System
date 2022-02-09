package com.adminportal.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminportal.content.JmolProperty;
import com.adminportal.repository.JmolPropertyRepository;
import com.adminportal.service.JmolPropertyService;
import com.adminportal.service.JmolService;

@Service
public class JmolPropertyServiceImpl implements JmolPropertyService{
	@Autowired
	JmolPropertyRepository jmolPropertyRepo;

	public int count() {
		return (int) jmolPropertyRepo.count();
	}

	@Override
	public int save(JmolProperty temp) {
		jmolPropertyRepo.save(temp);
		return 0;
	}

	
}
