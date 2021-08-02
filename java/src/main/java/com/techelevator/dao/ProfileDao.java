package com.techelevator.dao;

import com.techelevator.model.CheckIn;
import com.techelevator.model.Profile;

import java.util.List;

public interface ProfileDao {

List<Integer> getBadgesIdByUserId(int userId);

List<CheckIn> getCheckInsByUserId(int userId);

void createUserBadge(int userId, int badgeId);
}
