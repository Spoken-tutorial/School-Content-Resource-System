package com.adminportal.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminportal.content.Jmol;
import com.adminportal.repository.JmolRepository;
import com.adminportal.service.JmolService;

@Service
public class JmolServiceImpl implements JmolService{
	@Autowired 
	JmolRepository jmolRepo;

	@Override
	public List<Jmol> findAll() {
		List<Jmol> jmols = new ArrayList<Jmol>();
		jmolRepo.findAll().forEach(jmols::add);
		return jmols;
	}

	@Override
	public void addJmol(Jmol jmol) {
		jmolRepo.save(jmol);
	}

	@Override
	public int count() {
		
		return (int) jmolRepo.count() ;
	}

	@Override
	public int save(Jmol temp) {
		jmolRepo.save(temp);
		return 0;
	}

	@Override
	public Jmol findById(int id) {
		Optional<Jmol> jmol = jmolRepo.findById(id);
		return jmol.get();
	}
	
	
	
}
