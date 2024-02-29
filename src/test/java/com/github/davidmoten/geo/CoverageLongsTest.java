package com.github.davidmoten.geo;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class CoverageLongsTest {

    private CoverageLongs coverageLongs;

    private final long[] hashes = new long[2];

    private final double ratio = 0.5;

    private final String taipei101GeoHash = "wsqqqjhw9yw767cn";
    private final String tokyoSkytreeGeoHash = "xn77jk5fzrzf8rc2";

    @Before
    public void setUp() {
        hashes[1] = Base32.decodeBase32(taipei101GeoHash);
        hashes[0] = Base32.decodeBase32(tokyoSkytreeGeoHash);

        coverageLongs = new CoverageLongs(hashes, 2, ratio);
    }

    @After
    public void tearDown() {
    }

    @Test
    public void testGetHashes() {
        final long[] actualHashes = coverageLongs.getHashes();
        assertEquals(hashes[0], actualHashes[0]);
        assertEquals(hashes[1], actualHashes[1]);
    }

    @Test
    public void testGetRatio() {
        assertEquals(ratio, coverageLongs.getRatio(), 0.0);
    }

    @Test
    public void testGetCount() {
        assertEquals(2, coverageLongs.getCount());
    }
}