package com.github.davidmoten.geo.mem;

import com.google.common.base.Optional;
import com.google.common.base.Predicate;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

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

    @Test
    public void testCreateRegionFilterWithInfoInPredicate() {
        Predicate<Info<String, String>> predicate = geomem.createRegionFilter(50.0, -70.0, 40.0, -50.0);
        Info<String, String> info = new Info<String, String>(45.0, -60.0, 1708757706, "test", Optional.of("test"));

        assertTrue(predicate.apply(info));
    }

    @Test
    public void testCreateRegionFilterWithInfoNotInPredicate() {
        Predicate<Info<String, String>> predicate = geomem.createRegionFilter(50.0, -70.0, 40.0, -50.0);
        Info<String, String> info = new Info<String, String>(70.0, -60.0, 1708757706, "test", Optional.of("test"));

        assertFalse(predicate.apply(info));
    }
}