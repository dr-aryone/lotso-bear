$( document ).ready(function() {

$("#creator").click(function() {
	for (i = 0; i < $("#number_spares").val(); i++) {
		$("#family_members").append('<input id="generic_family_generic_spares_attributes_'+i+'_name" name="generic_family[generic_spares_attributes]['+i+'][name]" type="text">');
	}
	})
	$('#assignation_table').DataTable({
	  // Optional, if you want full pagination controls.
	  // Check dataTables documentation to learn more about available options.
	  // http://datatables.net/reference/option/pagingType"
	  // "language": {
   //              "url": "dataTables.spanish.lang.js"
   //          }

	});

});