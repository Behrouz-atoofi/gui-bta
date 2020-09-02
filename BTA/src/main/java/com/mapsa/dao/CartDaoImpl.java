package com.mapsa.dao;

import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public class CartDaoImpl implements CartDao {
    @Override
    public boolean addToCartById(int id) {


        return false;
    }
}
