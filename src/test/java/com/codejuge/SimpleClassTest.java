package com.codejudge;

import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.junit.platform.runner.JUnitPlatform;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;

@RunWith(JUnitPlatform.class)
public class SimpleClassTest {

    private SimpleClass testClass = new SimpleClass();

    @Rule
    public ExpectedException exceptionRule = ExpectedException.none();

    @Test
    public void shouldFail_WhenRatingIsHigherThanCeiling() {
        exceptionRule.expect(IllegalArgumentException.class);
        testClass.createRatingString(2, 1);
    }
}
