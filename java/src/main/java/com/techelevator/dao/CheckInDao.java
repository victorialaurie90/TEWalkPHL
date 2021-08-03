package com.techelevator.dao;

import com.techelevator.model.CheckIn;

import java.util.List;

public interface CheckInDao {

    List<CheckIn> getCheckInsByUserId(int userId);

    void createCheckIn(CheckIn checkIn);
}
