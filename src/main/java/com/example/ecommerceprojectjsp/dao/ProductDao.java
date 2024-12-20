package com.example.ecommerceprojectjsp.dao;

import com.example.ecommerceprojectjsp.models.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public ProductDao(Connection con) {
        this.con = con;
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<Product>();
        try {
            query="select * from products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()){
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getString("price"));
                product.setImage(rs.getString("image"));
                products.add(product);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
