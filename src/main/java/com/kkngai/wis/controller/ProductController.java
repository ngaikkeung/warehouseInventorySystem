package com.kkngai.wis.controller;

import com.kkngai.wis.dao.ProductRepo;
import com.kkngai.wis.model.Product;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductRepo productRepo;

    @RequestMapping(value = "/product")
    public ModelAndView getProductPage(){
        ModelAndView mv = new ModelAndView("product");
        mv.addObject("productUploadSuccess", null);
        mv.addObject("inventoryUploadSuccess", null);
        return mv;
    }

    @RequestMapping(value = "/product/addProduct", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ModelAndView addProductAction(@RequestParam("productFile") MultipartFile file){
        List<Product> productList = new ArrayList<>();
        ModelAndView mv = new ModelAndView("product");

        try{
            productList = CsvUtility.read(Product.class, file.getInputStream());
            productRepo.saveAll(productList);
            mv.addObject("productUploadSuccess", true);
        }catch (Exception e) {
            System.out.println("Read CSV exception : " + e);
            mv.addObject("productUploadSuccess", false);
        }

        return mv;
    }


}
