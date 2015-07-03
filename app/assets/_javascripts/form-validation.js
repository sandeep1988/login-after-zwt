var FormValidation = function () {

    // basic validation
   

    // validation using icons
    

    // advance validation
    var handleValidation3 = function() {
        // for more info visit the official plugin documentation: 
        // http://docs.jquery.com/Plugins/Validation

        var form3 = $('#form_sample_3');
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
                firstname: {
                    required: true
                },  
                lastname: {
                    required: true
                },
                ei: {
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                emailsign: {
                    required: true
                },
                password:{
                   required: true
                },
                skype:{
                    required: true
                },
                skype_password:{
                    required: true
                },
                gmail_id:{
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


    return {
        //main function to initiate the module
        init: function () {
            handleValidation3();
            handleValidation4();
            handleValidation5();
            handleValidation6();
        }

    };

}();