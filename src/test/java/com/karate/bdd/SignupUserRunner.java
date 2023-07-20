package com.karate.bdd;

import com.intuit.karate.junit5.Karate;

public class SignupUserRunner {
    @Karate.Test
    Karate signupUser(){
        return Karate.run().relativeTo(getClass());
    }
}
