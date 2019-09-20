package com.mcrh.data;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UsersRepo extends JpaRepository<Users, String> {

	public Users findByUsername(String username);
}
