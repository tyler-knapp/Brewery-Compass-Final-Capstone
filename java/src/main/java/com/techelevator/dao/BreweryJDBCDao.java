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

    public BreweryJDBCDao( JdbcTemplate jdbcTemplate){
        this.jdbcTemplate =jdbcTemplate;
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
        }

        return brewery;
    }

    private Brewery mapRowToBrewery(SqlRowSet rs){
        Brewery brewery = new Brewery();
        brewery.setBreweryId(rs.getInt("brewery_id"));
        brewery.setName(rs.getString("brewery_name"));
        brewery.setDescription(rs.getString("description"));
        brewery.setLocation(rs.getString("brewery_location"));
        return brewery;
    }
}
