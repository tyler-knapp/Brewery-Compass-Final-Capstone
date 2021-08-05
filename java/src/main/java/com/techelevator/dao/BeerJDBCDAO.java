package com.techelevator.dao;

import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class BeerJDBCDAO implements BeerDAO {

    private JdbcTemplate jdbcTemplate;

    public BeerJDBCDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Beer> listAllBeers(int id) {
        List<Beer> beers = new ArrayList<>();

        String sql= "SELECT * FROM beers WHERE brewery_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
        while(results.next()) {
            Beer beer = mapRowToBeer(results);
            beers.add(beer);
        }
        return beers;
    }

    @Override
    public Beer getBeerInfoByBeerId(int beerId, int breweryId) {
        Beer beer = null;

        String sql= "SELECT beer_name, beer_image FROM beers WHERE brewery_id = ? AND beer_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, beerId, breweryId);
        if(results.next()){
            beer = mapRowToBeer(results);
        } else {
            throw new RuntimeException("Beer "+ beerId +" was not found.");
        }
        return beer;
    }

    private Beer mapRowToBeer(SqlRowSet rs){
        Beer beer = new Beer();
        beer.setBeerId(rs.getInt("beer_id"));
        beer.setName(rs.getString("beer_name"));
        beer.setImageUrl(rs.getString("beer_image"));
        return beer;
    }
}


