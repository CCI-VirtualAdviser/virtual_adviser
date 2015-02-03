$(document).ready(function() {
		   
    $(function(){
		$("#dialog-form").dialog(
		{
			modal: true,
			autoOpen: false,
			height: 400,
			width: 400
		});
		
		
	});
  
	$(function(){
		$("#button1").click(function(){
			$("#list1 > option:selected").each(function(){
				$(this).remove().appendTo("#list2");
			});
		});
		$("#button2").click(function(){
			$("#list2 > option:selected").each(function(){
				$(this).remove().appendTo("#list1");
			});
		});
	
	});
	
	$(function(){
		$(".glyphButtons").click(function(){
		
			if($(this).is("#comm")){
				$("#dialog-form").dialog('option', 'title', 'Add Communication Classes');
			}else if($(this).is("#lib")){
				$("#dialog-form").dialog('option', 'title', 'Add Liberal Education Classes');
			}else if($(this).is("#ss")){
				$("#dialog-form").dialog('option', 'title', 'Add Social Science Classes');
			}else if($(this).is("#sc")){
				$("#dialog-form").dialog('option', 'title', 'Add Science Classes');
			}else if($(this).is("#con")){
				$("#dialog-form").dialog('option', 'title', 'Add Concentration Classes');
			}else if($(this).is("#maj")){
				$("#dialog-form").dialog('option', 'title', 'Add Major Classes');
			}else if($(this).is("#total")){
				$("#dialog-form").dialog('option', 'title', 'Add Total Classes');
			}
		
			$("#dialog-form").dialog('open');
		});
		
  
    });
	
	//This fucntion is attached to the add classes button that closes the dialog when selections are made
	$(function(){
	    $("#addClassesButton").click(function(){
  
			$("#dialog-form").dialog( "close" );

		});
	});
		
});



    