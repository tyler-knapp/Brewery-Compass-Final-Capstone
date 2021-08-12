package com.techelevator.model;

public class Beer {

    private int beerId;
    private String name;
    private String imageUrl;
    private int breweryId;

    public Beer(){

    }

    public Beer(int beerId, String name, String imageUrl, int breweryId) {
        this.beerId = beerId;
        this.name = name;
        this.imageUrl = imageUrl;
        this.breweryId = breweryId;
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
