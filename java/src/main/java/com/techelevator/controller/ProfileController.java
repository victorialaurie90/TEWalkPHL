package com.techelevator.controller;

import com.techelevator.dao.LocationDao;
import com.techelevator.dao.ProfileDao;
import com.techelevator.model.Badge;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin

public class ProfileController {

    private ProfileDao profileDao;

    public ProfileController(ProfileDao profileDao) {
        this.profileDao = profileDao;
    }

    public ProfileController() {
        this.profileDao = profileDao;
    }

    @RequestMapping(path = "/profile/{id}/badges", method = RequestMethod.GET)
    public List<Badge> getAllBadges(@PathVariable int id) {
        List<Badge> badges = profileDao.getBadgesIdByUserId(id);
        return badges;
    }



}
