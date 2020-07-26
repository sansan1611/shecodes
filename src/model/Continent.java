package model;

public class Continent {
	private int continentId;
	private String continentName;
	private int cases;
	private int todayCases;
	private int deaths;
	private int todayDeaths;
	private int recovered;
	private int active;

	public Continent() {

	}

	public Continent(String continentName, int cases, int todayCases, int deaths, int todayDeaths, int recovered,
			int active) {
		super();
		this.continentName = continentName;
		this.cases = cases;
		this.todayCases = todayCases;
		this.deaths = deaths;
		this.todayDeaths = todayDeaths;
		this.recovered = recovered;
		this.active = active;
	}

	public Continent(int continentId, String continentName, int cases, int todayCases, int deaths, int todayDeaths,
			int recovered, int active) {
		super();
		this.continentId = continentId;
		this.continentName = continentName;
		this.cases = cases;
		this.todayCases = todayCases;
		this.deaths = deaths;
		this.todayDeaths = todayDeaths;
		this.recovered = recovered;
		this.active = active;
	}

	public int getContinentId() {
		return continentId;
	}

	public void setContinentId(int continentId) {
		this.continentId = continentId;
	}

	public String getContinentName() {
		return continentName;
	}

	public void setContinentName(String continentName) {
		this.continentName = continentName;
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
