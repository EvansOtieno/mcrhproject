package com.mcrh.data;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface MotherRepo extends JpaRepository<Mother, Integer> {

	@Transactional
	@Modifying
	@Query(value="update Mother u set u.firstname=u.firstname where u.idno=:id")
    void update( @Param("id") int id); 
}
