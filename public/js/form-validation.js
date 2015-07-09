var FormValidation = function () {

    // basic validation
   

    // validation using icons
    

    // advance validation
    var handleValidation3 = function() {
        // for more info visit the official plugin documentation: 
        // http://docs.jquery.com/Plugins/Validation

        var form3 = $('#edit_user');
        var error3 = $('.alert-danger', form3);
        var success3 = $('.alert-success', form3);

        //IMPORTANT: update CKEDITOR textarea with actual content before submit
        /*form3.on('submit', function() {
                for(var instanceName in CKEDITOR.instances) {
                    CKEDITOR.instances[instanceName].updateElement();
                }
            })*/

        form3.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block help-block-error', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "", // validate all fields including form hidden input
            rules: {
                username: {
                    minlength: 2,
                    required: true
                },
                v_firstname: {
                    required: true
                },  
                v_lastname: {
                    required: true
                },
                email: {
                    required: true
                },
                v_im_skype: {
                    required: true
                },
                v_im_password:{
                   required: true
                },
                v_phone:{
                    required: true
                },
                v_gmail:{
                    required: true
                },
                v_linkedin_url:{
                   required: true
                },
                linkedIn_profile:{
                   required: true
                },
                tags:{
                    required: true
                },
                referred_by:{
                    required: true
                },
                select_country:{
                    required: true
                },
                phone:{
                    required: true
                },
                cellnumber:{
                   required: true
                },
                linkedin_profile:{
                   required: true
                },               
                websiteurl:{
                   required: true
                },
                companyname:{
                   required: true
                },
                description:{
                   required: true
                },
                referenceurls:{
                   required: true
                },
                notes:{
                   required: true
                },
                followed_up_by:{
                   required: true
                },
                next_follow_up_By:{
                    required: true
                },
                outcome:{
                    required: true
                }
            },


            errorPlacement: function (error, element) { // render error placement for each input type
                if (element.parent(".input-group").size() > 0) {
                    error.insertAfter(element.parent(".input-group"));
                } else if (element.attr("data-error-container")) { 
                    error.appendTo(element.attr("data-error-container"));
                } else if (element.parents('.radio-list').size() > 0) { 
                    error.appendTo(element.parents('.radio-list').attr("data-error-container"));
                } else if (element.parents('.radio-inline').size() > 0) { 
                    error.appendTo(element.parents('.radio-inline').attr("data-error-container"));
                } else if (element.parents('.checkbox-list').size() > 0) {
                    error.appendTo(element.parents('.checkbox-list').attr("data-error-container"));
                } else if (element.parents('.checkbox-inline').size() > 0) { 
                    error.appendTo(element.parents('.checkbox-inline').attr("data-error-container"));
                } else {
                    error.insertAfter(element); // for other inputs, just perform default behavior
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit   
                success3.hide();
                error3.show();
                Metronic.scrollTo(error3, -200);
            },

            highlight: function (element) { // hightlight error inputs                    
                $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function (element) { // revert the change done by hightlight
                $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error'); // set success class to the control group
            },

            submitHandler: function (form) {
                success3.show();
                error3.hide();

                form.submit(); // submit the form
            }

        });

    }

    // advance validation
    var handleValidation4 = function() {
        // for more info visit the official plugin documentation: 
        // http://docs.jquery.com/Plugins/Validation

        var form4 = $('#form_sample_4');
        var error4 = $('.alert-danger', form4);
        var success4 = $('.alert-success', form4);

        //IMPORTANT: update CKEDITOR textarea with actual content before submit
        /*form4.on('submit', function() {
                for(var instanceName in CKEDITOR.instances) {
                    CKEDITOR.instances[instanceName].updateElement();
                }
            })*/

        form4.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block help-block-error', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "", // validate all fields including form hidden input
            rules: {
                password_current: {
                    minlength: 6,
                    required: true
                },
                password_new: {
                    minlength: 6,
                    required: true
                },  
                password_retype: {
                    equalTo: "#password_new"
                }
            },


            errorPlacement: function (error, element) { // render error placement for each input type
                if (element.parent(".input-group").size() > 0) {
                    error.insertAfter(element.parent(".input-group"));
                } else if (element.attr("data-error-container")) { 
                    error.appendTo(element.attr("data-error-container"));
                } else if (element.parents('.radio-list').size() > 0) { 
                    error.appendTo(element.parents('.radio-list').attr("data-error-container"));
                } else if (element.parents('.radio-inline').size() > 0) { 
                    error.appendTo(element.parents('.radio-inline').attr("data-error-container"));
                } else if (element.parents('.checkbox-list').size() > 0) {
                    error.appendTo(element.parents('.checkbox-list').attr("data-error-container"));
                } else if (element.parents('.checkbox-inline').size() > 0) { 
                    error.appendTo(element.parents('.checkbox-inline').attr("data-error-container"));
                } else {
                    error.insertAfter(element); // for other inputs, just perform default behavior
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit   
                success4.hide();
                error4.show();
                Metronic.scrollTo(error4, -200);
            },

            highlight: function (element) { // hightlight error inputs                    
                $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function (element) { // revert the change done by hightlight
                $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error'); // set success class to the control group
            },

            submitHandler: function (form) {
                success4.show();
                error4.hide();

                form.submit(); // submit the form
            }

        });

    }
    var handleValidation5 = function() {
        // for more info visit the official plugin documentation: 
        // http://docs.jquery.com/Plugins/Validation

        var form5 = $('#form_sample_5');
        var error5 = $('.alert-danger', form5);
        var success5 = $('.alert-success', form5);

        //IMPORTANT: update CKEDITOR textarea with actual content before submit
        /*form5.on('submit', function() {
                for(var instanceName in CKEDITOR.instances) {
                    CKEDITOR.instances[instanceName].updateElement();
                }
            })*/

        form5.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block help-block-error', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "", // validate all fields including form hidden input
            rules: {
                options1: {
                    required: true
                },
                ans1: {
                    required: true
                },  
                options2: {
                    required: true
                },
                ans2: {
                    required: true
                },
                options3: {
                    required: true
                },  
                ans3: {
                    required: true
                }
            },


            errorPlacement: function (error, element) { // render error placement for each input type
                if (element.parent(".input-group").size() > 0) {
                    error.insertAfter(element.parent(".input-group"));
                } else if (element.attr("data-error-container")) { 
                    error.appendTo(element.attr("data-error-container"));
                } else if (element.parents('.radio-list').size() > 0) { 
                    error.appendTo(element.parents('.radio-list').attr("data-error-container"));
                } else if (element.parents('.radio-inline').size() > 0) { 
                    error.appendTo(element.parents('.radio-inline').attr("data-error-container"));
                } else if (element.parents('.checkbox-list').size() > 0) {
                    error.appendTo(element.parents('.checkbox-list').attr("data-error-container"));
                } else if (element.parents('.checkbox-inline').size() > 0) { 
                    error.appendTo(element.parents('.checkbox-inline').attr("data-error-container"));
                } else {
                    error.insertAfter(element); // for other inputs, just perform default behavior
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit   
                success5.hide();
                error5.show();
                Metronic.scrollTo(error5, -200);
            },

            highlight: function (element) { // hightlight error inputs                    
                $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function (element) { // revert the change done by hightlight
                $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error'); // set success class to the control group
            },

            submitHandler: function (form) {
                success5.show();
                error5.hide();

                form.submit(); // submit the form
            }

        });

    }
    
     var handleValidation6 = function() {
        // for more info visit the official plugin documentation: 
        // http://docs.jquery.com/Plugins/Validation

        var form6 = $('#form_sample_6');
        var error6 = $('.alert-danger', form6);
        var success6 = $('.alert-success', form6);

        //IMPORTANT: update CKEDITOR textarea with actual content before submit
        /*form6.on('submit', function() {
                for(var instanceName in CKEDITOR.instances) {
                    CKEDITOR.instances[instanceName].updateElement();
                }
            })*/

        form6.validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block help-block-error', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "", // validate all fields including form hidden input
            rules: {
                emp_rule: {
                    required: true
                },
                active: {
                    required: true
                }
            },


            errorPlacement: function (error, element) { // render error placement for each input type
                if (element.parent(".input-group").size() > 0) {
                    error.insertAfter(element.parent(".input-group"));
                } else if (element.attr("data-error-container")) { 
                    error.appendTo(element.attr("data-error-container"));
                } else {
                    error.insertAfter(element); // for other inputs, just perform default behavior
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit   
                success6.hide();
                error6.show();
                Metronic.scrollTo(error6, -200);
            },

            highlight: function (element) { // hightlight error inputs                    
                $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function (element) { // revert the change done by hightlight
                $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error'); // set success class to the control group
            },

            submitHandler: function (form) {
                success6.show();
                error6.hide();

                form.submit(); // submit the form
            }

        });

    }
    
    var handlePublicSubmitForm = function() {

        var form = $('#investor_create');
        var error = $('.alert-danger', form);
        var success = $('.alert-success', form);

        $("#submit_investor").click(function(){
            $(".form-group").removeClass('has-error');
            $(".form-group").find(".help-block-error").hide();
            success.show();
            error.hide();
            Metronic.scrollTo(success, -200);
        });

        $('#investor_create').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            rules: {
                add_inv1: {
                    required: true
                },
                add_inv2: {
                    required: true
                },
                add_inv3: {
                    required: true
                },                
                add_inv4: {
                    required: true,
                    minlength: 8
                },
                add_inv5: {
                    required: true
                },
                add_inv6: {
                    required: true
                },
                add_inv7: {
                    required: true
                },
                add_inv8: {
                    required: true
                },
                add_inv9: {
                    required: true
                },
                add_inv10: {
                    required: true
                },
                add_inv11: {
                    required: true
                },
                add_inv12: {
                    required: true
                },
                add_inv13: {
                    required: true
                },
                add_inv14: {
                    required: true
                },
                add_inv15: {
                    required: true
                },
                add_inv16: {
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
                $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function (element) { // revert the change done by hightlight
                $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error'); // set success class to the control group
            },

            submitHandler: function(form) {
                success.show();
                error.hide();
                form.submit(); // form validation success, call ajax form submit
            }
        });

        $('#investor_create input').keypress(function(e) {
            if (e.which == 13) {
                if ($('#investor_create').validate().form()) {
                    $('#investor_create').submit(); //form validation success, call ajax form submit
                }
                return false;
            }
        });
    


    }

    var handleLogin = function() {

        $('.login-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true
                },
                remember: {
                    required: false
                },
                password_confirmation: {
                    equalTo: "#user_password"
                }
            },

            messages: {
                username: {
                    required: "Email is required."
                },
                password: {
                    required: "Password is required."
                },
                password_confirmation: {
                    required: "Password Confirmation is required."
                }
                
            },

            invalidHandler: function(event, validator) { //display error alert on form submit   
                $('.alert-danger', $('.login-form')).show();
            },

            highlight: function(element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function(error, element) {
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function(form) {
                form.submit(); // form validation success, call ajax form submit
            }
        });

        $('.login-form input').keypress(function(e) {
            if (e.which == 13) {
                if ($('.login-form').validate().form()) {
                    $('.login-form').submit(); //form validation success, call ajax form submit
                }
                return false;
            }
        });
    }

    var handleForgetPassword = function() {
        $('.forget-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "",
            rules: {
                email: {
                    required: true,
                    email: true
                }
            },

            messages: {
                email: {
                    required: "Email is required."
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit   

            },

            highlight: function(element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function(error, element) {
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function(form) {
                form.submit();
            }
        });

        $('.forget-form input').keypress(function(e) {
            if (e.which == 13) {
                if ($('.forget-form').validate().form()) {
                    $('.forget-form').submit();
                }
                return false;
            }
        });

        jQuery('#forget-password').click(function() {
            jQuery('.login-form').hide();
            jQuery('.forget-form').show();
        });

        jQuery('#back-btn').click(function() {
            jQuery('.login-form').show();
            jQuery('.forget-form').hide();
        });

    }


    return {
        //main function to initiate the module
        init: function () {
            handleLogin();
            handleForgetPassword();
            handlePublicSubmitForm();
            handleValidation3();
            handleValidation4();
            handleValidation5();
            handleValidation6();
        }

    };

}();