package model;

import java.nio.charset.StandardCharsets;

public final class Article {
	private String provider;
	private String link;
	private String title;
	private String imgUrl;

	public Article() {
	}

	public Article(String provider, String link, String title, String imgUrl) {
		this.provider = provider;
		this.link = link;
		this.title = new String(title.getBytes(), StandardCharsets.UTF_8);
		this.imgUrl = imgUrl;
	}

	public String getProvider() {
		return provider;
	}

	public String getTitle() {
		return title;
	}

	public String getLink() {
		return link;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	@Override
	public String toString() {
		return getClass().getSimpleName() + ":(" + "provider=" + provider + ", title=" + title + ", link=" + link
				+ ", imgUrl=" + imgUrl + ")";
	}
}
