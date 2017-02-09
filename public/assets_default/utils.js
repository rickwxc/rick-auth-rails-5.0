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


function ajax_add_to_cart(id, model, qty, options_json, callback){
	data = {
		id: id,
		model: model,
		qty: qty,
	}

	if (options_json){
		data['options_json'] = options_json
	}

	ajax_post('auth_add_obj_to_cart', data, 'json', callback);

}
