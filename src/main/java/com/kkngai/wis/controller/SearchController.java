package com.kkngai.wis.controller;

import com.kkngai.wis.dao.InventoryRepo;
import com.kkngai.wis.model.Inventory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class SearchController {

    @Autowired
    private InventoryRepo inventoryRepo;

    @RequestMapping("/search")
    public ModelAndView getSearchPage(){
        return new ModelAndView("search");
    }

    @RequestMapping(value = "/search/findInventory", method = RequestMethod.POST)
    public ModelAndView findInventory(@RequestParam("productCode") String productCode){

        ModelAndView mv = new ModelAndView("search");

        List<Inventory> results = inventoryRepo.findInventoryByProductCode(productCode.trim());

        mv.addObject("inventories", results);

        return mv;
    }
}
