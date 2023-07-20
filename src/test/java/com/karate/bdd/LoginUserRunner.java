package com.karate.bdd;

import com.intuit.karate.junit5.Karate;

public class LoginUserRunner {
    @Karate.Test
    Karate loginUser(){
        return Karate.run().relativeTo(getClass());
    }
}