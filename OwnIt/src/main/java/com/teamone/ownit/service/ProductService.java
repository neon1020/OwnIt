package com.teamone.ownit.service;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.teamone.ownit.mapper.ProductMapper;

@Service
public class ProductService {


	@Autowired
	private ProductMapper mapper;
	






















































































//박주닮

public int insertwishlist() {
	return mapper.wishlist();
}



































}
