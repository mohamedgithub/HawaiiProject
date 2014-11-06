 $(document).ready(
    function(){
        $('#imgButton').attr('disabled',true);
        $('input:file').change(
            function(){
                if ($("#myFile").val() ){
                    $('#imgButton').removeAttr('disabled'); 
                }
                else {
                    $('#imgButton').attr('disabled',true);
                }
            });
    });


