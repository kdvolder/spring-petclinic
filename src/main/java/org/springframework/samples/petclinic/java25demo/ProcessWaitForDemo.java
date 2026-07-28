package org.springframework.samples.petclinic.java25demo;

import java.util.concurrent.TimeUnit;

/**
 * Demo-only class exercising the Java 25 recipe {@code MigrateProcessWaitForDuration}:
 * {@code Process.waitFor(long, TimeUnit)} is migrated to the {@code Duration}-based
 * overload added in Java 25.
 */
public class ProcessWaitForDemo {

	void runBackupScript(Process process) throws InterruptedException {
		process.waitFor(30, TimeUnit.SECONDS);
	}

}
