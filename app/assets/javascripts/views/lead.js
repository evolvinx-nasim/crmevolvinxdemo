form = '', widget = '';
$.fn.doCreateLead = function(){
    form = $(this);
    widget = $('#createLead');
    $(".alert, .progress, #new_lead", widget).hide();
    $(".progress", widget).show();
    $.post('../leads', form.serialize(), function(data){
        $(".alert, .progress", widget).hide();
        if(data.success){
            $(".alert", widget)
            .removeClass('alert-error')
            .addClass('alert-success')
            .html(data.message)
            .show();
            $("#new_lead", widget).show();
        } else {
            var $ul = $('<ul/>');
            $ul.addClass('error');
            if (data.exception.indexOf('{') == 0) {
                e = jQuery.parseJSON(data.exception);
                jQuery.each(e, function(key, value) {
                    $ul.append('<li>' + value.toString() + '</li>');
                });
            } else {
                $ul.append('<li>' + data.exception + '</li>');
            }
            $(".progress", widget).hide();
            $(".alert", widget)
            .removeClass('alert-success')
            .addClass('alert-error')
            .html($ul)
            .show();
            $("#new_lead", widget).show();
        }

    }).fail(function() {
        $(".progress", widget).hide();
        $(".alert", widget)
        .removeClass('alert-success')
        .addClass('alert-error')
        .html("Error while processing the request!")
        .show();
        $("#new_lead", widget).show();
    });
}



$(document).ready(function(){
    $("#new_lead").validate({
        submitHandler: function(form) {
            $(form).doCreateLead();
            return false;
        }
    });
});