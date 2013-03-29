package reports;

import org.jsoup.Jsoup;

public class getInfo {

	/**
	 * @param args
	 */
	public static String html2text(String html) {
	    return Jsoup.parse(html).text();
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println(html2text("<html><head>in head</head><body><h1>kdjhfgadshf</h1></body></html>"));

	}

}
