var TableEditable = function () {

    var handleTable = function () {
        
        function strip(html) {
           var tmp = document.createElement("DIV");
           tmp.innerHTML = html;
           return tmp.textContent || tmp.innerText || "";
        }

        function restoreRow(oTable, nRow) {
            var aData = oTable.fnGetData(nRow);
            var jqTds = $('>td', nRow);

            for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                oTable.fnUpdate(aData[i], nRow, i, false);
            }

            oTable.fnDraw();
        }

        function editRow(oTable, nRow, edit_id) {
            var aData = oTable.fnGetData(nRow);
            var jqTds = $('>td', nRow);
            // alert(aData);
        // Jquery for edit the inline page and get Id 
            var div = document.createElement('div');
            div.innerHTML = aData;
            var editID = $(div).find('.edit').attr('edit_id');
            jqTds[0].innerHTML = '<input type="text" name = "v_title" class="form-control input-small" value="' + aData[0] + '">';
            jqTds[1].innerHTML = '<input type="text" name = "v_color" class="form-control colorpicker-default input-small" value="' + $.trim(strip(aData[1])) + '">';
            jqTds[2].innerHTML = '<a class="edit" href="" save_id="'+editID+'">Save</a>';
            // jqTds[3].innerHTML = '<a class="cancel" href="">Cancel</a>';
            jqTds[3].innerHTML = '<a class="cancel" href="">Cancel</a><input type="hidden" name = "id" class="form-control input-small" value="' + edit_id + '">';
            $('.colorpicker-default').colorpicker();            
        }

        // edit and save the  followtype inline
        function saveRow(oTable, nRow) {
            var aData = oTable.fnGetData(nRow);
            var jqTds = $('>td', nRow);
        // Jquery for edit the inline page and get Id 
            var div = document.createElement('div');
            div.innerHTML = aData;
            var editID = $(div).find('.edit').attr('edit_id');
            var serializedData = $('#edit-followuptypes-form').serialize();
            $.ajax({
                type: "GET",
                url: "/followuptypes/"+editID+"/edit",
                data: serializedData,
                dataType: "json",
                success: function(response) {
                    console.log(response);
                    prodId = response.something;
                },
                error: function(error){
                    alert("error");
                    return;
                }
            });
            var jqInputs = $('input', nRow);
            oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);            
            jqInputs[1].value = '<div class="input-group color colorbg" data-color="'+jqInputs[1].value+'" data-color-format="rgba"><span class="input-group-btn"><button class="btn default" type="button"><i style="background-color: '+jqInputs[1].value+';"></i>&nbsp;</button></span>&nbsp; '+jqInputs[1].value+'</div> ';
            oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
            oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 2, false);
            oTable.fnUpdate('<a class="delete" href="">Delete</a>', nRow, 3, false);
            oTable.fnDraw();
        }

        function cancelEditRow(oTable, nRow) {
            var jqInputs = $('input', nRow);
            oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
            jqInputs[1].value = '<div class="input-group color colorbg" data-color="'+jqInputs[1].value+'" data-color-format="rgba"><span class="input-group-btn"><button class="btn default" type="button"><i style="background-color: '+jqInputs[1].value+';"></i>&nbsp;</button></span>&nbsp; '+jqInputs[1].value+'</div> ';
            oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);            
            oTable.fnUpdate('<a class="edit" href="">Edit</a>', nRow, 2, false);
            oTable.fnDraw();
        }

        var table = $('#sample_editable_1');
        var oTable = table.dataTable({
            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
            // So when dropdowns used the scrollable div should be removed. 
            //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

            "lengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "pageLength": 10,
            "bPaginate": false,
            "bFilter": false,
            "bInfo": false,
            "language": {
                "lengthMenu": " _MENU_ records"
            },
            "columnDefs": [{ // set default column settings
                    'orderable': true,
                    'targets': [0]
                },{
                    'bSortable': false,
                    'aTargets': [-1,-2,-3]
                }
            ],
            "order": [
                [0, "asc"]                
            ] // set first column as a default sort by asc
        });

        var tableWrapper = $("#sample_editable_1_wrapper");

        tableWrapper.find(".dataTables_length select").select2({
            showSearchInput: false //hide search box with special css class
        }); // initialize select2 dropdown

        var nEditing = null;
        var nNew = false;

        $('#sample_editable_1_new').click(function (e) {
            e.preventDefault();

            if (nNew && nEditing) {
                if (confirm("Previose row not saved. Do you want to save it ?")) {
                    saveRow(oTable, nEditing); // save
                    $(nEditing).find("td:first").html("Untitled");
                    nEditing = null;
                    nNew = false;

                } else {
                    oTable.fnDeleteRow(nEditing); // cancel
                    nEditing = null;
                    nNew = false;
                    
                    return;
                }
            }

            var aiNew = oTable.fnAddData(['', '', '', '', '', '']);
            var nRow = oTable.fnGetNodes(aiNew[0]);
            editRow(oTable, nRow);
            nEditing = nRow;
            nNew = true;
        });

        // delete the  followtype inline

        table.on('click', '.delete', function (e) {
            e.preventDefault();
            var test = true;
            if (confirm("Are you sure to delete this row ?") == false) {
                return;
            }
             deleted_id = $(this).attr('deleteid');
             $.ajax({
                type: "delete",
                url: $(this).attr('href'),
                dataType: "html",
                data: {
                        'csrfmiddlewaretoken':$( "#csrfmiddlewaretoken").val()
                },
                success: function(response) {
                    console.log("#row_"+deleted_id);
                    $("#row_"+deleted_id).remove();
                }
            });

            var nRow = $(this).parents('tr')[0];
            oTable.fnDeleteRow(nRow);
        });

        table.on('click', '.cancel', function (e) {
            e.preventDefault();
            if (nNew) {
                oTable.fnDeleteRow(nEditing);
                nEditing = null;
                nNew = false;
            } else {
                restoreRow(oTable, nEditing);
                nEditing = null;
            }
        });

        table.on('click', '.edit', function (e) {
            e.preventDefault();
             edit_id = $(this).attr('edit_id');
            /* Get the row as a parent of the link that was clicked on */
            var nRow = $(this).parents('tr')[0];

            if (nEditing !== null && nEditing != nRow) {
                /* Currently editing - but not this row - restore the old before continuing to edit mode */
                restoreRow(oTable, nEditing);
                editRow(oTable, nRow);
                nEditing = nRow;
            } else if (nEditing == nRow && this.innerHTML == "Save") {
                /* Editing this row and want to save it */
                saveRow(oTable, nEditing);
                nEditing = null;
                alert("Updated! Do not forget to do some ajax to sync with backend :)");
            } else {
                /* No edit in progress - let's start one */
                editRow(oTable, nRow, edit_id);
                nEditing = nRow;
            }
        });
    }

    return {

        //main function to initiate the module
        init: function () {
            handleTable();
        }

    };

}();