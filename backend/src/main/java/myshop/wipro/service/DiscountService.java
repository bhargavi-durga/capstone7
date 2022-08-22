package myshop.wipro.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import myshop.wipro.entity.Discount;

public interface DiscountService {

	Discount createCoupon(String code);

	Page<Discount> findAll(PageRequest request);

	void deleteCoupon(String code);

	List<Discount> findAll();

}
