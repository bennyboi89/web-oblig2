		
$(function(){

			$(document).on("click","button#save",function(){ 
				
				 var navn = $("input#navn").val();
				 var beskrivelse = $('input#beskrivelse').val();


				 
				 var error=0;

				 
				 if(navn==""){

					 $("label#stateNavn").html("Navn må være fylt!");

					 error=1;
				 }
				 if(beskrivelse==""){
					 
					 $("label#stateBeskrivelse").html("Beskrivelse må være fylt!");
					 
					 error=1; 
				}

				if(error==0) {

					$("div#addResult").html("<img src=\"resources/images/loading.gif\" style=\"max-width:50px;max-height:50px;margin-left:250px;\"/>");

					setTimeout(
						function()
						{

							$.ajax({
								url:"ajaxtest.htm",
								data:{navn:navn,
									beskrivelse:beskrivelse},
								success:function(response){

									$("div#addResult").html(response);

									setTimeout(function(){location.reload();},2000);

								}
							});

						}, 2000);



				}
			});


			
			$(document).on("click","a.delete",function(){
				
				var id=this.id;
				
				$("a#delete").click(function(){
					
				$("span#deleteResult").html("<img src=\"resources/images/loading.gif\" style=\"max-width:50px;max-height:50px;\"/>");	

				setTimeout(
						  function() 
						  {
				$.ajax({
					url:"delete.htm",
					data:{id:id},
					success:function(response){
						$("span#deleteResult").addClass("label label-success");
						$("span#deleteResult").css("margin-left","180px");
						$("span#deleteResult").html("<i class=\"fa fa-check\"></i> "+response);
						
						setTimeout(function(){location.reload();},2000);
					}
				});//ajax
				
				},2000);
				
				
				
				});//delete confirm click
			});//delete click
			
			$(document).on("click","a.edit",function(){
				
				var id=this.id;

				$.ajax({
					url:"edit.htm",
					data:{id:id},
					success:function(response){
						//alert(response);
						$("div#editVare").html(response);
						
					}
				});

				
				//oppdatere vare
				
				$(document).on("click","button#update",function(){
					
					 var navn=$("input#navn").val();
					 var beskrivelse=$("input#beskrivelse").val();


					
					$("div#updateResult").html("<img src=\"resources/images/loading.gif\" style=\"max-width:50px;max-height:50px;margin-left:250px;\"/>"); 
					
					setTimeout(
							  function() 
							  {
					
					$.ajax({
						url:"update.htm",
						data:{id:id,navn:navn,beskrivelse:beskrivelse},
						success:function(response){
							//alert(response);
							$("div#updateResult").html(response);
							setTimeout(function(){location.reload();},2000);
							
						}
					});
					
					}, 2000);
					
				});
				
				
			});
			



		});


//funksjon for å flytte på tabellen

(function ($) {
	$.fn.extend({
		tableAddCounter: function (options) {

			// set up default options
			var defaults = {
				title: '#',
				start: 1,
				id: false,
				cssClass: false
			};

			// Overwrite default options with user provided
			var options = $.extend({}, defaults, options);

			return $(this).each(function () {
				// Make sure this is a table tag
				if ($(this).is('table')) {

					// Add column title unless set to 'false'
					if (!options.title) options.title = '';
					$('th:first-child, thead td:first-child', this).each(function () {
						var tagName = $(this).prop('tagName');
						$(this).before('<' + tagName + ' rowspan="' + $('thead tr').length + '" class="' + options.cssClass + '" id="' + options.id + '">' + options.title + '</' + tagName + '>');
					});

					// Add counter starting counter from 'start'
					$('tbody td:first-child', this).each(function (i) {
						$(this).before('<td>' + (options.start + i) + '</td>');
					});

				}
			});
		}
	});
})(jQuery);

$(document).ready(function () {
	$('.table').tableAddCounter();
	$.getScript("http://code.jquery.com/ui/1.9.2/jquery-ui.js").done(function (script, textStatus) { $('tbody').sortable();$(".table-responsive").alert('close');$(".alert-success").show(); });
});