package com.ecommerce.orders_service.repository;

import com.ecommerce.orders_service.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    // Método personalizado para buscar pedidos por el ID del usuario
    List<Order> findByUserId(Long userId);

}