package com.ecommerce.orders_service.config;

import com.ecommerce.orders_service.model.Order;
import com.ecommerce.orders_service.repository.OrderRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataInitializer {

    @Bean
    CommandLineRunner initDatabase(OrderRepository orderRepository) {
        return args -> {
            Order testOrder = new Order(101L, 1500.50, "CREATED");
            orderRepository.save(testOrder);
            System.out.println(">>> ¡Orden de prueba guardada exitosamente! Total de órdenes en BD: " + orderRepository.count());
        };
    }
}