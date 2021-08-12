package com.techelevator.dao;

import com.techelevator.model.Brewery;
import com.techelevator.model.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class BreweryJDBCDao implements BreweryDAO{

    private JdbcTemplate jdbcTemplate;

    public BreweryJDBCDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Brewery> findAll() {
        List<Brewery> breweries = new ArrayList<>();

        String sql = "SELECT * FROM breweries";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {
            Brewery brewery = mapRowToBrewery(results);
            breweries.add(brewery);
        }
        return breweries;
    }

    @Override
    public Brewery getBrewery(int breweryId) {
        Brewery brewery = new Brewery();

        String sql = "SELECT * FROM breweries WHERE brewery_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);

        if(results.next()){
            brewery = mapRowToBrewery(results);
        } else {
            throw new RuntimeException("Brewery "+ breweryId +" was not found.");
        }

        return brewery;
    }

    @Override
    public Brewery createBrewery(Brewery brewery) {

        String sql = "INSERT INTO breweries (brewery_id, brewery_name, brewery_state, brewery_city, brewery_address, brewery_zip_code, brewery_phone_number, brewery_website_url, description, image_url) VALUES (DEFAULT, ?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING brewery_id";
        int id = jdbcTemplate.queryForObject(sql, Integer.class, brewery.getName(), brewery.getState(), brewery.getCity(), brewery.getAddress(), brewery.getZipCode(), brewery.getPhoneNumber(), brewery.getWebsiteUrl(), brewery.getDescription(), brewery.getImageUrl());
        brewery.setBreweryId(id);

        return brewery;
    }

    @Override
    public void update(Brewery brewery) {
        String sql = "UPDATE breweries SET brewery_name = ?, brewery_state = ?, brewery_city = ?, brewery_address = ?, " +
                "brewery_zip_code = ?, brewery_phone_number = ?, brewery_website_url = ?, description = ?, image_url = ? " +
                "WHERE brewery_id = ?";
        jdbcTemplate.update(sql, brewery.getName(), brewery.getState(), brewery.getCity(), brewery.getAddress(), brewery.getZipCode(),
                brewery.getPhoneNumber(), brewery.getWebsiteUrl(), brewery.getDescription(), brewery.getImageUrl(), brewery.getBreweryId());
    }

    private Brewery mapRowToBrewery(SqlRowSet rs){
        Brewery brewery = new Brewery();
        brewery.setBreweryId(rs.getInt("brewery_id"));
        brewery.setName(rs.getString("brewery_name"));
        brewery.setDescription(rs.getString("description"));
        brewery.setState(rs.getString("brewery_state"));
        brewery.setCity(rs.getString("brewery_city"));
        brewery.setAddress(rs.getString("brewery_address"));
        brewery.setZipCode(rs.getString("brewery_zip_code"));
        brewery.setPhoneNumber(rs.getString("brewery_phone_number"));
        brewery.setWebsiteUrl(rs.getString("brewery_website_url"));
        brewery.setImageUrl(rs.getString("image_url"));
        return brewery;
    }
}
