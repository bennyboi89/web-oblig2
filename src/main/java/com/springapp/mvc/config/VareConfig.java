package com.springapp.mvc.config;

import com.mongodb.MongoClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoTemplate;

/**
 * Created by benny on 07.10.15.
 */
@Configuration
public class VareConfig {

    public @Bean
    MongoTemplate mongoTemplate() throws  Exception {

        MongoTemplate mongoTemplate  =
                new MongoTemplate(new MongoClient("localhost"),"is");

                return mongoTemplate;
    }
}
