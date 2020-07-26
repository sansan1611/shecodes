package model;

public class Country {
	private int countryId;
	private String countryName;
	private int cases;
	private int todayCases;
	private int deaths;
	private int todayDeaths;
	private int recovered;
	private int active;

	public Country() {
	}

	public Country(int countryId, String countryName, int cases, int todayCases, int deaths, int todayDeaths,
			int recovered, int active) {
		this.countryId = countryId;
		this.countryName = countryName;
		this.cases = cases;
		this.todayCases = todayCases;
		this.deaths = deaths;
		this.todayDeaths = todayDeaths;
		this.recovered = recovered;
		this.active = active;

	}

	public Country(String countryName, int cases, int todayCases, int deaths, int todayDeaths, int recovered,
			int active) {
		this.countryName = countryName;
		this.cases = cases;
		this.todayCases = todayCases;
		this.deaths = deaths;
		this.todayDeaths = todayDeaths;
		this.recovered = recovered;
		this.active = active;
	}

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public int getCases() {
		return cases;
	}

	public void setCases(int cases) {
		this.cases = cases;
	}

	public int getTodayCases() {
		return todayCases;
	}

	public void setTodayCases(int todayCases) {
		this.todayCases = todayCases;
	}

	public int getDeaths() {
		return deaths;
	}

	public void setDeaths(int deaths) {
		this.deaths = deaths;
	}

	public int getTodayDeaths() {
		return todayDeaths;
	}

	public void setTodayDeaths(int todayDeaths) {
		this.todayDeaths = todayDeaths;
	}

	public int getRecovered() {
		return recovered;
	}

	public void setRecovered(int recovered) {
		this.recovered = recovered;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

}
