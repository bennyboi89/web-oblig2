package com.springapp.mvc.service;

import com.springapp.mvc.model.Vare;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

/**
 * Created by benny on 07.10.15.
 */
@Repository
public class VareService {

    @Autowired
    private MongoTemplate mongoTemplate;

    public static final String COLLECTION_NAME = "is";



    //Metoden tar å legger til insert operasjon med vare modellen i kontrolleren

    public void addVare(Vare vare){
        if (!mongoTemplate.collectionExists(Vare.class)){
            mongoTemplate.createCollection(Vare.class);
        }
        vare.setId(UUID.randomUUID().toString());
        mongoTemplate.insert(vare, COLLECTION_NAME);
    }



    public Vare getVare(String id){
        return mongoTemplate.findOne(Query.query(Criteria.where("_id").is(id)),
                Vare.class,
                COLLECTION_NAME);
    }

    //Listen tar å viser alt som er i "vare" collection

    public List<Vare> vareList() {
        return mongoTemplate.findAll(Vare.class, COLLECTION_NAME);
    }


    //Sletter en vare fra collection med id som kommer fra varekontrolleren
    public void deleteVare(Vare vare){
        mongoTemplate.remove(vare, COLLECTION_NAME);
    }

    //Oppdaterer en vare fra collection
    public void updateVare(Vare vare) {
        mongoTemplate.save(vare, COLLECTION_NAME);
    }





}

