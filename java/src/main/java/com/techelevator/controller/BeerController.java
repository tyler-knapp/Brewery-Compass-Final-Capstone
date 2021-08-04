package com.techelevator.controller;


import com.techelevator.dao.BeerDAO;
import com.techelevator.model.Beer;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RestController
public class BeerController {

    private BeerDAO beerDAO;

    public BeerController(BeerDAO beerDAO) {
        this.beerDAO = beerDAO;
    }

    @RequestMapping(path = "beers", method = RequestMethod.GET)
    public List<Beer> list() {
        return beerDAO.listAllBeers();
    }
}
