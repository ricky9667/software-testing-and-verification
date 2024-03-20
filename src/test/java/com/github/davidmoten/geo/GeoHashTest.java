package com.github.davidmoten.geo;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

public class GeoHashTest {

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }

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
}
