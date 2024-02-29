package com.github.davidmoten.geo;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class Base32Test {

    @Test
    public void testEncodeBase32() {
        String encode = Base32.encodeBase32(75324, 4);
        assertEquals("29jw", encode);
    }

    @Test
    public void testDecodeBase32() {
        long decode = Base32.decodeBase32("29jw");
        assertEquals(75324, decode);
    }
}
