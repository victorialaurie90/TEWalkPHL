package com.techelevator.dao;

import com.techelevator.model.Badge;
import com.techelevator.model.CheckIn;
import com.techelevator.model.Profile;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ProfileDao {

    List<Badge> getAllBadges();

    List<Badge> getBadgesIdByUserId(int userId);

    void createUserBadge(int userId, int badgeId);

    void checkForBadgeAward(int userId);
}