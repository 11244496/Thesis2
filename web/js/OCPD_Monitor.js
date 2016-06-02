/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function TriggerCheckbox(selected){

    var button = document.getElementById("compile");

    //alert(button.className)
    if(button.className == "btn btn-sm btn-success"){
        document.getElementById("compile").className = "btn btn-sm btn-warning";
        document.getElementById("check").style.visibility = "visible";
    }
    
    else if(button.className == "btn btn-sm btn-warning"){
        document.getElementById("compile").className = "btn btn-sm btn-success";
        document.getElementById("chk").style.visibility = "hidden";
    }

}







