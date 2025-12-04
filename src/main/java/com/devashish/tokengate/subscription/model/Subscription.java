package com.devashish.tokengate.subscription.model;

import java.time.Instant;
import java.util.UUID;


public class Subscription {
    private UUID id;
    private String tenant;
    private String type;
    private Instant expiry;
}
