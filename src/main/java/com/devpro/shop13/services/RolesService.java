package com.devpro.shop13.services;

import com.devpro.shop13.entities.Roles;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class RolesService extends BaseService<Roles> {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	protected EntityManager em() {
		return entityManager;
	}

	@Override
	protected Class<Roles> clazz() {
		return Roles.class;
	}
	
	public List<Roles> findByRoleUsers() {
		String sql = "SELECT * FROM tbl_roles c WHERE status=true AND name='USER'";
		return executeNativeSql(sql);
	}

	public List<Roles> findByRoleAdmin() {
		String sql = "SELECT * FROM tbl_roles c WHERE status=true AND name='ADMIN'";
		return executeNativeSql(sql);
	}







}
