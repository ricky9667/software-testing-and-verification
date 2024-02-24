package com.github.davidmoten.geo;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.Set;
import java.util.TreeSet;

import static org.junit.Assert.*;

public class CoverageTest {

    private Coverage coverage;

    private final Set<String> hashes = new TreeSet<String>();

    private final double ratio = 0.5;

    private final String taipei101GeoHash = "wsqqqjhw9yw767cn";
    private final String tokyoSkytreeGeoHash = "xn77jk5fzrzf8rc2";
    private final String seoulTowerGeoHash = "wydm9eumx62fnfw6y";

    @Before
    public void setUp() {
        hashes.add(taipei101GeoHash);
        hashes.add(tokyoSkytreeGeoHash);

        coverage = new Coverage(hashes, ratio);
    }

    @After
    public void tearDown() {
        coverage = null;
        hashes.clear();
    }

    @Test
    public void testGetHashes() {
        final Set<String> actualHashes = coverage.getHashes();
        assertTrue(actualHashes.contains(taipei101GeoHash));
        assertTrue(actualHashes.contains(tokyoSkytreeGeoHash));
        assertFalse(actualHashes.contains(seoulTowerGeoHash)); // not added
    }

    @Test
    public void testGetRatio() {
        assertEquals(ratio, coverage.getRatio(), 0.0);
    }

    @Test
    public void testGetHashLength() {
        assertEquals(taipei101GeoHash.length(), coverage.getHashLength());
    }

    @Test
    public void testToString() {
        String expectedString = "Coverage [hashes=[" + taipei101GeoHash + ", " + tokyoSkytreeGeoHash
                + "], ratio=" + ratio + "]";
        assertEquals(expectedString, coverage.toString());
    }
}