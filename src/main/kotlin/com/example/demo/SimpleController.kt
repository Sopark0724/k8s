package com.example.demo

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import reactor.core.publisher.Mono

@RestController
class SimpleController {

    @GetMapping("/test")
    fun test() : Mono<String> {
        return Mono.just("hello")
    }

    @GetMapping("/health")
    fun health() : Mono<String> {
        return Mono.just("")
    }
}
