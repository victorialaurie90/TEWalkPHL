package com.techelevator.dao;

import com.techelevator.model.CheckIn;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcCheckInDao implements CheckInDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcCheckInDao(JdbcTemplate jdbcTemplate) {this.jdbcTemplate = jdbcTemplate;}

    @Override
    //How can do?
    public void createCheckIn(CheckIn checkIn) {
        String sql = "INSERT INTO check_ins(date_time, location_id, user_id) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, Timestamp.valueOf(LocalDateTime.now()), checkIn.getLocationId(), checkIn.getUserId());

    }

    @Override
    //will probably need to join tables and return location_name and date_time
    public List<CheckIn> getCheckInsByUserId(int userId) {
        List<CheckIn> checkIns = new ArrayList<>();
        String sql = "SELECT * FROM check_ins WHERE user_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            checkIns.add(mapRowToCheckIns(results));
        }
        return checkIns;
    }

    private CheckIn mapRowToCheckIns(SqlRowSet results) {
        CheckIn checkIn = new CheckIn();
        checkIn.setCheckInId(results.getInt("check_in_id"));
        checkIn.setDateTime(results.getString("date_time"));
        checkIn.setLocationId(results.getInt("location_id"));
        checkIn.setUserId(results.getInt("user_id"));
        return checkIn;
    }

}
