var ComponentsPickers = function () {

    var handleTagsInput = function () {
        if (!jQuery().tagsInput) {
            return;
        }
        $('#tags_2').tagsInput({
            width: 'auto'
        });
    }
    

    return {
        //main function to initiate the module
        init: function () {            
            handleTagsInput();
        }
    };

}();