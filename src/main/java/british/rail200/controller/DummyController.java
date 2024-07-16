package british.rail200.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DummyController {

    // GitHub webhook test commit
    @GetMapping("/dummy")
    public ResponseEntity<String> dummy() {
        return ResponseEntity.ok("Hello Rail200.");
    }

}
