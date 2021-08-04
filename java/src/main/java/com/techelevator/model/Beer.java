package com.techelevator.model;

public class Beer {

    private int beerId;
    private String name;
    private String imageUrl;

    public Beer(){

    }

    public Beer(int beerId, String name, String imageUrl) {
        this.beerId = beerId;
        this.name = name;
        this.imageUrl = imageUrl;
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
}
