package com.github.davidmoten.geo.mem;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class GeomemTest {

    private Geomem<String, String> geomem;

    @Before
    public void setUp() {
        geomem = new Geomem<String, String>();
    }

    @After
    public void tearDown() {
        geomem = null;
    }

    @Test
    public void testFind() {
        Iterable<Info<String, String>> infos = geomem.find(40.0, -70.0, 30.0, -50.0, 0, Long.MAX_VALUE);
        int size = getIterableSize(infos);
        assertEquals(0, size);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testFindFail() {
        Iterable<Info<String, String>> infos = geomem.find(40.0, -70.0, 50.0, -50.0, 0, Long.MAX_VALUE);
    }

    private int getIterableSize(Iterable<Info<String, String>> infos) {
        int size = 0;
        for (Info<String, String> info : infos) {
            size++;
        }
        return size;
    }
}