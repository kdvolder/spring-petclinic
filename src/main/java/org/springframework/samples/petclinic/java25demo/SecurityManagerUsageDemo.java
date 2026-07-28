package org.springframework.samples.petclinic.java25demo;

/**
 * Demo-only class exercising the Java 25 recipe {@code RemoveSecurityManagerApi}: the
 * Security Manager was permanently disabled in JEP 486, so guarded/dead calls against it
 * can be removed.
 */
public class SecurityManagerUsageDemo {

	void readConfigFile(String path) {
		SecurityManager sm = System.getSecurityManager();
		if (sm != null) {
			sm.checkRead(path);
		}
		System.out.println("Reading " + path);
	}

}
