package com.techelevator.dao;

import com.techelevator.model.Brewery;

import java.util.List;

public interface BreweryDAO {

    List<Brewery> findAll(); //get all brewerys

    Brewery getBrewery(int breweryId); //get a brewery

    Brewery createBrewery(Brewery brewery);

    void update(Brewery brewery);



}
