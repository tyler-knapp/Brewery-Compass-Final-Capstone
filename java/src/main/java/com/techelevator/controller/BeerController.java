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
}
