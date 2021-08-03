package com.techelevator.dao;

import com.techelevator.model.Location;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public interface LocationDao {

    List<Location> listAllLocations();

    List<Location> listLocationsByCategory(int categoryId);

    List<Location> listLocationsByName(String locationName);

    List<Location> listLocationsByAvailability(Date currentTime);

    Location getLocationDetails(int locationId);

}
