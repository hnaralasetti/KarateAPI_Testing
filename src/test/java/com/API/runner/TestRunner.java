package com.API.runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.function.Consumer;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import static org.junit.Assert.*;
import org.junit.Test;

public class TestRunner {
	@Test
	public void testParallel() {
		Results results = Runner.path("classpath:").outputCucumberJson(true).tags("@MultiDataJson").parallel(2);
//        		.tags("@BasicMethods").parallel(1);
		generateReport(results.getReportDir());
		System.out.println("Report Directory is " + results.getReportDir());
		assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
	}

	public static void generateReport(String karateOutputPath) {
		Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
		final List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
		jsonFiles.forEach(new Consumer<File>() {
			@Override
			public void accept(File file) {
				jsonPaths.add(file.getAbsolutePath());
			}
		});
		Configuration config = new Configuration(new File("target"), "demo");
		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
		reportBuilder.generateReports();
	}
}
