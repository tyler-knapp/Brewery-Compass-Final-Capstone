package com.techelevator.dao;

import com.techelevator.model.Beer;

import java.util.List;

public interface BeerDAO {

    List<Beer> listAllBeers(int id);

    Beer getBeerInfoByBeerId(int beerId, int breweryId);

    Beer createBeer(Beer beer);
}