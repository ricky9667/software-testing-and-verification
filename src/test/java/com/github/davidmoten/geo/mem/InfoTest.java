package com.github.davidmoten.geo.mem;

import com.google.common.base.Optional;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class InfoTest {

    private Info<String, String> taipeiInfo;

    private final double taipeiLatitude = 25.105497;

    private final double taipeiLongitude = 121.597366;

    private final long taipeiTime = 1708757706;

    private final String taipeiValue = "taipei";

    private final String taipeiId = "taipeiId";

    @Before
    public void setUp() {
        taipeiInfo = new Info<String, String>(taipeiLatitude, taipeiLongitude, taipeiTime,
                taipeiValue, Optional.of(taipeiId));
    }

    @After
    public void tearDown() {
        taipeiInfo = null;
    }

    @Test
    public void testId() {
        assertTrue(taipeiInfo.id().isPresent());
        assertEquals("taipeiId", taipeiInfo.id().get());
    }

    @Test
    public void testLat() {
        assertEquals(taipeiLatitude, taipeiInfo.lat(), 0);
    }

    @Test
    public void testLon() {
        assertEquals(taipeiLongitude, taipeiInfo.lon(), 0);
    }

    @Test
    public void testTime() {
        assertEquals(taipeiTime, taipeiInfo.time());
    }

    @Test
    public void testValue() {
        assertEquals(taipeiValue, taipeiInfo.value());
    }

    @Test
    public void testToString() {
        final Optional<String> optionalTaipeiId = Optional.of(taipeiId);
        final String expectedString = "Info [lat=" + taipeiLatitude + ", lon=" + taipeiLongitude + ", time="
                + taipeiTime + ", value=" + taipeiValue + ", id=" + optionalTaipeiId + "]";
        assertEquals(expectedString, taipeiInfo.toString());
    }
}