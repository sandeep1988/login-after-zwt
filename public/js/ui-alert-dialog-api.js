var UIAlertDialogApi = function () {

    var handleDialogs = function() {

        $('#demo_1').click(function(){
                bootbox.alert("Hello world!");    
            });
            //end #demo_1

            $('#demo_2').click(function(){
                bootbox.alert("Hello world!", function() {
                    alert("Hello world callback");
                });  
            });
            //end #demo_2
        
            $('.user_delete').click(function(){
                var user_ids = ($(this).attr("attr-delete"));
                var full_url = location.protocol + "//" + location.host + user_ids
                alert(full_url);
                bootbox.confirm("Are you sure?", function(result) {
                    if (result == false ) {
                        var fail_url = location.protocol + "//" + location.host + "/sales"
                        window.location.assign(fail_url)
                    } else {
                        window.location.assign(full_url)
                    }
                }); 
            });
            //end #demo_3

            $('.contact_delete').click(function(){
                var contact_ids = ($(this).attr("attr-delete"));
                var full_url = location.protocol + "//" + location.host + contact_ids
                bootbox.confirm("Are you sure?", function(result) {
                    if (result == false ) {
                        var fail_url = location.protocol + "//" + location.host + "/contacts"
                        window.location.assign(fail_url)
                    } else {
                        window.location.assign(full_url)
                    }
                }); 
            });


            $('#demo_4').click(function(){
                bootbox.prompt("What is your name?", function(result) {
                    if (result === null) {
                        alert("Prompt dismissed");
                    } else {
                        alert("Hi <b>"+result+"</b>");
                    }
                });
            });
            //end #demo_6

            $('#demo_5').click(function(){
                bootbox.dialog({
                    message: "I am a custom dialog",
                    title: "Custom title",
                    buttons: {
                      success: {
                        label: "Success!",
                        className: "green",
                        callback: function() {
                          alert("great success");
                        }
                      },
                      danger: {
                        label: "Danger!",
                        className: "red",
                        callback: function() {
                          alert("uh oh, look out!");
                        }
                      },
                      main: {
                        label: "Click ME!",
                        className: "blue",
                        callback: function() {
                          alert("Primary button");
                        }
                      }
                    }
                });
            });
            //end #demo_7

    }

    var handleAlerts = function() {
        
        $('#alert_show').click(function(){

            Metronic.alert({
                container: $('#alert_container').val(), // alerts parent container(by default placed after the page breadcrumbs)
                place: $('#alert_place').val(), // append or prepent in container 
                type: $('#alert_type').val(),  // alert's type
                message: $('#alert_message').val(),  // alert's message
                close: $('#alert_close').is(":checked"), // make alert closable
                reset: $('#alert_reset').is(":checked"), // close all previouse alerts first
                focus: $('#alert_focus').is(":checked"), // auto scroll to the alert after shown
                closeInSeconds: $('#alert_close_in_seconds').val(), // auto close after defined seconds
                icon: $('#alert_icon').val() // put icon before the message
            });

        });

    }

    return {

        //main function to initiate the module
        init: function () {
            handleDialogs();
            handleAlerts();
        }
    };

}();