package com.techelevator.dao;

import com.techelevator.model.Location;

import java.util.List;

public interface LocationDao {
    List<Location> listAllLocations();

    List<Location> listLocationsByCategory();

    List<Location> listLocationsByKeyword();

    List<Location> listLocationsByAvailability();

    Location getLocationDetails();

}
