var Login = function() {

    var handlePublicSubmitForm = function() {

        var form = $('#project-opportunity-form');
        var error = $('.alert-danger', form);
        var success = $('.alert-success', form);

        $("#save_dev_exe").click(function(){
            $(".form-group").removeClass('has-error');
            $(".form-group").find(".help-block-error").hide();
            success.show();
            error.hide();
            Metronic.scrollTo(success, -200);
        });

        $('#project-opportunity-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            rules: {
                dev_ex_1: {
                    required: true
                },
                dev_ex_2: {
                    required: true
                },
                dev_ex_3: {
                    required: true
                },                
                dev_ex_4: {
                    required: true
                },
                dev_ex_5: {
                    required: true
                },
                dev_ex_6: {
                    required: true
                },
                dev_ex_7: {
                    required: true
                },
                dev_ex_8: {
                    required: true                    
                },
                dev_ex_9: {
                    required: true                    
                },
                dev_ex_10: {
                    required: true
                },
                dev_ex_11: {
                    required: true                    
                },
                dev_ex_12: {
                    required: true                    
                },
                
                dev_ex_13: {
                    required: true
                },
                dev_ex_14: {
                    required: true
                },
                dev_ex_15: {
                    required: true
                },                
                dev_ex_16: {
                    required: true
                },
                dev_ex_17: {
                    required: true
                },
                dev_ex_18: {
                    required: true
                },
                dev_ex_19: {
                    required: true
                },
                dev_ex_20: {
                    required: true                    
                },
                dev_ex_21: {
                    required: true                    
                },
                dev_ex_22: {
                    required: true
                },
                dev_ex_23: {
                    required: true                    
                },
                dev_ex_24: {
                    required: true                    
                },
                
                dev_ex_25: {
                    required: true
                },
                dev_ex_26: {
                    required: true
                },
                dev_ex_27: {
                    required: true
                },                
                dev_ex_28: {
                    required: true
                },
                dev_ex_29: {
                    required: true
                },
                dev_ex_30: {
                    required: true
                },
                dev_ex_31: {
                    required: true
                },
                dev_ex_32: {
                    required: true                    
                },
                dev_ex_33: {
                    required: true                    
                },
                dev_ex_34: {
                    required: true
                },
                dev_ex_35: {
                    required: true                    
                },
                dev_ex_36: {
                    required: true                    
                },
                
                dev_ex_37: {
                    required: true
                },
                dev_ex_38: {
                    required: true
                },
                dev_ex_39: {
                    required: true
                },                
                dev_ex_40: {
                    required: true
                },
                dev_ex_41: {
                    required: true
                },
                dev_ex_42: {
                    required: true
                },
                dev_ex_43: {
                    required: true
                },
                dev_ex_44: {
                    required: true                    
                },
                dev_ex_45: {
                    required: true                    
                },
                dev_ex_46: {
                    required: true
                },
                dev_ex_47: {
                    required: true                    
                },
                dev_ex_48: {
                    required: true                    
                },
                
                dev_ex_49: {
                    required: true
                },
                dev_ex_50: {
                    required: true
                },
                dev_ex_51: {
                    required: true
                },                
                dev_ex_52: {
                    required: true
                },
                dev_ex_53: {
                    required: true
                },
                dev_ex_54: {
                    required: true
                },
                dev_ex_55: {
                    required: true
                },
                dev_ex_56: {
                    required: true                    
                },
                dev_ex_57: {
                    required: true                    
                },
                dev_ex_58: {
                    required: true
                },
                dev_ex_59: {
                    required: true                    
                },
                dev_ex_60: {
                    required: true                    
                },
                
                dev_ex_61: {
                    required: true
                },
                dev_ex_62: {
                    required: true
                },
                dev_ex_63: {
                    required: true
                },                
                dev_ex_64: {
                    required: true
                },
                dev_ex_65: {
                    required: true
                },
                dev_ex_66: {
                    required: true
                },
                dev_ex_67: {
                    required: true
                },
                dev_ex_68: {
                    required: true                    
                },
                dev_ex_69: {
                    required: true                    
                },
                dev_ex_70: {
                    required: true
                },
                dev_ex_71: {
                    required: true                    
                },
                dev_ex_72: {
                    required: true                    
                },
                dev_ex_73: {
                    required: true
                },
                dev_ex_74: {
                    required: true
                },
                dev_ex_75: {
                    required: true                    
                },
                dev_ex_76: {
                    required: true                    
                },
                dev_ex_77: {
                    required: true
                },
                dev_ex_78: {
                    required: true                    
                },
                dev_ex_79: {
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

        $('#project-opportunity-form input').keypress(function(e) {
            if (e.which == 13) {
                if ($('#project-opportunity-form').validate().form()) {
                    $('#project-opportunity-form').submit(); //form validation success, call ajax form submit
                }
                return false;
            }
        });
    


    }


 return {
        //main function to initiate the module
        init: function() {

            handlePublicSubmitForm();
        }

    };
}();