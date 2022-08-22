package myshop.wipro.service;

import java.util.Collection;

import myshop.wipro.entity.Cart;
import myshop.wipro.entity.ProductInOrder;
import myshop.wipro.entity.User;

public interface CartService {
    Cart getCart(User user);

    void mergeLocalCart(Collection<ProductInOrder> productInOrders, User user);

    void delete(String itemId, User user);

    void checkout(User user);
}
