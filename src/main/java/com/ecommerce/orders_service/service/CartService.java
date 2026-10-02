package com.ecommerce.orders_service.service;

import com.ecommerce.orders_service.dto.AddToCartRequest;
import com.ecommerce.orders_service.dto.CartResponse;
import com.ecommerce.orders_service.repository.OrderRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;

@Service
public class CartService {

    private final OrderRepository orderRepository;

    public CartService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    // Método para obtener o inicializar carrito (Lógica HU-11/12)
    public CartResponse getCartByUserId(Long userId) {
        // borrador para conectar con el frontend/controller
        return new CartResponse(1L, userId, new ArrayList<>(), BigDecimal.ZERO);
    }

    public CartResponse addItemToCart(AddToCartRequest request) {
        // Aqui se integran las llamadas ;)
        return new CartResponse(1L, request.getUserId(), new ArrayList<>(), BigDecimal.ZERO);
    }
}