/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var tableinput = [];
var materialstable = [];
var values = [];
var tasksTemp = [];
var tasksFinal = [];

function addRowGeneral() {
    //debugger;
    var tableID = "general";
    var table = document.getElementById(tableID);
    var rowCount = table.rows.length;


    var row = table.insertRow(-1);
    var cell1 = row.insertCell(-1);
    var cell2 = row.insertCell(-1);
    var cell3 = row.insertCell(-1);
    var cell4 = row.insertCell(-1);
    var cell5 = row.insertCell(-1);


    var material = document.createElement('input');
    material.type = "text";
    material.name = "material";
    material.style.width = "100%";
    material.style.height = "100%";
    material.style.border = "none";

    var array1 = ["Manpower", "Human Resources", "Equipment", "Materials", "ETC"];
    var classification = document.createElement("select");
    classification.setAttribute("id", "myresourceSelect");
    classification.name = "classification";
    for (var i = 0; i < array1.length; i++) {
        var option = document.createElement("option");
        option.setAttribute("value", array1[i]);
        option.text = array1[i];
        classification.appendChild(option);
    }
    classification.style.width = "100%";
    classification.style.height = "100%";
    classification.style.border = "none";

    var unitprice = document.createElement('input');
    unitprice.type = "text";
    unitprice.name = "unitprice";
    unitprice.style.width = "100%";
    unitprice.style.height = "100%";
    unitprice.style.border = "none";

    var quantity = document.createElement('input');
    quantity.type = "text";
    quantity.name = "quantity";
    quantity.style.width = "100%";
    quantity.style.height = "100%";
    quantity.style.border = "none";

    var array = ["N/A", "pcs", "kg", "ft", "lbs", "cm"];
    var unit = document.createElement("select");
    unit.setAttribute("id", "myunitSelect");
    unit.name = "unit";

    for (var i = 0; i < array.length; i++) {
        var option = document.createElement("option");
        option.setAttribute("value", array[i]);
        option.text = array[i];
        unit.appendChild(option);
    }
    unit.style.width = "100%";
    unit.style.height = "100%";
    unit.style.border = "none";

    cell1.appendChild(material);
    cell2.appendChild(classification);
    cell3.appendChild(unitprice);
    cell4.appendChild(quantity);
    cell5.appendChild(unit);

}

function addRowPW() {
    //debugger;
    var tableID = "programworks";
    var table = document.getElementById(tableID);
    var rowCount = table.rows.length;


    var row = table.insertRow(-1);
    var cell1 = row.insertCell(-1);
    var cell2 = row.insertCell(-1);
    var cell3 = row.insertCell(-1);


    var component = document.createElement('input');
    component.id = "componentid";
    component.type = "text";
    component.name = "component";
    component.style.width = "100%";
    component.style.height = "100%";
    component.style.border = "none";
    tableinput.push(component);


    var duration = document.createElement('input');
    duration.id = "durationid";
    duration.type = "text";
    duration.name = "duration";
    duration.style.width = "100%";
    duration.style.height = "100%";
    duration.style.border = "none";
    tableinput.push(duration);


    var unit = document.createElement('select');
    var arr = ["Day/s", "Week/s", "Month/s"];
    unit.name = "powUnit";
    unit.id = "unitid";
    unit.style.width = "100%";
    unit.style.height = "100%";
    unit.style.border = "none";
    for (var i = 0; i < arr.length; i++) {
        var option = document.createElement("option");
        option.value = arr[i];
        option.text = arr[i];
        unit.appendChild(option);
    }
    tableinput.push(unit);

    document.getElementById("PWsave").disabled = true;

    cell1.appendChild(component);
    cell2.appendChild(duration);
    cell3.appendChild(unit);

}


$(document).ready(function () {
    var form = $("#wizard-validation-form");
    form.validate({
        errorPlacement: function errorPlacement(error, element) {
            element.after(error);
        }
    });
    form.children("div").steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slideLeft",
        onStepChanging: function (event, currentIndex, newIndex) {
            form.validate().settings.ignore = ":disabled,:hidden";
            return form.valid();
        },
        onFinishing: function (event, currentIndex) {
            form.validate().settings.ignore = ":disabled";
            return form.valid();
        },
        onFinished: function (event, currentIndex) {
            alert("Submitted!");
        }
    });

});
function delBtn(btn) {
    var row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
}

function myCreateFunction() {
    var table = document.getElementById("costtable");
    var row = table.insertRow(-1);
    var cell1 = row.insertCell(-1).contentEditable = true;
    var cell2 = row.insertCell(-1).contentEditable = true;
    var cell3 = row.insertCell(-1).contentEditable = true;
    var cell4 = row.insertCell(-1).contentEditable = true;

}

function myDeleteFunctionGeneral() {

    document.getElementById("general").deleteRow(-1);

}

function myDeleteFunctionPW() {

    document.getElementById("programworks").deleteRow(-1);

    for (x = 0; x < 3; x++) {
        tableinput.pop();
    }
}


function myDeleteFunction2() {

    document.getElementById("component").deleteRow(-1);

}

$(document).on("change", "#componentid,#descriptionid,#unitid", function () {

    if (verifytable() === "true") {
        document.getElementById("PWsave").disabled = false;

    }
    else
        document.getElementById("PWsave").disabled = true;

});


function verifytable() {

    var temp;

    for (x = 0; x < tableinput.length; x++) {

        if (tableinput[x].value.length > 0) {
            temp = "true";
        }
        else {
            temp = "false";
            return temp;
        }
    }

    return temp;
}

function setPWtocalendar() {
    //ajax call here
    while (values.length > 0) {
        values.pop();
    }

    for (x = 0; x < tableinput.length; x++) {
        values.push(tableinput[x].value);
    }
    var json = JSON.stringify(values);

    $.ajax({
        type: 'POST',
        url: 'getpwschedule',
        dataType: 'json',
        data: {tableinputs: json, targetimplementationdate: $('#targetimplementationdate').val()},
        cache: false,
        success: function (sched) {
            alert("programs are successfully saved");
            inputActivities(sched);
        }
    });

}

function showAddTaskForm() {
    $('#modalTitle2').html($('#eventTag').val());
    $('#displayTasks').modal();
    $('#addTaskB').text("Add");
    $("#addTaskB").click(function () {
        addTask();
    });
    $("#viewTasksB").click(function () {
        viewTasks();
    });
    $('#fullCalModal').modal('hide');
}

function addTask() {
    var task = [];
    if ($('#taskName').val() !== '') {
        task = [$("#eventTag").val(), $('#taskName').val(), $('#taskDesc').val(), $('#taskStart').val(), $('#taskEnd').val(), $('#taskPerson').val(), "Temporary", tasksTemp.length];
        tasksTemp.push(task);
    }
    $('#taskName').val('');
    $('#taskDesc').val('');
    $('#taskStart').val('');
    $('#taskEnd').val('');
    $('#taskPerson').val('');

    viewTasks();

}

function saveTask() {
    var task = [];
    $.each(tasksTemp, function (i) {
        task = [tasksTemp[0], tasksTemp[0], tasksTemp[0], tasksTemp[0], tasksTemp[0], tasksTemp[0], "Final", tasksFinal.length];

        tasksFinal.push(tasksTemp[i]);
    });
    $('#fullCalModalBody').empty();
    $('#displayTasks').modal('hide');
    $('#fullCalModal').modal('hide');
    tasksTemp.length = 0;
}

function closeModal() {
    if (tasksTemp.length > 0) {
        viewTasks();
        if (confirm("You have tasks that weren't saved. Are you sure you want to close this?")) {
            $('#fullCalModalBody').empty();
            $('#displayTasks').modal('hide');
            $('#fullCalModal').modal('hide');
            tasksTemp.length = 0;
        }
        else
            return false;

    }
    else {
        $('#fullCalModalBody').empty();
        $('#displayTasks').modal('hide');
        $('#fullCalModal').modal('hide');

    }


}

function viewTasks() {
    var event = $("#eventTag").val();
    if (getTaskCount(event) < 1) {
        $('#fullCalModalBody').empty();
        $("<center><header class=\"panel-heading\" id=\"noTask\">No tasks for this activity yet</header></center>").appendTo("#fullCalModalBody");
    }
    else {
        $('#fullCalModalBody').html('');
        $.each(tasksFinal, function (i) {
            if (tasksFinal[i][0] === event) {
                $("<span class=\"pull-right\" aria-hidden=\"true\"><button type=\"button\" class=\"btn btn-info btn-sm\" onclick=\"editView(this)\" id=\"" + i + "-Final\"><i class=\"fa fa-pencil\"></i>&nbsp</button><button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"deleteTask(this)\" id=\"" + i + "-Final\"><i class=\"fa fa-times\"></i></button></span>").appendTo("#fullCalModalBody");
                $("<b> <p class=\"control-label\" style=\" font-size: medium;\">Task: " + tasksFinal[i][1] + "</p></b>").appendTo("#fullCalModalBody");

                if (tasksFinal[i][2] !== "")
                    $("&nbsp <p class=\"control-label\">Description: " + tasksFinal[i][2] + "</p>").appendTo("#fullCalModalBody");

                if (tasksFinal[i][3] !== "")
                    $("&nbsp <p class=\"control-label\">Start: " + tasksFinal[i][3] + "</p>").appendTo("#fullCalModalBody");

                if (tasksFinal[i][4] !== "")
                    $("&nbsp <p class=\"control-label\">End: " + tasksFinal[i][4] + "</p>").appendTo("#fullCalModalBody");

                if (tasksFinal[i][5] !== "")
                    $("&nbsp <p class=\"control-label\">Person in Charge: " + tasksFinal[i][5] + "</p>").appendTo("#fullCalModalBody");
                $("<header class=\"panel-heading\"></header>").appendTo("#fullCalModalBody");

            }

        });

        $.each(tasksTemp, function (i) {
            if (tasksTemp[i][0] === event) {
                $("<span class=\"pull-right\" aria-hidden=\"true\"><button type=\"button\" class=\"btn btn-info btn-sm\" onclick=\"editView(this)\" id=\"" + i + "-" + tasksTemp[i][6] + "\"><i class=\"fa fa-pencil\"></i>&nbsp</button><button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"deleteTask(this)\" id=\"" + i + "-" + tasksTemp[i][6] + "\"><i class=\"fa fa-times\"></i></button></span>").appendTo("#fullCalModalBody");
                $("<b> <p class=\"control-label\" style=\" font-size: medium;\">Task: " + tasksTemp[i][1] + "</p></b>").appendTo("#fullCalModalBody");

                if (tasksTemp[i][2] !== "")
                    $("&nbsp <p class=\"control-label\">Description: " + tasksTemp[i][2] + "</p>").appendTo("#fullCalModalBody");

                if (tasksTemp[i][3] !== "")
                    $("&nbsp <p class=\"control-label\">Start: " + tasksTemp[i][3] + "</p>").appendTo("#fullCalModalBody");

                if (tasksTemp[i][4] !== "")
                    $("&nbsp <p class=\"control-label\">End: " + tasksTemp[i][4] + "</p>").appendTo("#fullCalModalBody");

                if (tasksTemp[i][5] !== "")
                    $("&nbsp <p class=\"control-label\">Person in Charge: " + tasksTemp[i][5] + "</p>").appendTo("#fullCalModalBody");
                $("<header class=\"panel-heading\"></header>").appendTo("#fullCalModalBody");

            }

        });


    }
    $('#modalTitle').html($('#eventTag').val());
    $('#fullCalModal').modal();
    $("#addTaskB").click(function () {
        addTask();
    });
    $("#showTaskMod").click(function () {
        showAddTaskForm();
    });
    $('#displayTasks').modal('hide');


}

function getTaskCount() {
    var counter = 0;
    var event = $("#eventTag").val();

    $.each(tasksTemp, function (i) {
        if (tasksTemp[i][0] === event) {
            counter++;
        }
    });

    $.each(tasksFinal, function (i) {
        if (tasksFinal[i][0] === event)
            counter++;
    });
    return counter;
}

function editView(button) {
    var taskNoStatus = button.id;
    var getSched = taskNoStatus.split('-');
    var task = [];
    if (getSched[1] === "Temporary") {
        task = tasksTemp[getSched[0]];
    }
    else if (getSched[1] === "Final") {
        task = tasksFinal[getSched[0]];
    }

    $('#modalTitle2').html($('#eventTag').val());
    $('#taskName').val(task[1]);
    $('#taskDesc').val(task[2]);
    $('#taskStart').val(task[3]);
    $('#taskEnd').val(task[4]);
    $('#taskPerson').val(task[5]);

    $('#displayTasks').modal();
    $('#addTaskB').text("Save Changes");
    $("#addTaskB").click(function () {
        editTask(taskNoStatus);
    });
    $("#viewTasksB").click(function () {
        viewTasks();
    });
    $('#fullCalModal').modal('hide');

    return getSched;
}

function editTask(taskNoStatus) {
    var getSched = taskNoStatus.split('-');
    var task = [];

    if (getSched[1] === "Temporary") {
        tasksTemp[getSched[0]] = task;
        if ($('#taskName').val() !== '') {
            task = [$("#eventTag").val(), $('#taskName').val(), $('#taskDesc').val(), $('#taskStart').val(), $('#taskEnd').val(), $('#taskPerson').val(), "Temporary", getSched[0]];
        }

    }
    else if (getSched[1] === "Final") {
        tasksFinal[getSched[0]] = task;
        if ($('#taskName').val() !== '') {
            task = [$("#eventTag").val(), $('#taskName').val(), $('#taskDesc').val(), $('#taskStart').val(), $('#taskEnd').val(), $('#taskPerson').val(), "Temporary", getSched[0]];
        }

    }

    $('#taskName').val('');
    $('#taskDesc').val('');
    $('#taskStart').val('');
    $('#taskEnd').val('');
    $('#taskPerson').val('');

    viewTasks();

}

function deleteTask(button) {
    var taskNoStatus = button.id;
    var getSched = taskNoStatus.split('-');
    if (getSched[1] === "Temporary") {
        tasksTemp.splice(getSched[0], 1);
    }
    else if (getSched[1] === "Final") {
        tasksFinal.splice(getSched[0], 1);
    }
    viewTasks();
}

function saveDraft() {
    var location;
    var details;
    var materials;
    var schedule;
    var upload;
    $.ajax({
        type: 'POST',
        url: 'saveasdraft',
        dataType: 'json',
        data: {details: details, location: location, materials: materials,
            schedule: schedule, upload: upload},
        cache: false,
        success: function (sched) {
            //servlet that redirects to list of projects
        }
    });

}