package com.API.Utility;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

public class JavaFunctions {

	public static void writeData(Object arg) throws FileNotFoundException, UnsupportedEncodingException {

		PrintWriter writer = new PrintWriter("data.json");
		writer.println(arg.toString());
		writer.close();

	}
}
