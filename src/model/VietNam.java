package model;

public class VietNam {
	private int id;
	private String name;
	private int cases;
	private int active;
	private int deaths;
	private int recovered;

	public VietNam() {

	}

	public VietNam(int id, String name, int cases, int active, int deaths, int recovered) {
		super();
		this.id = id;
		this.name = name;
		this.cases = cases;
		this.active = active;
		this.deaths = deaths;
		this.recovered = recovered;
	}

	public VietNam(String name, int cases, int active, int deaths, int recovered) {
		super();
		this.name = name;
		this.cases = cases;
		this.active = active;
		this.deaths = deaths;
		this.recovered = recovered;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCases() {
		return cases;
	}

	public void setCases(int cases) {
		this.cases = cases;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public int getDeaths() {
		return deaths;
	}

	public void setDeaths(int deaths) {
		this.deaths = deaths;
	}

	public int getRecovered() {
		return recovered;
	}

	public void setRecovered(int recovered) {
		this.recovered = recovered;
	}

}
