package com.devpro.shop13.services;

import com.devpro.shop13.entities.Saleorder;
import com.devpro.shop13.entities.Users;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Service
public class SaleOrderService extends BaseService<Saleorder> {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	protected EntityManager em() {
		return entityManager;
	}

	@Override
	protected Class<Saleorder> clazz() {
		return Saleorder.class;
	}
	
	public List<Saleorder> search() {
		String sql = "SELECT * FROM tbl_saleorder c WHERE status=true";
		return executeNativeSql(sql);
	}
}
