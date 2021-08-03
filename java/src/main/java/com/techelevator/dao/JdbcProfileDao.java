package com.techelevator.dao;

import com.techelevator.model.CheckIn;
import com.techelevator.model.Location;
import com.techelevator.model.Profile;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.util.ArrayList;
import java.util.List;

public class JdbcProfileDao implements ProfileDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcProfileDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Profile> getBadgesIdByUserId(int userId) {
        List<Profile> badges = new ArrayList<>();
        String sql = "SELECT badge_id FROM user_badge WHERE user_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            badges.add(mapRowToProfile(results));
        }
        return badges;
    }

    @Override
    public void createUserBadge(int userId, int badgeId) {
        String sql = "INSERT INTO user_badge (user_id, badge_id) VALUES (?, ?);";
        jdbcTemplate.update(sql, userId, badgeId);
    }

    private Profile mapRowToProfile(SqlRowSet results) {
        Profile profile = new Profile();
        profile.setBadgeId(results.getInt("badge_id"));
        profile.setCheckInId(results.getInt("check_in_id"));
        profile.setUserId(results.getInt("user_id"));
        return profile;
    }
}
