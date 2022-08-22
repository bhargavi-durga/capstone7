package myshop.wipro.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import myshop.wipro.entity.Discount;

public interface DiscountRepository extends JpaRepository<Discount, String> {

}
