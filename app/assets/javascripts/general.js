function objEmpty(obj){
    if(obj == null || obj == 'undefined' || obj == ''){
        return true;
    }
    
    return false;
}


function getString(obj, limit){
    var _limit = 0;
    var _strReturn = '';
    
    if(!objEmpty(limit)){
        _limit = parseInt(limit);
    }
    
    if(!objEmpty(obj)){
        _strReturn = obj.toString();
    }
    
    if(_limit>0 && _strReturn.length > _limit){
        _strReturn = _strReturn.substring(0, _limit) + '...';
    }
    
    return _strReturn;
}

function redirectTo(url){
    if(url != 'undefined' && url != null && url != ''){
        window.location = url;
    }
    return false;
}


(function($) {
    $.fn.showAjaxMessage = function(options){
        var _handler = $(this);
        
        var settings = {
            html: 'Undefined',
            type: 'alert',
            closeButton: false
        };

        settings = $.extend(settings, options);
        
        if(settings.type == 'success'){
            _handler
            .addClass('alert')
            .removeClass('alert-error')
            .addClass('alert-success')
            .removeClass('alert-info')
            .html(settings.html);
        }else if(settings.type == 'error'){
            _handler
            .addClass('alert')
            .addClass('alert-error')
            .removeClass('alert-success')
            .removeClass('alert-info')
            .html(settings.html);
        }else{
            _handler
            .addClass('alert')
            .removeClass('alert-error')
            .removeClass('alert-success')
            .removeClass('alert-info')
            .html(settings.html);
        }
        
        if(settings.closeButton === true){
            _handler.append('<button type="button" class="close" data-dismiss="alert">&times;</button>');
        }
        
        _handler.show();
    };
    
    $.fn.callAjax = function(options){
        var _handler = $(this);
        
        var settings = {
            url: '',
            data: {},
            dataType: 'json',
            crossDomain: false,
            global: true,
            processData: true,
            type: 'POST',
            respTo: $('<div>'),
            beforeSend: function(){
                settings.respTo.hide();
                _handler.show();
            },
            done: function(data, textStatus, jqXHR) {
                _handler.hide();
                settings.respTo.html(JSON.stringify(data)).show();
            },
            fail: function(jqXHR, textStatus, errorThrown) {
                _handler.hide();
                settings.respTo.html('Error: while processing the request <br/>' + errorThrown).show();
            },
            always: function(data, textStatus, jqXHR) {}
        };

        settings = $.extend(settings, options);

        $.ajaxSetup({
            url: settings.url,
            dataType:settings.dataType, 
            crossDomain:settings.crossDomain, 
            global:settings.global, 
            processData:settings.processData, 
            type:settings.type,
            beforeSend: settings.beforeSend
        });

        var jqxhr = $.ajax( {
            data:settings.data
        } )
        .done(settings.done)
        .fail(settings.fail)
        .always(settings.always);

        return jqxhr;
    };
})(jQuery);