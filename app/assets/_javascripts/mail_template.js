var Inbox = function () {

    var content = $('.inbox-content');
    var loading = $('.inbox-loading');
    var listListing = '';
    setTimeout(function(){
        console.log(Layout);
    },1000)
    var initWysihtml5 = function () {
        $('.inbox-wysihtml5').wysihtml5({
            "stylesheets": ["plugins/bootstrap-wysihtml5/wysiwyg-color.css"]
        });
    }

    var initFileupload = function () {

        $('#fileupload').fileupload({
            // Uncomment the following to send cross-domain cookies:
            //xhrFields: {withCredentials: true},
            url: 'plugins/jquery-file-upload/server/php/',
            autoUpload: true
        });

        // Upload server status check for browsers with CORS support:
        if ($.support.cors) {
            $.ajax({
                url: 'plugins/jquery-file-upload/server/php/',
                type: 'HEAD'
            }).fail(function () {
                $('<span class="alert alert-error"/>')
                    .text('Upload server currently unavailable - ' +
                    new Date())
                    .appendTo('#fileupload');
            });
        }
    }

    var loadReply = function (el) {
        var messageid = $(el).attr("data-messageid");
        var url = 'email_template_msg.html?messageid=' + messageid;
        
        loading.show();
        content.html('');
        toggleButton(el);

        // load the form via ajax
        $.ajax({
            type: "GET",
            cache: false,
            url: url,
            dataType: "html",
            success: function(res) 
            {
                toggleButton(el);

                $('.inbox-nav > li.active').removeClass('active');
                $('.inbox-nav > li.inbox').addClass('active');
                
                loading.hide();
                content.html(res);
                //$('[name="message"]').val($('#reply_email_content_body').html());

                handleCCInput(); // init "CC" input field

                /*initFileupload();*/
                $('.email-template-msg').summernote({
                    height: 200,
                    disableLinkTarget: true,     // hide link Target Checkbox
                    disableDragAndDrop: true,    // disable drag and drop event
                    disableResizeEditor: true,
                    toolbar: [
                        ['style', ['bold', 'italic', 'underline']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['height', ['height']],
                        ['insert', ['link']], // no insert buttons
                        ['help', ['help']] //no help button
                    ],
                    oninit: function() {
                        //$editable.closest('textarea.email-template').innerHtml = contents;
                        var init_content = $('.email-template-system').code();    
                        if(init_content == '<br>' || init_content == '<div><br></div>'){
                            $('.email-template-msg').val('');
                        } else {
                            $('.email-template-msg').val(init_content);
                        }                        
                    },
                    onChange: function(contents, $editable) {
                        //$editable.closest('textarea.email-template').innerHtml = contents;
                        if(contents == '<br>' || contents == '<div><br></div>'){
                            $('.email-template-msg').val('');
                        } else {
                            $('.email-template-msg').val(contents);
                        }                        
                    } 
                });
                //Layout.fixContentHeight();
                Metronic.initUniform();
            },
            error: function(xhr, ajaxOptions, thrownError)
            {
                toggleButton(el);
            },
            async: false
        });
    }


    var handleCCInput = function () {
        var the = $('.inbox-compose .mail-to .inbox-cc');
        var input = $('.inbox-compose .input-cc');
        the.hide();
        input.show();
        $('.close', input).click(function () {
            input.hide();
            the.show();
        });
    }

    var handleBCCInput = function () {

        var the = $('.inbox-compose .mail-to .inbox-bcc');
        var input = $('.inbox-compose .input-bcc');
        the.hide();
        input.show();
        $('.close', input).click(function () {
            input.hide();
            the.show();
        });
    }

    var toggleButton = function(el) {
        if (typeof el == 'undefined') {
            return;
        }
        if (el.attr("disabled")) {
            el.attr("disabled", false);
        } else {
            el.attr("disabled", true);
        }
    }

    return {
        //main function to initiate the module
        init: function () {

       
            // handle inbox listing
            $('.inbox-nav > li.inbox > a').click(function () {
                loadReply();
            });

            //handle compose/reply cc input toggle
            $('.inbox-content').on('click', '.mail-to .inbox-cc', function () {
                handleCCInput();
            });

            //handle compose/reply bcc input toggle
            $('.inbox-content').on('click', '.mail-to .inbox-bcc', function () {
                handleBCCInput();
            });

            //handle loading content based on URL parameter
            if (Metronic.getURLParameter("a") === "view") {
                loadMessage();
            } else if (Metronic.getURLParameter("a") === "compose") {
                loadCompose();
            } else {                
               $('.inbox-nav > li.inbox > a').click().addClass('active');
            }

        }

    };

}();