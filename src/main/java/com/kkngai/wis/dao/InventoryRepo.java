package com.kkngai.wis.dao;

import com.kkngai.wis.model.Inventory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface InventoryRepo extends JpaRepository<Inventory, Integer> {

    @Query(value = "SELECT * FROM Inventory WHERE product_code = ?1", nativeQuery = true)
    List<Inventory> findInventoryByProductCode(String productCode);

    @Query(value = "SELECT * FROM Inventory WHERE location = ?1 AND product_code = ?2", nativeQuery = true)
    Inventory findInventoryByLocationAndProductCode(String location, String productCode);

    @Modifying
    @Transactional
    @Query(value = "UPDATE inventory SET quantity = quantity+?1 WHERE inventory_id = ?2", nativeQuery = true)
    void addQuantityByInventoryId(int quantity, int inventoryId);

    @Modifying
    @Transactional
    @Query(value = "UPDATE inventory SET quantity = quantity-?1 WHERE inventory_id = ?2", nativeQuery = true)
    void minusQuantityByInventoryId(int quantity, int inventoryId);
}
