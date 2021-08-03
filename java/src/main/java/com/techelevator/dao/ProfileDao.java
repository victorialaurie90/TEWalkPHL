package com.techelevator.dao;

import com.techelevator.model.CheckIn;
import com.techelevator.model.Profile;

import java.util.List;

public interface ProfileDao {

List<Profile> getBadgesIdByUserId(int userId);

void createUserBadge(int userId, int badgeId);
}
