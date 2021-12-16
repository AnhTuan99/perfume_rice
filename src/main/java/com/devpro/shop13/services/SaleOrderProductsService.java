package com.devpro.shop13.services;

import com.devpro.shop13.entities.Categories;
import com.devpro.shop13.entities.Saleorder;
import com.devpro.shop13.entities.Saleorder_products;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Service
public class SaleOrderProductsService extends BaseService<Saleorder_products> {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	protected EntityManager em() {
		return entityManager;
	}

	@Override
	protected Class<Saleorder_products> clazz() {
		return Saleorder_products.class;
	}
	
	public List<Saleorder_products> search() {
		String sql = "SELECT * FROM tbl_saleorder_products c WHERE status=true";
		return executeNativeSql(sql);
	}

	public List<Saleorder_products> searchByIdSaleOrder(int id) {
		String sql = "select * from tbl_saleorder_products  where saleorder_id="+id;
		Query query = entityManager.createNativeQuery(sql, Saleorder_products.class);
		return query.getResultList();
	}
}
