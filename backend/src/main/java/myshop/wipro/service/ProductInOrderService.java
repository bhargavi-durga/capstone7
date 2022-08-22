package myshop.wipro.service;

import myshop.wipro.entity.ProductInOrder;
import myshop.wipro.entity.User;


public interface ProductInOrderService {
    void update(String itemId, Integer quantity, User user);
    ProductInOrder findOne(String itemId, User user);
}
