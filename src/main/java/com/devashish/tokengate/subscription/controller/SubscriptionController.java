package com.devashish.tokengate.subscription.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class SubscriptionController {

    @GetMapping("/hb")
    ResponseEntity<String> checkHeartBeat(){
        return ResponseEntity.status(HttpStatus.OK).body("Alive");
    }
}
