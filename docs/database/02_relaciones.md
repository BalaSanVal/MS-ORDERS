# Relaciones de Base de Datos - Orders Service

## 1. Objetivo

Este documento describe las relaciones internas administradas directamente por `Orders Service`.

Actualmente el microservicio maneja cuatro tablas:

- `carts`
- `cart_items`
- `orders`
- `order_items`

Las relaciones internas identificadas son:

- `carts` con `cart_items`;
- `orders` con `order_items`.

---

## 2. Relación entre `carts` y `cart_items`

La tabla `carts` representa un carrito.

La tabla `cart_items` representa los productos contenidos dentro de dicho carrito.

Un carrito puede contener cero o múltiples elementos.

Cada `cart_item` debe pertenecer obligatoriamente a un único carrito.

### Cardinalidad

```text
carts 1 : 0..N cart_items
```

Esto representa una relación **uno a muchos (1:N)**.

### Implementación

La relación se establece mediante:

```text
carts.id
   ↓
cart_items.cart_id
```

La tabla `cart_items` define:

```sql
cart_id BIGINT NOT NULL
```

La Foreign Key se encuentra implementada mediante:

```sql
ALTER TABLE cart_items
    ADD CONSTRAINT fk_cart_items_cart
        FOREIGN KEY (cart_id)
        REFERENCES carts(id)
        ON DELETE CASCADE;
```

### Comportamiento

La Foreign Key garantiza que un `cart_item` solo pueda hacer referencia a un carrito existente.

La opción:

```sql
ON DELETE CASCADE
```

establece que al eliminar un carrito también se eliminan automáticamente todos sus elementos asociados.

### Estado

**Relación interna implementada físicamente.**

---

## 3. Relación entre `orders` y `order_items`

La tabla `orders` representa un pedido.

La tabla `order_items` representa los productos contenidos dentro de dicho pedido.

Una orden debe estar compuesta conceptualmente por uno o más elementos.

Cada `order_item` debe pertenecer obligatoriamente a una única orden.

### Cardinalidad

```text
orders 1 : 1..N order_items
```

Esto representa una relación **uno a muchos (1:N)**.

### Implementación

La relación se establece mediante:

```text
orders.id
   ↓
order_items.order_id
```

La tabla `order_items` define:

```sql
order_id BIGINT NOT NULL
```

La Foreign Key se encuentra implementada mediante:

```sql
ALTER TABLE order_items
    ADD CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders(id)
        ON DELETE CASCADE;
```

### Comportamiento

La Foreign Key garantiza que un `order_item` solo pueda hacer referencia a una orden existente.

La opción:

```sql
ON DELETE CASCADE
```

establece que al eliminar una orden también se eliminan automáticamente todos sus elementos asociados.

### Consideración de negocio

La Foreign Key garantiza que cada `order_item` pertenezca a una orden existente.

Sin embargo, no garantiza que una orden tenga necesariamente al menos un elemento.

La regla de que una orden debe contener al menos un producto deberá controlarse mediante la lógica de negocio del microservicio.

### Estado

**Relación interna implementada físicamente.**

---

## 4. Resumen de relaciones

| Tabla principal | Tabla relacionada | Campo de relación | Cardinalidad | Constraint |
|---|---|---|---|---|
| `carts` | `cart_items` | `cart_items.cart_id` | 1:N | `fk_cart_items_cart` |
| `orders` | `order_items` | `order_items.order_id` | 1:N | `fk_order_items_order` |

Ambas relaciones utilizan:

```sql
ON DELETE CASCADE
```

para mantener la integridad de los registros dependientes.

---

## 5. Representación general

```text
carts
  │
  │ 1
  │
  │ N
  ▼
cart_items


orders
  │
  │ 1
  │
  │ N
  ▼
order_items
```

Las relaciones internas administradas directamente por `Orders Service` son:

```text
carts.id
   ↓
cart_items.cart_id
```

y:

```text
orders.id
   ↓
order_items.order_id
```

Estas relaciones conforman actualmente el núcleo relacional del microservicio.