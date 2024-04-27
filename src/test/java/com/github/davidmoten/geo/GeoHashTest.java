package com.github.davidmoten.geo;

import org.junit.Test;

import java.util.Collections;
import java.util.List;

import static org.junit.Assert.*;

public class GeoHashTest {
    @Test
    public void testAdjacentHashTop() {
        String hash = GeoHash.adjacentHash("gbsuv", Direction.TOP);
        assertEquals("gbsvj", hash);
    }

    @Test
    public void testAdjacentHashBottom() {
        String hash = GeoHash.adjacentHash("gbsuv", Direction.BOTTOM);
        assertEquals("gbsut", hash);
    }

    @Test
    public void testAdjacentHashLeft() {
        String hash = GeoHash.adjacentHash("gbsuv", Direction.LEFT);
        assertEquals("gbsuu", hash);
    }

    @Test
    public void testAdjacentHashRight() {
        String hash = GeoHash.adjacentHash("gbsuv", Direction.RIGHT);
        assertEquals("gbsuy", hash);
    }

    @Test
    public void testTop() {
        String hash = GeoHash.top("gbsuv");
        assertEquals("gbsvj", hash);
    }

    @Test
    public void testBottom() {
        String hash = GeoHash.bottom("gbsuv");
        assertEquals("gbsut", hash);
    }

    @Test
    public void testLeft() {
        String hash = GeoHash.left("gbsuv");
        assertEquals("gbsuu", hash);
    }

    @Test
    public void testRight() {
        String hash = GeoHash.right("gbsuv");
        assertEquals("gbsuy", hash);
    }

    @Test
    public void testAdjacentHashWithStep() {
        String hash = GeoHash.adjacentHash("gbsuv", Direction.TOP, 2);
        assertEquals("gbsvm", hash);
    }

    @Test
    public void testNeighbours() {
        List<String> hashes = GeoHash.neighbours("gbsuv");
        assertTrue(hashes.contains("gbsvj"));
        assertTrue(hashes.contains("gbsut"));
        assertTrue(hashes.contains("gbsuu"));
        assertTrue(hashes.contains("gbsuy"));
        assertTrue(hashes.contains("gbsvh"));
        assertTrue(hashes.contains("gbsvn"));
        assertTrue(hashes.contains("gbsus"));
        assertTrue(hashes.contains("gbsuw"));
    }

    @Test
    public void testEncodeHash() {
        String hash = GeoHash.encodeHash(48.669, -4.329, 5);
        assertEquals("gbsuv", hash);
    }

    @Test
    public void testDecodeHash() {
        LatLong latLong = GeoHash.decodeHash("gbsuv");
        assertEquals(48.669, latLong.getLat(), 0.001);
        assertEquals(-4.329, latLong.getLon(), 0.001);
    }

    @Test
    public void testHashLengthToCoverBoundingBoxNormal() {
        int length = GeoHash.hashLengthToCoverBoundingBox(48.1, -4.1, 48.2, -4.2);
        assertEquals(3, length);
    }

    @Test
    public void testHashLengthToCoverBoundingBoxZero() {
        int length = GeoHash.hashLengthToCoverBoundingBox(-90, 0, 0, 180);
        assertEquals(0, length);
    }

    @Test
    public void testHashContains() {
        assertTrue(GeoHash.hashContains("gbsuv", 48.669, -4.329));
    }

    @Test
    public void testHashContainsFail() {
        assertFalse(GeoHash.hashContains("wsqqq", 48.669, -4.329));
    }

    @Test
    public void testCoverBoundingBox() {
        Coverage coverage = GeoHash.coverBoundingBox(48.2, -4.2, 48.1, -4.1, 3);
        assertEquals(1, coverage.getHashes().size());
    }

    @Test(expected = IllegalArgumentException.class)
    public void testCoverBoundingBoxFail() {
        GeoHash.coverBoundingBox(48.1, -4.1, 48.2, -4.2, 3);
    }

    @Test
    public void testHeightDegrees() {
        assertEquals(45.0, GeoHash.heightDegrees(1), 0.001);
    }

    @Test
    public void testHeightDegreesOverHashLength() {
        double expected = 1.3096 * Math.pow(10, -9);
        assertEquals(expected, GeoHash.heightDegrees(15), 0.001);
    }

    @Test
    public void testWidthDegrees() {
        assertEquals(45.0, GeoHash.widthDegrees(1), 0.001);
    }

    @Test
    public void testWidthDegreesOverHashLength() {
        double expected = 1.3096 * Math.pow(10, -9);
        assertEquals(expected, GeoHash.widthDegrees(15), 0.001);
    }

    @Test
    public void testGridAsStringWithSize() {
        String grid = GeoHash.gridAsString("dr", 1, Collections.<String>emptySet());
        assertEquals("f0 f2 f8 \ndp dr dx \ndn dq dw \n", grid);
    }

    @Test
    public void testGridAsStringWithDimensions() {
        String grid = GeoHash.gridAsString("dr", -1, -1, 1, 1);
        assertEquals("f0 f2 f8 \ndp dr dx \ndn dq dw \n", grid);
    }

    @Test
    public void testGridAsStringWithDimensionsAndHighlights() {
        String grid = GeoHash.gridAsString("dr", -1, -1, 1, 1, Collections.<String>emptySet());
        assertEquals("f0 f2 f8 \ndp dr dx \ndn dq dw \n", grid);
    }
}
