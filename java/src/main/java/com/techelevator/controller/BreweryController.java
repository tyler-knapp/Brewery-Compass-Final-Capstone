package com.techelevator.controller;

import com.techelevator.dao.BreweryDAO;
import com.techelevator.model.Brewery;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class BreweryController {

    private BreweryDAO breweryDAO;

    public BreweryController(BreweryDAO breweryDAO){
        this.breweryDAO = breweryDAO;
    }

    @RequestMapping(path = "breweries", method = RequestMethod.GET)
    public List<Brewery> list(){
        return breweryDAO.findAll();
    }

}
