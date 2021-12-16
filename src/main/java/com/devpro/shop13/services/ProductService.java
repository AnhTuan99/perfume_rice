package com.devpro.shop13.services;

import com.devpro.shop13.conf.MVCConf;
import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.entities.Products;
import com.devpro.shop13.entities.Products_images;
import com.devpro.shop13.taglibs.PaginationTaglib;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class ProductService extends BaseService<Products> {

	@PersistenceContext
	EntityManager entityManager;

	@Autowired
	private Products_imagesService products_imagesService;

	@Override
	protected EntityManager em() {
		return entityManager;
	}

	@Override
	protected Class<Products> clazz() {
		return Products.class;
	}
	
	public List<Products> search() {
		String sql = "SELECT * FROM tbl_products c WHERE status=true";
		return executeNativeSql(sql);
	}

	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	@Transactional(rollbackOn = Exception.class)//Nhất quán trong db, add dữ liệu 1 bảng mà bảng còn lại lỗi sẽ ko add dữ liệu
	public Products save(Products products, MultipartFile avatar, MultipartFile[] productPictures) throws IOException {
		try {
			if(!isEmptyUploadFile(avatar)){
				avatar.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "product/avatar/" + avatar.getOriginalFilename()));
				products.setAvatar("product/avatar/" + avatar.getOriginalFilename());
			}
			if(!isEmptyUploadFile(productPictures)){
				for (MultipartFile productImg : productPictures) {
					productImg.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "product/picture/" + productImg.getOriginalFilename()));
					Products_images pis=new Products_images();
					pis.setPath("product/picture/" + productImg.getOriginalFilename());
					pis.setTitle(productImg.getOriginalFilename());
					pis.setCreatedDate(LocalDateTime.now());
					pis.setCreatedBy(products.getCreatedBy());
					products.addProduct_images(pis);
				}
			}
			return super.save(products);
		} catch (Exception e) {
			throw e;
		}
	}

	@Transactional(rollbackOn = Exception.class)
	public Products Update(Products product, MultipartFile avatar, MultipartFile[] pictures)
			throws Exception {
		try {
			Products productOnDb = super.getById(product.getId());
			product.setCreatedDate(productOnDb.getCreatedDate());
			if(!isEmptyUploadFile(avatar)) {
				new File(MVCConf.ROOT_UPLOAD_PATH + productOnDb.getAvatar()).delete();
				avatar.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "product/avatar/" + avatar.getOriginalFilename()));
				product.setAvatar("product/avatar/" + avatar.getOriginalFilename());
			} else {
				product.setAvatar(productOnDb.getAvatar());
			}

			if(!isEmptyUploadFile(pictures)) {
				Set<Products_images> productImagesOnDb = productOnDb.getProductImages();
				for(Products_images pic : productImagesOnDb) {
					new File(MVCConf.ROOT_UPLOAD_PATH + pic.getPath()).delete();
					products_imagesService.delete(pic);
				}

				for(MultipartFile pic : pictures) {
					pic.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "product/picture/" + pic.getOriginalFilename()));

					Products_images pi = new Products_images();
					pi.setPath("product/picture/" + pic.getOriginalFilename());
					pi.setTitle(pic.getOriginalFilename());
					pi.setUpdatedDate(LocalDateTime.now());
					pi.setUpdatedBy(product.getUpdatedBy());
					pi.setCreatedDate(product.getCreatedDate());
					pi.setCreatedBy(product.getCreatedBy());
					product.addProduct_images(pi);
				}
			}

			return super.save(product);
		} catch (Exception e) {
			throw e;
		}
	}

	public List<Products> searchProductWithBestSeller() {

		String sql = "SELECT * FROM tbl_products WHERE status=true AND brands_id IN (SELECT id FROM tbl_brands WHERE status=true) AND category_id IN (SELECT id FROM tbl_category WHERE status=true) And selling >0 ORDER BY selling DESC LIMIT 4";
		Query query = entityManager.createNativeQuery(sql, Products.class);
		return query.getResultList();
	}

	public List<Products> searchProductWithNewArrival() {

		String sql = "SELECT * FROM tbl_products WHERE status=true AND brands_id IN (SELECT id FROM tbl_brands WHERE status=true) AND category_id IN (SELECT id FROM tbl_category WHERE status=true) AND DATEDIFF(curdate(),created_date)<=30 ORDER BY created_date DESC LIMIT 8";
		Query query = entityManager.createNativeQuery(sql, Products.class);
		return query.getResultList();
	}

	public List<Products> searchProductWithDiscount() {

		String sql = "SELECT * FROM tbl_products WHERE status=true AND brands_id IN (SELECT id FROM tbl_brands WHERE status=true) AND category_id IN (SELECT id FROM tbl_category WHERE status=true) AND saleoff>0 ORDER BY created_date ";
		Query query = entityManager.createNativeQuery(sql, Products.class);
		return query.getResultList();
	}

	public Products highestDiscount() {

		try{
			String sql = "SELECT * FROM tbl_products WHERE status=true AND brands_id IN (SELECT id FROM tbl_brands WHERE status=true) AND category_id IN (SELECT id FROM tbl_category WHERE status=true)  ORDER BY saleoff DESC LIMIT 1";
			Query query = entityManager.createNativeQuery(sql, Products.class);
			return (Products) query.getSingleResult();
		}
		catch (Exception ex){
			return null;
		}
	}

	public List<Products> searchByIdCategory(int category_id, ProductSearch productSearch, int max) {
		String sql = "SELECT * FROM tbl_products c WHERE status=true AND brands_id IN (SELECT id FROM tbl_brands WHERE status=true) AND category_id IN (SELECT id FROM tbl_category WHERE status=true)";
		if(category_id > 0){
			sql=sql+"AND category_id='"+category_id+"'";
		}

		Query query =  entityManager.createNativeQuery(sql, Products.class);
		// paging
		if (productSearch.getOffset() != null) {
			productSearch.setCount(query.getResultList().size());
			query.setFirstResult(productSearch.getOffset());
			query.setMaxResults(PaginationTaglib.MAX=max);
		}
		return query.getResultList();
	}

	public List<Products> searchProductSort(String sortName, String category_id, ProductSearch productSearch, int max) {
		String sql="";
		if(category_id.equals("all")){
			sql ="SELECT * FROM tbl_products c WHERE status=true AND brands_id IN (SELECT id FROM tbl_brands WHERE status=true) AND category_id IN (SELECT id FROM tbl_category WHERE status=true) ";
		}
		else {
			sql = "SELECT * FROM tbl_products c WHERE status=true AND brands_id IN (SELECT id FROM tbl_brands WHERE status=true) AND category_id IN (SELECT id FROM tbl_category WHERE status=true) AND category_id='"+Integer.parseInt(category_id)+"'";
		}

		if(sortName!=null && sortName.equals("nameasc")){
			sql=sql+"ORDER BY title ASC";
		}
		if(sortName!=null && sortName.equals("namedesc")){
			sql=sql+"ORDER BY title DESC";
		}
		if(sortName!=null && sortName.equals("priceasc")){
			sql=sql+"ORDER BY price_sale ASC";
		}
		if(sortName!=null && sortName.equals("pricedesc")){
			sql=sql+"ORDER BY price_sale DESC";
		}
		if(sortName!=null && sortName.equals("createdasc")){
			sql=sql+"ORDER BY created_date ASC";
		}
		if(sortName!=null && sortName.equals("createddesc")){
			sql=sql+"ORDER BY created_date DESC";
		}
		Query query =  entityManager.createNativeQuery(sql, Products.class);
		// paging
		if (productSearch.getOffset() != null) {
			productSearch.setCount(query.getResultList().size());
			query.setFirstResult(productSearch.getOffset());
			query.setMaxResults(PaginationTaglib.MAX=max);
		}
		return query.getResultList();
	}

	public List<Products> searchByKeyWord(String keyword) {
		List<Products> list=new ArrayList<>();
		if (keyword != "") {
			String sql = "SELECT * FROM tbl_products WHERE  status=true AND brands_id IN (SELECT id FROM tbl_brands WHERE status=true) AND category_id IN (SELECT id FROM tbl_category WHERE status=true) AND title LIKE '%"+keyword+"%' order by rand()";
			Query query = entityManager.createNativeQuery(sql, Products.class);
			list = query.getResultList();
		}
		return list;
	}
}
