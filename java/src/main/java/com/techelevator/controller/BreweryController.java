package com.techelevator.controller;

import com.techelevator.dao.BreweryDAO;
import com.techelevator.model.Brewery;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@CrossOrigin
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

    @RequestMapping(path = "breweries/{breweryId}", method = RequestMethod.GET)
    public Brewery retrieve( @PathVariable (name ="breweryId") int breweryId){
        return breweryDAO.getBrewery(breweryId);
    }

    @RequestMapping(path="/breweries", method= RequestMethod.POST)
    public Brewery add(@RequestBody Brewery brewery) {
        return breweryDAO.createBrewery(brewery);
    }

    @RequestMapping(path="/breweries/{id}", method= RequestMethod.PUT)
    public void update(@PathVariable int id, @RequestBody Brewery brewery) {
            breweryDAO.update(brewery);
    }

}
