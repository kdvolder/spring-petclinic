package org.springframework.samples.petclinic.java25demo;

/**
 * Demo-only class exercising the Java 25 recipe {@code ReplaceSystemOutWithIOPrint}:
 * {@code System.out.println}/{@code print} are migrated to the {@code java.lang.IO}
 * convenience methods added by JEP 512.
 */
public class ConsoleOutputDemo {

	void greet(String name) {
		System.out.println("Hello, " + name);
	}

}
