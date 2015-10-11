package com.springapp.mvc.model;

import com.sun.javafx.beans.IDProperty;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by benny on 07.10.15.
 */


@Document(collection = "is")
public class Vare {

    @Id
    private String id;
    private String navn;
    private String beskrivelse;



    public Vare(){}


    /**
     * This method is constructer method with given parameters.
     *
     * @param id
     * @param navn
     * @param beskrivelse
     *
     */




    public Vare(String id, String navn, String beskrivelse) {
        super();
        this.id = id;
        this.navn = navn;
        this.beskrivelse = beskrivelse;
    }





    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNavn() {
        return navn;
    }

    public void setNavn(String navn) {
        this.navn = navn;
    }

    public String getBeskrivelse() {
        return beskrivelse;
    }

    public void setBeskrivelse(String beskrivelse) {
        this.beskrivelse = beskrivelse;
    }
}
