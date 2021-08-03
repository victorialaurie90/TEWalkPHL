package com.techelevator.dao;

import com.techelevator.model.Location;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class JdbcLocationDao implements LocationDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcLocationDao(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }


    @Override
    public List<Location> listAllLocations() {
        List<Location> locations = new ArrayList<>();
        String sql = "SELECT * FROM locations";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            locations.add(mapRowToLocation(results));
        }
        return locations;
    }

    @Override
    public List<Location> listLocationsByCategory(int categoryId) {
        List<Location> locations = new ArrayList<>();
        String sql = "SELECT * FROM locations WHERE category_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, categoryId);
        while (results.next()) {
            locations.add(mapRowToLocation(results));
        }
        return locations;
    }

    @Override
    public List<Location> listLocationsByName(String locationName) {
        List<Location> locations = new ArrayList<>();
        String sql = "SELECT * FROM locations WHERE location_name LIKE '%?%'";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, locationName);
        while (results.next()) {
            locations.add(mapRowToLocation(results));
        }
        return locations;
    }

    @Override
    public List<Location> listLocationsByAvailability(Date currentTime) {
        List<Location> locations = new ArrayList<>();
        String sql = "SELECT * FROM locations WHERE" + LocalTime.now() +
                "NOT BETWEEN open.from AND open_to";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, currentTime);
        while (results.next()) {
            locations.add(mapRowToLocation(results));
        }
        return locations;
    }


    @Override
    public Location getLocationDetails(int locationId) {
        Location location = new Location();
        String sql = "SELECT * FROM locations WHERE location_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, locationId);
        location = mapRowToLocation(results);
        return location;
    }


    private Location mapRowToLocation(SqlRowSet results) {
        Location location = new Location();
        location.setLocationId(results.getInt("location_id"));
        location.setLocationName(results.getString("location_name"));
        location.setAddress(results.getString("address"));
        location.setOpenTo(results.getString("open_to"));
        location.setOpenFrom(results.getString("open_from"));
        location.setTwitter(results.getString("twitter"));
        location.setUrl(results.getString("url"));
        location.setFacebook(results.getString("facebook"));
        location.setImg(results.getString("img"));
        location.setLatitude(results.getDouble("latitude"));
        location.setLongitude(results.getDouble("longitude"));
        return location;
    }
}
