package com.springapp.mvc;

import com.springapp.mvc.model.Vare;
import com.springapp.mvc.service.VareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletRequest;

/**
 * Created by benny on 07.10.15.
 */
@Controller
public class VareController {

    @Autowired
    private VareService vareService;


    @RequestMapping(value = {"/","/index.htm"}, method = RequestMethod.GET)
    public String getVareList(ModelMap model){
        model.addAttribute("vareList", vareService.vareList());

        return "index";
    }


    @RequestMapping(value = "/ajaxtest", method = RequestMethod.GET)
    public @ResponseBody String ajaxAddVare(
            @ModelAttribute Vare vare,
            ModelMap model,
            @RequestParam(value="navn") String navn,
            @RequestParam(value="beskrivelse") String beskrivelse,
            ServletRequest servletRequest){


        String result = "";

        vare.setNavn(navn);
        vare.setBeskrivelse(beskrivelse);
        vareService.addVare(vare);
        model.addAttribute("vareList", vareService.vareList());

        return result;


    }



    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public @ResponseBody String ajaxUpdateVare(
            @ModelAttribute Vare vare,
            ModelMap model,
            @RequestParam(value = "id") String id,
            @RequestParam(value = "navn") String navn,
            @RequestParam(value = "beskrivelse") String beskrivelse){

        String result = "";

        if(StringUtils.hasText(vare.getId())){
            vare.setNavn(navn);
            vare.setBeskrivelse(beskrivelse);
            vareService.updateVare(vare);

            result+="<span style='margin-left:180px;' class='label label-success'>"
                    + "<i class=\"fa fa-check\"></i> Varen ble oppdatert!"
                    +"</span>";


        }else{
            result+="<span style='margin-left:180px;' class='label label-danger'>"
                    + "<i class=\"fa fa-exclamation-triangle\"></i> En feil oppsto ved oppdatering av varen!"
                    +"</span>";
        }

        return result;
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public @ResponseBody String ajaxDeleteVare(
            @ModelAttribute Vare vare,
            ModelMap model,
            @RequestParam(value="id") String id){

        vareService.deleteVare(vare);

        return "Varen ble slettet!";
    }












    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public @ResponseBody String ajaxEditVareJSON(
            @ModelAttribute Vare vare,
            ModelMap model,
            @RequestParam(value="id") String id) {

        vare=vareService.getVare(id);

        return "<div class=\"form-group\">"+
                "<label class=\"control-label col-sm-3\" for=\"name\">First Name(*):</label>"+
                "<div class=\"col-sm-9\">"+
                "<input type=\"text\" class=\"form-control\" id=\"navn\" name=\"navn\" value="+vare.getNavn()+" required>"+
                "</div>"+
                "</div>"+

                "<div class=\"form-group\">"+
                "<label class=\"control-label col-sm-3\" for=\"beskrivelse\">Last Name(*):</label>"+
                "<div class=\"col-sm-9\">"+
                "<input type=\"text\" class=\"form-control\" id=\"beskrivelse\" name=\"beskrivelse\" value="+vare.getBeskrivelse()+" required>"+
                "</div>"+
                "</div>";

    }






}
