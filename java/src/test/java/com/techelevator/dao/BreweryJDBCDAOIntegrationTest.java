package com.techelevator.dao;

import com.techelevator.model.Brewery;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class BreweryJDBCDAOIntegrationTest extends DAOIntegrationTest{

    private JdbcTemplate jdbcTemplate;
    private BreweryDAO breweryDAO;

    @Before
    public void setup(){
        jdbcTemplate = new JdbcTemplate(getDataSource());
        breweryDAO = new BreweryJDBCDao(jdbcTemplate);
    }

    @Test
    public void findAllBrewery() {
        List<Brewery> originalBreweryList = breweryDAO.findAll();

        Brewery brewery = getBrewery("Test Name", "Test Name", "Test State", "Test City", "Test Address", "Test ZipCode", "Test Number", "Test WebsiteUrl", "Test Description" );
        breweryDAO.createBrewery(brewery);

        List<Brewery> updatedBreweryList = breweryDAO.findAll();
        Assert.assertEquals(originalBreweryList.size() + 1, updatedBreweryList.size());

    }

    @Test
    public void retrieveSingleBrewery(){
        Brewery brewery = getBrewery( "Test Name","Test Name", "Test State", "Test City", "Test Address", "Test ZipCode", "Test Number", "Test WebsiteUrl", "Test Description" );

        breweryDAO.createBrewery(brewery);

        Brewery breweryFromDatabase = breweryDAO.getBrewery(brewery.getBreweryId());

        Assert.assertNotNull("Brewery was null",breweryFromDatabase);
        Assert.assertEquals("Test Name",  breweryFromDatabase.getName());
    }


    private Brewery getBrewery(String name,  String state, String city, String address, String zipCode, String phoneNumber, String websiteUrl, String description, String imageUrl ){
        Brewery brewery = new Brewery();

        brewery.setName(name);
        brewery.setState(state);
        brewery.setCity(city);
        brewery.setAddress(address);
        brewery.setZipCode(zipCode);
        brewery.setPhoneNumber(phoneNumber);
        brewery.setWebsiteUrl(websiteUrl);
        brewery.setDescription(description);
        brewery.setImageUrl(imageUrl);
        return brewery;

    }






}
