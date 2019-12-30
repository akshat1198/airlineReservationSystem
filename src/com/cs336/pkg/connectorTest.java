package com.cs336.pkg;

import static org.junit.Assert.*;

import org.junit.Test;

public class connectorTest {

	@Test
	public void test() {
		connector inital = new connector();
		assertEquals(true,inital.isconnected());
	}

}
