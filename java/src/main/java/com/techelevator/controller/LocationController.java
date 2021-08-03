package com.techelevator.controller;




import com.techelevator.dao.LocationDao;
import com.techelevator.model.Location;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController

public class LocationController {

    private LocationDao locationDao;

    public LocationController(LocationDao locationDao) {
        this.locationDao = locationDao;
    }

//    @RequestMapping(path = "/locations", method = RequestMethod.GET)
//    public Location[] getLocations() {
//        List<Location> locations = locationDao.listAllLocations();
//        Location[] locationList = new Location[locations.size()];
//        locationList = locations.toArray(locationList);
//        return  locationList;
//    }



    @RequestMapping(path = "/locations", method = RequestMethod.GET)
    public List<Location> getLocations() {
        List<Location> locations = new ArrayList<>();
            locations = locationDao.listAllLocations();
        return locations;
    }


        //Maybe just use a filtering method on the get all methods?

    /*@RequestMapping(path = "/locations/{id}", method = RequestMethod.GET)
    public List<Location> getLocationsByCategoryId(@PathVariable int id) {
        List<Location> locations = locationDao.listLocationsByCategory(id);
        return locations;
    }*/

   /* @RequestMapping(path = "/locations/{name}", method = RequestMethod.GET)
    public List<Location> getLocationsByName(@PathVariable String name) {
        List<Location> locations = locationDao.listLocationsByName(name);
        return locations;
    }*/

    /*@RequestMapping(path = "/locations/{id}", method = RequestMethod.GET)
    public List<Location> getLocationsByCategoryId(@PathVariable int id) {
        List<Location> locations = locationDao.listLocationsByCategory(id);
        return locations;
    }*/


}
