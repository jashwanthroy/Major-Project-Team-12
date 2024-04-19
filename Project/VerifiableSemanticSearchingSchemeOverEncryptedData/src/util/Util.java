package util;

import java.io.BufferedReader;
import java.io.FileReader;

public class Util {

	public  static String readFileToString(String filePath)
			throws java.io.IOException{

		StringBuffer fileData = new StringBuffer(1000);
		BufferedReader reader = new BufferedReader(
				new FileReader(filePath));
		char[] buf = new char[1024];

		int numRead=0;
		while((numRead=reader.read(buf)) != -1){
			String readData = String.valueOf(buf, 0, numRead);
			fileData.append(readData);
			buf = new char[1024];
		}

		reader.close();
		System.out.println(fileData.toString());
		return fileData.toString();
	}
}
