form = '', widget = '';
$.fn.doCreateAccount = function(){
    form = $(this);
    widget = $('#createAccount');
    $(".alert, .progress, #new_account", widget).hide();
    $(".progress", widget).show();
    $.post('../accounts', form.serialize(), function(data){
        $(".alert, .progress", widget).hide();
        if(data.success){
            $(".alert", widget)
            .removeClass('alert-error')
            .addClass('alert-success')
            .html(data.message)
            .show();
            $("#new_account", widget).show();
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
            $("#new_account", widget).show();
        }

    }).fail(function() {
        $(".progress", widget).hide();
        $(".alert", widget)
        .removeClass('alert-success')
        .addClass('alert-error')
        .html("Error while processing the request!")
        .show();
        $("#new_account", widget).show();
    });
}



$(document).ready(function(){
    $("#new_account").validate({
        submitHandler: function(form) {
            $(form).doCreateAccount();
            return false;
        }
    });
});