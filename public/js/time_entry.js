'use strict';

var tbl = document.getElementById('time_entry_table');
var add_btn = document.getElementById('add_job');
var day_btn = document.getElementById('day_button');

// function that stops the user from submitting the form when they press Enter
function disableEnter(e){
    var eve = e || window.event;
    var keycode = eve.keyCode || eve.which || eve.charCode;
  
    if (keycode == 13) {
      eve.cancelBubble = true;
      eve.returnValue = false;
  
      if (eve.stopPropagation) {   
        eve.stopPropagation();
        eve.preventDefault();
      }

      return false;
    }
}


// Adds another job to the employee
// - clones the row that button was clicked
// - inserts that row into the table (before the next index)
// - hides duplicate name/title value; leave last button to add another row
function my_row(selected){
    var row = selected.parentElement.parentElement;
    var cloned = row.cloneNode(true);
    var row_index = row.rowIndex+1;
    var parent = row.parentNode;
    var newrow = parent.insertBefore(cloned, tbl.rows[row_index]);
    row.getElementsByClassName('add_job')[0].style.visibility = "hidden";
    newrow.getElementsByClassName('hide_title')[0].style.visibility = "hidden";
    newrow.getElementsByClassName('hide_name')[0].style.visibility = "hidden";
}

// changes the string value to a number
function hours(value){
    if (isNaN(value) || value === ""){
        return 0;
    }
    return parseFloat(value);
}

// calculates each rows hours - updates total/grand total
function calculate_hours(){
    var grand_total = 0;
    var grand_reg = 0;
    var grand_ot = 0;
    var grand_dt = 0;

    for(var r = 1; r < tbl.rows.length - 1; r++){
        var row = tbl.rows[r];
        var reg_val = hours(row.getElementsByClassName("reg")[0].value);
        var dt_val = hours(row.getElementsByClassName("ot")[0].value);
        var ot_val = hours(row.getElementsByClassName("dt")[0].value);

        var total = reg_val + dt_val + ot_val;

        grand_reg += reg_val;
        grand_ot += ot_val;
        grand_dt += dt_val;

        row.getElementsByClassName("employee_total")[0].innerText = total.toFixed(2);

        grand_total += total;
    }
    document.getElementById("reg_total").innerText = grand_reg.toFixed(2);
    document.getElementById("ot_total").innerText = grand_ot.toFixed(2);
    document.getElementById("dt_total").innerText = grand_dt.toFixed(2);
    document.getElementById("daily_total").innerText = grand_total.toFixed(2);
}
// day_btn.addEventListener('click', apply_workdate);

function apply_workdate(btn){
    console.log(btn.value);
}