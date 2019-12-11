package com.oyr.webapp.dto;

public class LocationDto {
	   private double lat;
	   private double lng;
	   
	   public LocationDto() {
	   }
	   public LocationDto(double lat, double lng) {
	      this.lat = lat;
	      this.lng = lng;
	   }
	   
	   public double getLat() {
	      return lat;
	   }
	   public void setLat(double lat) {
	      this.lat = lat;
	   }
	   public double getLng() {
	      return lng;
	   }
	   public void setLng(double lng) {
	      this.lng = lng;
	   }
	}