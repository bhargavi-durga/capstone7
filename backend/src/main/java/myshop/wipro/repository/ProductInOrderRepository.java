package myshop.wipro.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import myshop.wipro.entity.ProductInOrder;


public interface ProductInOrderRepository extends JpaRepository<ProductInOrder, Long> {

}
