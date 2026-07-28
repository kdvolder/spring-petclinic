package org.springframework.samples.petclinic.java25demo;

import java.util.zip.ZipError;

/**
 * Demo-only class exercising the Java 25 recipe {@code ReviewZipErrorUsage}: every
 * reference to {@code java.util.zip.ZipError} is flagged for human review (the JDK hasn't
 * thrown one since Java 9), rather than being blanket-retyped to {@code ZipException}.
 */
public class ZipErrorUsageDemo {

	void exportPetPhotos() {
		try {
			doExport();
		}
		catch (ZipError e) {
			// handle it
		}
	}

	private void doExport() {
	}

}
