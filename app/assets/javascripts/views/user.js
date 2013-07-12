form = '', widget = '';
$.fn.doCreateUser = function(){
    form = $(this);
    widget = $('#createUser');
    $(".alert, .progress, #new_user", widget).hide();
    $(".progress", widget).show();
    $.post('../users', form.serialize(), function(data){
        $(".alert, .progress", widget).hide();
        if(data.success){
            $(".alert", widget)
            .removeClass('alert-error')
            .addClass('alert-success')
            .html(data.message)
            .show();
            $("#new_user", widget).show();
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
            $("#new_user", widget).show();
        }

    }).fail(function() {
        $(".progress", widget).hide();
        $(".alert", widget)
        .removeClass('alert-success')
        .addClass('alert-error')
        .html("Error while processing the request!")
        .show();
        $("#new_user", widget).show();
    });
}


$(document).ready(function(){
    $("#new_user").validate({
        submitHandler: function(form) {
            $(form).doCreateUser();
            return false;
        }
    });
});