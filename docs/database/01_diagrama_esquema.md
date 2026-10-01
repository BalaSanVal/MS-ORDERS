# Diagrama y Esquema de Base de Datos - Orders Service

## Objetivo

Este documento describe el esquema inicial de base de datos correspondiente a `Orders Service`.

Actualmente se consideran cuatro tablas:

- `carts`
- `cart_items`
- `orders`
- `order_items`

Los campos `user_id` y `product_id` representan referencias hacia entidades administradas por otros dominios del sistema. Debido a que el proyecto utilizará una base de datos compartida, dichas relaciones externas quedan pendientes de integración con el esquema general.

---

## Diagrama Entidad-Relación

```mermaid
erDiagram
    CARTS ||--o{ CART_ITEMS : contiene
    ORDERS ||--|{ ORDER_ITEMS : contiene

    CARTS {
        BIGINT id PK
        BIGINT user_id
        DATETIME created_date
        DATETIME updated_date
    }

    CART_ITEMS {
        BIGINT id PK
        BIGINT cart_id
        BIGINT product_id
        INT quantity
        DECIMAL price
    }

    ORDERS {
        BIGINT id PK
        BIGINT user_id
        DECIMAL total
        VARCHAR status
        DATETIME created_at
    }

    ORDER_ITEMS {
        BIGINT id PK
        BIGINT order_id
        BIGINT product_id
        INT quantity
        DECIMAL unit_price
    }