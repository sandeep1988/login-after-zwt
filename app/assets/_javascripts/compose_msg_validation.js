var Login = function() {
    
    /* Compose new massage */
    var handleComposeNewMessageForm = function() {
        
        /* Begin for note form tool validation -------------------------------  */
        var form = $('#new_msg_form');
        var error = $('.alert-danger', form);
        var success = $('.alert-success', form);
        
        $("#save_template_direct").click(function(){
            $(".inbox-form-group, .form-group").removeClass('has-error');
            $(".inbox-form-group, .form-group").find(".help-block-error").hide();
            success.hide();
            error.hide();
            //Metronic.scrollTo(success, -200);
        });
        
        form.validate({
            ignore: ':hidden:not("#compose_massage")',
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignoreMassage: true,
            errorPlacement: function(error, element) { },
            rules: {
                descussion_title: {
                    required: true
                },
                compose_massage: {
                    required: true
                },
                descussion_project: {
                    required: true
                }
                
            },

            messages: {
                           
            },

            invalidHandler: function(event, validator) { //display error alert on form submit
                success.hide();
                error.show();
                Metronic.scrollTo(error, -200);
            },

            highlight: function (element) { // hightlight error inputs 
                $(element).closest('.inbox-form-group, .form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function (element) { // revert the change done by hightlight
                $(element).closest('.inbox-form-group, .form-group').removeClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.inbox-form-group, .form-group').removeClass('has-error'); // set success class to the control group
            },

            submitHandler: function(form) {
                success.show();
                error.hide();
                form.submit(); // form validation success, call ajax form submit
            }
        });

        $('#new_msg_form input').keypress(function(e) {
            if (e.which == 13) {
                if ($('#new_msg_form').validate().form()) {
                    $('#new_msg_form').submit(); //form validation success, call ajax form submit
                }
                return false;
            }
        });
         /* End for note form tool validation ------------------------------- */
    }

    return {
        //main function to initiate the module
        init: function() {

            handleComposeNewMessageForm();
        }

    };

}();