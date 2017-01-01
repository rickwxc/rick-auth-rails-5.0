function ajax_post(url, data, dataType, callback){

    $.ajax({
        url:url,
        type: 'post',
        beforeSend:function(xhr){
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        data: data,
        dataType: dataType,
        success: callback
    });

}


