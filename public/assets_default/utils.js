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

function ajax_update_obj_qty_in_cart(cart_obj_id, qty, callback){
	data = {
		cart_obj_id: cart_obj_id,
		qty: qty
	}

	ajax_post('/auth_update_obj_qty_in_cart', data, 'json', callback);
}

function ajax_rm_from_cart(cart_obj_id, callback){
	data = {
		cart_obj_id: cart_obj_id
	}
	ajax_post('/auth_rm_obj_from_cart', data, 'json', callback);
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

	ajax_post('/auth_add_obj_to_cart', data, 'json', callback);
}
