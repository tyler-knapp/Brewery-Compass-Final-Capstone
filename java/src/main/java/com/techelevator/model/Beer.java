package com.techelevator.model;

public class Beer {

    private int beerId;
    private String name;
    private String abv;
    private String ibu;
    private String beerDescription;
    private String imageUrl;
    private int breweryId;

    public Beer(){

    }

    public Beer(int beerId, String name, String imageUrl, int breweryId, String abv, String ibu, String beerDescription) {
        this.beerId = beerId;
        this.name = name;
        this.imageUrl = imageUrl;
        this.breweryId = breweryId;
        this.abv = abv;
        this.ibu = ibu;
        this.beerDescription = beerDescription;
    }

    public String getAbv() {
        return abv;
    }

    public void setAbv(String abv) {
        this.abv = abv;
    }

    public String getIbu() {
        return ibu;
    }

    public void setIbu(String ibu) {
        this.ibu = ibu;
    }

    public String getBeerDescription() {
        return beerDescription;
    }

    public void setBeerDescription(String beerDescription) {
        this.beerDescription = beerDescription;
    }

    public int getBeerId() {
        return beerId;
    }

    public void setBeerId(int beerId) {
        this.beerId = beerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUr) {
        this.imageUrl = imageUr;
    }

    public int getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(int breweryId) {
        this.breweryId = breweryId;
    }
}
