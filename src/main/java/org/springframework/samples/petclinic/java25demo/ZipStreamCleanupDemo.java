package org.springframework.samples.petclinic.java25demo;

import java.util.zip.Deflater;

/**
 * Demo-only class exercising the Java 25 recipe {@code ReplaceZipEndWithClose}: in Java
 * 25, {@code Deflater}/{@code Inflater} implement {@code AutoCloseable}, so
 * {@code close()} replaces {@code end()}, and the try/finally cleanup pattern below
 * becomes try-with-resources.
 */
public class ZipStreamCleanupDemo {

	byte[] compress(byte[] data) {
		Deflater deflater = new Deflater();
		try {
			deflater.setInput(data);
			deflater.finish();
			byte[] output = new byte[data.length * 2];
			int length = deflater.deflate(output);
			byte[] result = new byte[length];
			System.arraycopy(output, 0, result, 0, length);
			return result;
		}
		finally {
			deflater.end();
		}
	}

}
