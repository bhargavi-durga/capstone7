package myshop.wipro.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import myshop.wipro.entity.User;

import java.util.Collection;


public interface UserRepository extends JpaRepository<User, String> {
    User findByEmail(String email);
    Collection<User> findAllByRole(String role);

}
