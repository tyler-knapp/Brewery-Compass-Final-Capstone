package com.techelevator.dao;

import com.techelevator.model.Brewery;

import java.util.List;

public interface BreweryDAO {

    List<Brewery> findAll();

    Brewery getBrewery(int breweryId);

    Brewery createBrewery(Brewery brewery);

    void update(Brewery brewery);



}
