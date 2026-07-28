package org.springframework.samples.petclinic.java25demo;

import java.io.IOException;
import java.util.List;

/**
 * Demo-only class exercising the Java 25 recipe
 * {@code ReplaceUnusedVariablesWithUnderscore}: an unused catch-clause, for-each loop, or
 * lambda parameter is renamed to the JEP 456 unnamed variable {@code _} once the project
 * targets Java 22+.
 */
public class UnusedVariablesDemo {

	void logFailureOnly() {
		try {
			doWork();
		}
		catch (IOException e) {
			System.out.println("failed");
		}
	}

	int countOwners(List<String> owners) {
		int count = 0;
		for (String owner : owners) {
			count++;
		}
		return count;
	}

	void printKeys(List<String> owners) {
		owners.forEach(owner -> System.out.println("owner present"));
	}

	private void doWork() throws IOException {
	}

}
