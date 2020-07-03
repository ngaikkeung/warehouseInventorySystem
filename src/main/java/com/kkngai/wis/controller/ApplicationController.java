package com.kkngai.wis.controller;

import com.kkngai.wis.dao.InventoryRepo;
import com.kkngai.wis.dao.ProductRepo;
import com.kkngai.wis.model.Inventory;
import com.kkngai.wis.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ApplicationController {

    @Autowired
    private InventoryRepo inventoryRepo;

    @Autowired
    private ProductRepo productRepo;

    @RequestMapping("/")
    public ModelAndView getIndex(){

        ModelAndView mv = new ModelAndView("index");
        List<Product> products = productRepo.findAll();
        List<Inventory> inventories = inventoryRepo.findAll();
        mv.addObject("inventories", inventories);
        mv.addObject("products", products);

        return mv;
    }
}
