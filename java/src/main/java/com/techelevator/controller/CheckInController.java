package com.techelevator.controller;

import com.techelevator.dao.CheckInDao;
import com.techelevator.model.CheckIn;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@PreAuthorize("isAuthenticated()")
@CrossOrigin

public class CheckInController {

    private CheckInDao checkInDao;

    public CheckInController(CheckInDao checkInDao) {
        this.checkInDao = checkInDao;
    }

    @RequestMapping(path = "/profile/{id}", method = RequestMethod.GET)
    public List<CheckIn> getCheckIns(@PathVariable int id) {
        List<CheckIn> checkIns = checkInDao.getCheckInsByUserId(id);
        return checkIns;
    }

    //Maybe need an Id Path Variable
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/profile/checkins", method = RequestMethod.POST)
    public void postCheckIn(@RequestBody CheckIn checkIn) {
        try {
            checkInDao.createCheckIn(checkIn);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
}
