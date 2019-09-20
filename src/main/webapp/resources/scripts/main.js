$(document).ready(
		function() {
			
			$("#searchlink").click(
					function(e) {
						e.preventDefault();
						$.post("/MCRH/anyyear",$("#searchform").serialize(), function(data) {
							var dates=$("#datetimepicker1").data("DateTimePicker").date().toDate().getFullYear();
							var naturedoughnut = document.getElementById("naturedoughnut")
									.getContext('2d');
							var genderpie = document.getElementById("genderpie").getContext(
									'2d');
							var typedoughnut = document.getElementById("typedoughnut")
									.getContext('2d');
							var ctxL = document.getElementById("bar").getContext('2d');
							var myLineChart = new Chart(ctxL, {
								type : 'bar',
								data : {
									labels : [ "January", "February", "March", "April", "May",
											"June", "July", "August", "September", "October",
											"November", "December" ],
									datasets : [ {
										label : "Males",
										data : data[0],
										backgroundColor : "#8e5ea2",
										borderColor : "#0000FF",
										borderWidth : 1
									}, {
										label : "Females",
										data : data[1],
										backgroundColor : "#3e95cd",
										borderColor : "#00FF00",
										borderWidth : 1
									}, {
										label : "Total",
										data : data[2],
										backgroundColor : "#ADD8E6",
										borderColor : "#FF0000",
										borderWidth : 1
									} ]
								},
								options : {
									title : {
										display : true,
										text : "Data Enty For The Year" + " "+ dates
									},
									responsive : true
								}
							});
							var myPieChart = new Chart(genderpie, {
								type : 'pie',
								data : {
									labels : [ "Male", "Female" ],
									datasets : [ {
										label : "Males and Females",
										backgroundColor : [ "#8e5ea2", "#3e95cd" ],
										data : data[3]
									} ]
								},
								options : {
									title : {
										display : true,
										text : "Total Males and Females The Year" + " "+ dates
									},
									responsive : true
								}
							});
							var naturedoughnut = new Chart(naturedoughnut, {
								type : 'doughnut',
								data : {
									labels : [ "Alive", "Dead" ],
									datasets : [ {
										label : "Born Alive and Born Deads",
										backgroundColor : [ "#3cba9f", "#c45850" ],
										data : data[4]
									} ]
								},
								options : {
									title : {
										display : true,
										text : "Total Dead and Alive The Year" + " "+ dates
									},
									responsive : true
								}
							});
							var typedoughnut = new Chart(typedoughnut, {
								type : 'doughnut',
								data : {
									labels : [ "Single", "Twin", "Other" ],
									datasets : [ {
										label : "Born Alive and Born Deads",
										backgroundColor : [ "#e8c3b9", "#c8e5ea2", "#c45850" ],
										data : data[5]
									} ]
								},
								options : {
									title : {
										display : true,
										text : "Types of birth The Year" + " "+ " "+ dates
									},
									responsive : true
								}
							});

						});
						return false;
					});
			
			$("#searchlinkb").click(
					function(e) {
						e.preventDefault();
						const months=["January", "February", "March", "April", "May",
							"June", "July", "August", "September", "October",
							"November", "December" ];
						var dates= months[$("#datetimepicker1").data("DateTimePicker").date().toDate().getMonth()] + " " + $("#datetimepicker1").data("DateTimePicker").date().toDate().getFullYear();
						$.post("/MCRH/anymonth",$("#searchformb").serialize(), function(data) {
							var naturedoughnut = document.getElementById("naturedoughnut")
									.getContext('2d');
							var genderpie = document.getElementById("genderpie").getContext(
									'2d');
							var typedoughnut = document.getElementById("typedoughnut")
									.getContext('2d');
							var ctxL = document.getElementById("bar").getContext('2d');
							var myLineChart = new Chart(ctxL, {
								type : 'bar',
								data : {
									labels : [ "This Month" ],
									datasets : [{
										label : "Total",
										data : data[0],
										backgroundColor : "#ADD8E6",
										borderColor : "#FF0000",
										borderWidth : 1
									} ]
								},
								options : {
									title : {
										display : true,
										text : "Data Enty For for " + dates
									},
									responsive : true
								}
							});
							var myPieChart = new Chart(genderpie, {
								type : 'pie',
								data : {
									labels : [ "Male", "Female" ],
									datasets : [ {
										label : "Males and Females",
										backgroundColor : [ "#8e5ea2", "#3e95cd" ],
										data : data[1]
									} ]
								},
								options : {
									title : {
										display : true,
										text : "Total Males and Females for " + dates
									},
									responsive : true
								}
							});
							var naturedoughnut = new Chart(naturedoughnut, {
								type : 'doughnut',
								data : {
									labels : [ "Alive", "Dead" ],
									datasets : [ {
										label : "Born Alive and Born Deads",
										backgroundColor : [ "#3cba9f", "#c45850" ],
										data : data[2]
									} ]
								},
								options : {
									title : {
										display : true,
										text : "Total Dead and Alive for " + dates
									},
									responsive : true
								}
							});
							var typedoughnut = new Chart(typedoughnut, {
								type : 'doughnut',
								data : {
									labels : [ "Single", "Twin", "Other" ],
									datasets : [ {
										label : "Born Alive and Born Deads",
										backgroundColor : [ "#e8c3b9", "#c8e5ea2", "#c45850" ],
										data : data[3]
									} ]
								},
								options : {
									title : {
										display : true,
										text : "Types of birth for " + dates
									},
									responsive : true
								}
							});

						});
						return false;
					});
			
			$("#registerform").submit(function(e){
				e.preventDefault();
				$.post("/MCRH/register",$("#registerform").serialize(), function(data) {
					
					if(data=="Serial Number Exist Make sure it has not been used before"){
						$(".toast").removeClass('w3-green');
					$(".toast").addClass('w3-red');
					
					
					} else if(data=="Record Saved Successfully"){
						$(".toast").removeClass('w3-red');
						$(".toast").addClass('w3-green');
						$("#registerform")[0].reset();
					}
					$(".toast").toast({
						delay : 3500
					});
					$(".toast-body").html(data);

					$(".toast").toast('show');
					
				});
				
			});
			
			$("#updateform").submit(function(e){
				e.preventDefault();
				$.post("/MCRH/updaterecord",$("#updateform").serialize(), function(data) {
					
					if(data=="Update Failed"){
						$(".toast").removeClass('w3-green');
					$(".toast").addClass('w3-red');
					
					
					} else if(data=="Record Updated Successfully"){
						$(".toast").removeClass('w3-red');
						$(".toast").addClass('w3-green');
						$("#updateform")[0].reset();
					}
					$(".toast").toast({
						delay : 3500
					});
					$(".toast-body").html(data);

					$(".toast").toast('show');
					
				});
				
			});
			$("#table").DataTable({
				dom : 'Blfrtip',
				buttons : [ 'print', 'copy', 'csv' ]
			});
			$('#datetimepicker').datetimepicker({
				format : 'L',
				maxDate: new Date()
			});
			$('#datetimepicker1').datetimepicker({
				format : 'L',
				maxDate: new Date()
			});
			$('#datetimepicker2').datetimepicker({
				format : 'L',
				maxDate: new Date()
			});

			$("#logout").click(function(e) {
				e.preventDefault();

				$("#logout-form").submit();
			});

			$("#sidebar").mCustomScrollbar({
				theme : "minimal"
			});

			$('#sidebarCollapse').on('click', function() {
				// open or close navbar
				$('#sidebar').toggleClass('active');
				// close dropdowns
				$('.collapse.in').toggleClass('in');
				// and also adjust aria-expanded attributes we use for the open/closed arrows
				// in our CSS
				$('a[aria-expanded=true]').attr('aria-expanded', 'false');
			});

			
		});