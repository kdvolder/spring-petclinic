package org.springframework.samples.petclinic.java25demo;

import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;

/**
 * Demo-only class exercising the Java 25 recipe {@code MigrateStringReaderToReaderOf}: a
 * thread-confined local {@code Reader} that's only used via calls on itself (never
 * escapes its method) can safely switch from the synchronized {@code StringReader} to the
 * non-synchronized {@code Reader.of(..)} factory.
 */
public class StringReaderDemo {

	int firstCharacter(String text) throws IOException {
		Reader r = new StringReader(text);
		int c = r.read();
		r.close();
		return c;
	}

}
