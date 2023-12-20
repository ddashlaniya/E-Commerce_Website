//package features;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.InputStreamReader;
//import java.net.MalformedURLException;
//import java.net.URL;
//
//public class FetchOnlineData {
//
//	public String fetchDataOnline() {
//		try {
//		URL url = new URL("https://www.youtube.com/");
//        InputStream is =  url.openStream();
//        	BufferedReader br = new BufferedReader(new InputStreamReader(is);
//            String line;
//            while ((line = br.readLine()) != null) {
//              //  out.println(line);
//            	return line;
//            }
//        }
//        catch (MalformedURLException e) {
//            e.printStackTrace();
//            throw new MalformedURLException("URL is malformed!!");
//        }
//        catch (IOException e) {
//            e.printStackTrace();
//            throw new IOException();
//        }
//
//    }
//
//	}
//
