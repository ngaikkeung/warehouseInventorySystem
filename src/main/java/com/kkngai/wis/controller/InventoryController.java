package com.kkngai.wis.controller;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.kkngai.wis.dao.InventoryRepo;
import com.kkngai.wis.model.Inventory;
import com.kkngai.wis.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class InventoryController {

    @Autowired
    private InventoryRepo inventoryRepo;

    @RequestMapping(value = "/inventory/transferInventory", method = RequestMethod.GET)
    public ModelAndView getTransferInventoryPage(){
        return new ModelAndView("transfer");
    }

    @RequestMapping(value = "/inventory/transferInventory", method = RequestMethod.POST)
    public ModelAndView transferInventory(@RequestParam("from") String fromLocation, @RequestParam("to") String toLocation, @RequestParam("productCode") String productCode, @RequestParam("quantity") int quantity){
        ModelAndView mv = new ModelAndView("transfer");

        Inventory fromInventory =  inventoryRepo.findInventoryByLocationAndProductCode(fromLocation, productCode.trim());
        Inventory toInventory =  inventoryRepo.findInventoryByLocationAndProductCode(toLocation, productCode.trim());

        if(fromInventory == null){

            // No inventory find from specific location
            mv.addObject("transferFailed", "Do not have specific inventory from " + fromLocation);
        }else if(fromInventory.getQuantity() < quantity){

            // Inventory have not enough quantity
            mv.addObject("transferFailed", "Not enough quantity from " + fromLocation);
        }else if(toInventory == null){

            // No inventory transfer to specific location
            Inventory newInventory =  inventoryRepo.save(new Inventory(toLocation, quantity, productCode.trim()));
            inventoryRepo.minusQuantityByInventoryId(quantity, fromInventory.getInventoryId());

            mv.addObject("transferSuccess", "Transfer success");
        }else{

            // Normal transfer inventory action
            inventoryRepo.addQuantityByInventoryId(quantity, toInventory.getInventoryId());
            inventoryRepo.minusQuantityByInventoryId(quantity, fromInventory.getInventoryId());

            mv.addObject("transferSuccess", "Transfer success");
        }

        return mv;
    }

    @RequestMapping(value = "/inventory/updateInventory")
    public ModelAndView updateInventoryAction(@RequestParam("inventoryFile") MultipartFile file){
        List<Inventory> inventories;
        ModelAndView mv = new ModelAndView("product");

        try{
            inventories = CsvUtility.read(Inventory.class, file.getInputStream());

            for(Inventory newInventory: inventories){
                Inventory checkInventory = inventoryRepo.findInventoryByLocationAndProductCode(newInventory.getLocation(), newInventory.getProductCode());

                if(checkInventory != null){
                    // inventory already exist, increase quantity
                    inventoryRepo.addQuantityByInventoryId(newInventory.getQuantity(), checkInventory.getInventoryId());
                }else{
                    // new inventory
                    inventoryRepo.save(newInventory);
                }
            }

            mv.addObject("inventoryUploadSuccess", true);
        }catch (Exception e) {
            System.out.println("Update inventory exception : " + e);
            mv.addObject("inventoryUploadSuccess", false);
        }

        return mv;
    }
}
