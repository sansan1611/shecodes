package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;

import model.Article;
import model.Continent;
import model.Country;
import model.Link;
import model.VietNam;
import dao.VietNamDAO;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

import org.glassfish.jersey.client.ClientConfig;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class Index1
 */
@WebServlet("/")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VietNamDAO vietnam;
	private static String url = "http://localhost:8082/CoronaStatistic/articles";

	public void init() {
		vietnam = new VietNamDAO();
	}

	public Index() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/chart":
				vietnamChart(request, response);
				break;
			case "/vietnam":
				vietnamStatistic(request, response);
				break;
			case "/continent":
				allContinentStatistic(request, response);
				break;
			case "/news":
				news(request, response);
				break;
			default:
				index(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Country> list = new ArrayList<>();
		String url = "https://corona.lmao.ninja/v2/countries";
		URL obj = new URL(url);

		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.addRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)");
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuilder response2 = new StringBuilder();
		while ((inputLine = in.readLine()) != null) {
			response2.append(inputLine);
		}
		in.close();
		try {
			JSONArray myResponse = new JSONArray(response2.toString());
			for (int i = 0; i < myResponse.length(); i++) {
				JSONObject res = new JSONObject(myResponse.get(i).toString());
				String countryName = (String) res.get("country");
				int cases = (int) res.get("cases");
				int todayCases = (int) res.get("todayCases");
				int deaths = (int) res.get("deaths");
				int todayDeaths = (int) res.get("todayDeaths");
				int recovered = (int) res.get("recovered");
				int active = (int) res.get("active");
				Country c = new Country(countryName, cases, todayCases, deaths, todayDeaths, recovered, active);
				list.add(c);
			}
			request.setAttribute("listCountry", list);
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		} catch (JSONException e) {
			e.printStackTrace();
		}

	}

	public void news(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		List<Article> listArticle = new ArrayList<>();
		URL obj = new URL(url);

		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.addRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)");
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuilder response2 = new StringBuilder();
		while ((inputLine = in.readLine()) != null) {
			response2.append(inputLine);
		}
		in.close();
		try {

			JSONArray myResponse = new JSONArray(response2.toString());
			for (int i = 0; i < myResponse.length(); i++) {
				JSONObject json = new JSONObject(myResponse.get(i).toString());
				String provider = (String) json.get("provider");
				String link = (String) json.get("link");
				String title = json.get("title").toString();
				String imgUrl = (String) json.get("imgUrl");
				Article c = new Article(provider, link, title, imgUrl);
				listArticle.add(c);

			}
			request.setAttribute("listArticle", listArticle);
			RequestDispatcher dispatcher = request.getRequestDispatcher("news.jsp");
			dispatcher.forward(request, response);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void allContinentStatistic(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Continent> list = new ArrayList<>();
		String url = "https://corona.lmao.ninja/v2/continents";
		URL obj = new URL(url);

		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.addRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)");
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuilder response2 = new StringBuilder();
		while ((inputLine = in.readLine()) != null) {
			response2.append(inputLine);
		}
		in.close();
		try {
			JSONArray myResponse = new JSONArray(response2.toString());
			for (int i = 0; i < myResponse.length(); i++) {
				JSONObject res = new JSONObject(myResponse.get(i).toString());
				String continentName = (String) res.get("continent");
				int cases = (int) res.get("cases");
				int todayCases = (int) res.get("todayCases");
				int deaths = (int) res.get("deaths");
				int todayDeaths = (int) res.get("todayDeaths");
				int recovered = (int) res.get("recovered");
				int active = (int) res.get("active");
				Continent c = new Continent(continentName, cases, todayCases, deaths, todayDeaths, recovered, active);
				list.add(c);
			}
			request.setAttribute("listContinent", list);
			RequestDispatcher dispatcher = request.getRequestDispatcher("continent.jsp");
			dispatcher.forward(request, response);
		} catch (JSONException e) {
			e.printStackTrace();
		}

	}

	private void vietnamStatistic(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<VietNam> vietnamStatistic = vietnam.selectVietNam();
		request.setAttribute("vietnamStatistic", vietnamStatistic);
		RequestDispatcher dispatcher = request.getRequestDispatcher("vietnam.jsp");
		dispatcher.forward(request, response);

	}

	private void vietnamChart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Gson gson = new Gson();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.println(gson.toJson(vietnam.selectVietNam()));
	}

}
