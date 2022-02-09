package com.adminportal.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminportal.repository.JmolPropertyValueRepository;
import com.adminportal.service.JmolPropertyValueService;

@Service
public class JmolPropertyValueServiceImpl implements JmolPropertyValueService{
	@Autowired	
	JmolPropertyValueRepository jmolPropValRepo;
}
