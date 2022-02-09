package com.adminportal.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminportal.content.Conformation;
import com.adminportal.repository.ConformationRepository;
import com.adminportal.service.ConformationService;

@Service
public class ConformationServiceImpl implements ConformationService {

	@Autowired
	ConformationRepository conformationRepo;
	
	@Override
	public int save(Conformation c) {
		conformationRepo.save(c);
		return 0;
	}

	@Override
	public int countRows() {
		return (int) conformationRepo.count();
	}

}
