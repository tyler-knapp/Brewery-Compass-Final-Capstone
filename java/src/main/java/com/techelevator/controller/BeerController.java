package com.techelevator.controller;


import com.techelevator.dao.BeerDAO;
import com.techelevator.model.Beer;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class BeerController {

    private BeerDAO beerDAO;

    public BeerController(BeerDAO beerDAO) {
        this.beerDAO = beerDAO;
    }

    @RequestMapping(path = "/breweries/{id}/beers", method = RequestMethod.GET)
    public List<Beer> list(@PathVariable int id) {
        return beerDAO.listAllBeers(id);
    }

    @RequestMapping (path = "/breweries/{id}/beers/{beerId}", method = RequestMethod.GET)
    public Beer retrieve(@PathVariable int breweryId, int beerId) {
        return beerDAO.getBeerInfoByBeerId(beerId, breweryId);
    }
    }
