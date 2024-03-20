package com.github.davidmoten.geo;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class Base32Test {

    @Test
    public void testEncodeBase32PositiveLong() {
        String encode = Base32.encodeBase32(75324, 4);
        assertEquals("29jw", encode);
    }

    @Test
    public void testEncodeBase32ZeroLong() {
        String encode = Base32.encodeBase32(0, 4);
        assertEquals("0000", encode);
    }

    @Test
    public void testEncodeBase32NegativeLong() {
        String encode = Base32.encodeBase32(-1, 4);
        assertEquals("-0001", encode);
    }

    @Test
    public void testEncodeBase32PositiveLongWithMaxLength() {
        String encode = Base32.encodeBase32(75324);
        assertEquals("0000000029jw", encode);
    }

    @Test
    public void testEncodeBase32ZeroLongWithMaxLength() {
        String encode = Base32.encodeBase32(0);
        assertEquals("000000000000", encode);
    }

    @Test
    public void testEncodeBase32NegativeLongWithMaxLength() {
        String encode = Base32.encodeBase32(-1);
        assertEquals("-000000000001", encode);
    }

    @Test
    public void testDecodeBase32Positive() {
        long decode = Base32.decodeBase32("29jw");
        assertEquals(75324, decode);
    }

    @Test
    public void testDecodeBase32Zero() {
        long decode = Base32.decodeBase32("0000");
        assertEquals(0, decode);
    }

    @Test
    public void testDecodeBase32Negative() {
        long decode = Base32.decodeBase32("-0001");
        assertEquals(-1, decode);
    }
}
