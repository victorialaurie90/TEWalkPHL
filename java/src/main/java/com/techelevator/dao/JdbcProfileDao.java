package com.techelevator.dao;

import com.techelevator.model.Badge;
import com.techelevator.model.CheckIn;
import com.techelevator.model.Location;
import com.techelevator.model.Profile;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class JdbcProfileDao implements ProfileDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcProfileDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Badge> getUnclaimedBadges(int userId) {
        List<Badge> badges = new ArrayList<>();
        String sql =
                "SELECT badge_id, badge_name, badge_description, badge_url FROM badges "
                        + "EXCEPT "
                        + "SELECT b.badge_id, b.badge_name, b.badge_description, b.badge_url FROM badges b "
                        + "JOIN user_badge u ON u.badge_id = b.badge_id WHERE u.user_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while (results.next()) {
            badges.add(mapRowToBadgeList(results));
        }
        return badges;
    }

    @Override
    public List<Badge> getBadgesIdByUserId(int userId) {
        List<Badge> badges = new ArrayList<>();
        String sql =
                "SELECT b.badge_id, b.badge_description, u.user_id, b.badge_name, b.badge_url "
                        + "FROM badges b "
                        + "JOIN user_badge u ON b.badge_id = u.badge_id "
                        + "WHERE u.user_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while (results.next()) {
            badges.add(mapRowToBadge(results));
        }
        return badges;
    }

    @Override
    public void createUserBadge(int userId, int badgeId) {
        String sql = "INSERT INTO user_badge (user_id, badge_id) VALUES (?, ?);";
        jdbcTemplate.update(sql, userId, badgeId);
    }
    @Override
    public void checkForBadgeAward(int userId) {
        Map<Integer, Integer> count = new HashMap<>();
        String sql =
                "SELECT COUNT(lc.category_id), lc.category_id, c.user_id, cb.badge_id "
                        + "FROM locations_category lc "
                        + "JOIN locations l on lc.location_id = l.location_id "
                        + "JOIN check_ins c on l.location_id = c.location_id "
                        + "JOIN category_badge cb ON lc.category_id = cb.category_id "
                        + "WHERE l.location_id = lc.location_id AND c.user_id =? "
                        + "GROUP BY lc.category_id, c.user_id, cb.badge_id;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while (results.next()) {
            count.put(results.getInt("category_id"), results.getInt("count"));
            for(Map.Entry<Integer, Integer> item : count.entrySet()) {
                if (item.getValue() == 4) {
                    createUserBadge(userId, (results.getInt("badge_id")));
                }
            }
        }
    }


    private Badge mapRowToBadgeList(SqlRowSet results) {
        Badge badge = new Badge();
        badge.setBadgeId(results.getInt("badge_id"));
        badge.setBadgeName(results.getString("badge_name"));
        badge.setDescription(results.getString("badge_description"));
        badge.setImage(results.getString("badge_url"));
        return badge;
    }


    private Badge mapRowToBadge(SqlRowSet results) {
        Badge badge = new Badge();
        badge.setBadgeId(results.getInt("badge_id"));
        badge.setUserId(results.getInt("user_id"));
        badge.setBadgeName(results.getString("badge_name"));
        badge.setDescription(results.getString("badge_description"));
        badge.setImage(results.getString("badge_url"));
        return badge;
    }
}
