$(document).ready(function(){

	//sample code: select_tag "adm_select-Sb-sbzone_id-#{sb.id}", options_from_collection_for_select(Sbzone.all, "id", "full", sb.sbzone_id||0 ), :prompt => '-- please select --' %>
	$('select[name *= "adm_select"]').change(function(){
		var v = $(this).val();
		var id = $(this).attr('id');
		ids = id.split('-') 

		data ={
			model:ids[1],
			field:ids[2],
			id:ids[3],
			value:v
		}

		ajax_post('adm/ajax_updater', data, 'json', function(rs){
			if(rs['ok'] == '1') {
				$('<span>ok</span>').insertAfter($('#' + id));
			}
		});

	
	});


});
