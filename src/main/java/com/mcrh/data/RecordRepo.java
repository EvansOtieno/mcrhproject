package com.mcrh.data;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RecordRepo extends JpaRepository<Record, Integer> {

	@Query(value = "select e from Record e where year(e.notificationdate) =year(:dateprovided)")
	public List<Record> anyyear(@Param("dateprovided") Date date);
	
	@Query(value = "select e from Record e where year(e.notificationdate) =year(current_date)")
	public List<Record> thisyear();

	@Query(value = "select e from Record e where year(e.notificationdate) =year(current_date) and  month(e.notificationdate)=month(current_date)")
	public List<Record> thismonth();

	@Query(value = "select e from Record e where year(e.notificationdate) =year(:dateprovided) and  month(e.notificationdate)=month(:dateprovided)")
	public List<Record> anymonth(@Param("dateprovided") Date date);

	public List<Record> findByNotificationdateBetween(Date date, Date date2);

	public List<Record> findByChildDob(Date date);
	
	public Record findByChildSerialno(int number);
}
