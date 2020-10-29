package com.example.libs.model;

public class CityVO {
	private int id, population;
	private String name, countryCode, district;
	
	public CityVO(int id, String name, String countryCode, String district, int population) {
		this.id = id;
		this.name = name;
		this.countryCode = countryCode;
		this.district = district;
		this.population = population;
	}

	@Override
	public String toString() {
		String str = "<tr><td>%d</td><td>%s</td><td>%s</td>" +
					 "<td>%s</td><td>%,d</td></tr>";
		return String.format(str, this.id, this.name, this.countryCode, this.district, this.population);
	}
	
	
}
