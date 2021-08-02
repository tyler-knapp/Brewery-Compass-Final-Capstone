package com.techelevator.model;

public class Brewery {


    private int breweryId;
    private String name;
    private String location;
    private String imageUrl;
    private String description;


    public Brewery() {

    }



    public Brewery(int breweryId, String name, String location, String description, String imageUrl){
        this.breweryId = breweryId;
        this.name = name;
        this.description = description;
        this.location = location;
        this.imageUrl = imageUrl;
    }
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    public int getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(int breweryId) {
        this.breweryId = breweryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
