<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome page</title>
</head>
<body>
	<strong>${user}</strong>, Welcome to Home Page.
	<a href="<c:url value="/logout" />">Logout</a>

	<div>
		<form name="dropdownForm" id="dropdownForm" method="get"
			action="/MWTour/changeStatus">
			<input type="hidden" name="dropdownHidden" id="dropdownHidden"
				value="${statusSelected}" /> <select id="tour_statusDropdown"
				name="tour_statusDropdown">
				<option value="DRAFT">DRAFT</option>
				<option value="SUBMITTED">SUBMITTED</option>
				<option value="APPROVED">APPROVED</option>
				<option value="REJECTED">REJECTED</option>
				<option value="REQUESTINFORMATION">REQUEST for INFORMATION</option>
			</select>
		</form>
	</div>

	<div class="bootstrap-demo">
		<table id="table" class="table table-striped">
			<thead class="thead-inverse">
				<tr>
					<th data-field="tour_id">Tour ID</th>
					<th data-field="tour_purpose">Purpose</th>
					<th data-field="travel_startdate">Start Date</th>
					<th style="display: none;" data-field="travel_enddate">End
						Date</th>
					<th style="display: none;" data-field="ticket_cost">Ticket
						Cost</th>
					<th style="display: none;" data-field="travel_mode">Travel
						Mode</th>
					<th style="display: none;" data-field="cab_home">Home Cab
						Price</th>
					<th style="display: none;" data-field="cab_dest">Dest Cab
						Price</th>
					<th style="display: none;" data-field="hotel_cost">Hotel Cost</th>
					<th style="display: none;" data-field="local_convey">Local
						Conveyance</th>
					<th data-field="approving_manager">Approving Manager</th>
					<th data-field="tour_status">Status</th>
					<th style="display: none;" data-field="tour_information">Information</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tours" items="${tours}">
					<tr data-toggle="modal" data-id="${tours.tour_id}"
						data-target="#detailsModal">
						<td>${tours.tour_id}</td>
						<td>${tours.tour_purpose}</td>
						<td>${tours.travel_startdate}</td>
						<td style="display: none;">${tours.travel_enddate}</td>
						<td style="display: none;">${tours.ticket_cost}</td>
						<td style="display: none;">${tours.travel_mode}</td>
						<td style="display: none;">${tours.cab_home}</td>
						<td style="display: none;">${tours.cab_dest}</td>
						<td style="display: none;">${tours.hotel_cost}</td>
						<td style="display: none;">${tours.local_convey}</td>
						<td>${tours.approving_manager}</td>
						<td>${tours.tour_status}</td>
						<td style="display: none;">${tours.tour_information}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

	<div>
		<div class="btn-group">
			<button id="createBtn" type="button" class="btn btn-primary">Create</button>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal hide fade in" id="detailsModal" role="dialog"
		aria-hidden="true" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 5px 5px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span>Tour Details
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form:form method="POST" action="/MWTour/addTour"
						modelAttribute="tour" id="formModal" name="formModal">

						<form:hidden path="tour_id" value="${tour_id}" />
						<input type="hidden" id="statustest" name="statustest" />
						<label for="purpose">Purpose</label>
						<form:input class="form-control" path="tour_purpose"
							id="tour_purpose" name="tour_purpose"
							value="${tour.tour_purpose}" />
						<div class="form-group">
							<label class="control-label">Start Date</label>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"> </i>
								</div>
								<form:input class="form-control" id="travel_startdate"
									name="travel_startdate" placeholder="MM/DD/YYYY"
									path="travel_startdate" value="${tour.travel_startdate}"
									readonly="true" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label">End Date</label>
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calendar"> </i>
								</div>
								<form:input class="form-control" id="travel_enddate"
									name="travel_enddate" placeholder="MM/DD/YYYY"
									path="travel_enddate" value="${tour.travel_enddate}"
									readonly="true" />
							</div>
						</div>

						<div class="form-group">
							<label>Ticket Cost</label>
							<form:input class="form-control numOnly" path="ticket_cost"
								id="ticket_cost" name="ticket_cost" value="${tour.ticket_cost}" />
						</div>
						<div class="form-group">
							<label>Travel Mode</label>
							<form:input class="form-control" path="travel_mode"
								id="travel_mode" name="travel_mode" value="${tour.travel_mode}" />
						</div>
						<div class="form-group">
							<label>Cab Home</label>
							<form:input class="form-control numOnly" path="cab_home"
								id="cab_home" name="cab_home" value="${tour.cab_home}" />
						</div>
						<div class="form-group">
							<label>Cab Destination</label>
							<form:input class="form-control numOnly" path="cab_dest"
								id="cab_dest" name="cab_dest" value="${tour.cab_dest}" />
						</div>
						<div class="form-group">
							<label>Hotel Cost</label>
							<form:input class="form-control numOnly" path="hotel_cost"
								id="hotel_cost" name="hotel_cost" value="${tour.hotel_cost}" />
						</div>
						<div class="form-group">
							<label>Local Conveyance</label>
							<form:input class="form-control" path="local_convey"
								id="local_convey" name="local_convey"
								value="${tour.local_convey}" />
						</div>
						<div class="form-group">
							<label>Approving Manager</label>
							<form:select path="approving_manager" id="approving_manager"
								class="form-control">
								<form:option value="manager1">manager1</form:option>
								<form:option value="manager2">manager2</form:option>
							</form:select>
						</div>
						<div class="form-group" id="divInfo">
							<label>Tour Information</label>
							<form:input class="form-control" path="tour_information"
								id="tour_information" value="${tour.tour_information}" />
						</div>

						<div class="form-group1">
							<label>Action</label>
							<form:select path="tour_status" id="tour_status"
								name="tour_status" class="form-control">
								<form:option value="DRAFT">Draft</form:option>
								<form:option value="SUBMITTED">Submit</form:option>
							</form:select>
						</div>
						<div style="padding: 10px 10px;">
							<input type="button" id="submitBtn" name="submitBtn"
								class="btn  btn-default" value="Submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button"
								id="closeButton" name="closeButton" class="btn  btn-default"
								value="Close" data-dismiss="modal" />
						</div>

					</form:form>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
		integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
		integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
		crossorigin="anonymous"></script>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {					
							$('#divInfo').hide();

							$("#createBtn").click(function() {
								$("#detailsModal").modal({
									backdrop : 'static',
									keyboard : false
								});
							});

							var hiddenVal = $("#dropdownHidden").val();
							$("#tour_statusDropdown option").each(function() {
								if ($(this).val() == hiddenVal) {
									$(this).attr('selected', 'selected');
								}
							});

							var startdate_input = $('input[name="travel_startdate"]');
							var enddate_input = $('input[name="travel_enddate"]');
							var container = $('.bootstrap-iso form').length > 0 ? $(
									'.bootstrap-iso form').parent()
									: "body";
							startdate_input.datepicker({
								format : 'yyyy-mm-dd',
								container : container,
								todayHighlight : true,
								autoclose : true,
							});

							enddate_input.datepicker({
								format : 'yyyy-mm-dd',
								container : container,
								todayHighlight : true,
								autoclose : true,
							});

							$(function() {
								$('#tour_statusDropdown').on('change', function(e) {
									$(this).closest('form').trigger('submit')
								})
							})

							$(".table-striped")
									.find('tr[data-target]')
									.on(
											'click',
											function() {
												$("#tour_id")
														.val(
																$(this)
																		.closest(
																				'tr')
																		.children()[0].textContent);
												$("#tour_purpose")
														.val(
																$(this)
																		.closest(
																				'tr')
																		.children()[1].textContent);
												$("#travel_startdate")
														.val(
																$(this)
																		.closest(
																				'tr')
																		.children()[2].textContent);
												$("#travel_enddate")
														.val(
																$(this)
																		.closest(
																				'tr')
																		.children()[3].textContent);
												$("#ticket_cost")
														.val(
																$(this)
																		.closest(
																				'tr')
																		.children()[4].textContent);
												$("#travel_mode")
														.val(
																$(this)
																		.closest(
																				'tr')
																		.children()[5].textContent);
												$("#cab_home")
														.val(
																$(this)
																		.closest(
																				'tr')
																		.children()[6].textContent);
												$("#cab_dest")
														.val(
																$(this)
																		.closest(
																				'tr')
																		.children()[7].textContent);
												$("#hotel_cost")
														.val(
																$(this)
																		.closest(
																				'tr')
																		.children()[8].textContent);
												$("#local_convey")
														.val(
																$(this)
																		.closest(
																				'tr')
																		.children()[9].textContent);
												$("#approving_manager")
														.val(
																$(this)
																		.closest(
																				'tr')
																		.children()[10].textContent);
												$("#tour_status")
														.val(
																$(this)
																		.closest(
																				'tr')
																		.children()[11].textContent);
												$("#statustest").val(
														$(this)
																.closest(
																		'tr')
																.children()[11].textContent);												
												
												$("#tour_information")
												.val(
														$(this)
																.closest(
																		'tr')
																.children()[12].textContent);
												
												var testStatus = $("#statustest").val();
												
												if (testStatus == "REQUESTINFORMATION" || testStatus == "DRAFT") {
													$(".class=form-control").attr("readonly", false);
													$("#approving_manager").prop("disabled", false);
													$("#tour_status").prop("disabled", false);
													$("#travel_startdate").prop("disabled", false);
													$("#travel_enddate").prop("disabled", false);
													} else {
													$(".form-control").attr("readonly", true);
													$("#approving_manager").prop("disabled", true);
													$("#tour_status").prop("disabled", true);
													$("#travel_startdate").prop("disabled", true);
													$("#travel_enddate").prop("disabled", true);
													$("#submitBtn").hide();
												}

												
												if(testStatus == "REQUESTINFORMATION"){
													$('#divInfo').show();
												} else {
													$('#divInfo').hide();
												}
											});
												
							$('.numOnly').keypress(function(event) {
								  if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
								    event.preventDefault();
								  }
								});	
							
							$('select[name="tour_status"]').change(function () {						        
						        $('select[name="tour_status"]').val(this.value);
						    });
							
							$('input[name="submitBtn"]').click(function(){
								if($('select[name="tour_status"]').val() == 'SUBMITTED'){	
									
									var num = 0;
									var tour_purpose = $.trim($("#tour_purpose").val());
									var travel_startdate = $.trim($("#travel_startdate").val());
									var travel_enddate = $.trim($("#travel_enddate").val());
									var ticket_cost = $.trim($("#ticket_cost").val());
									var travel_mode = $.trim($("#travel_mode").val());
									var cab_home = $.trim($("#cab_home").val());
									var cab_dest = $.trim($("#cab_dest").val());
									var hotel_cost = $.trim($("#hotel_cost").val());
									var local_convey = $.trim($("#local_convey").val());									
									if(tour_purpose.length == 0){ num = 1;}
									if(travel_startdate.length == 0){ num = 1;}
									if(travel_enddate.length == 0){ num = 1;}
									if(ticket_cost.length == 0){ num = 1;}
									if(travel_mode.length == 0){ num = 1;}
									if(cab_home.length == 0){ num = 1;}
									if(cab_dest.length == 0){ num = 1;}
									if(hotel_cost.length == 0){ num = 1;}
									if(local_convey.length == 0){ num = 1;}
																		
									if(num>0){
										alert('Please Complete all fields');
									} else {
										$("#formModal").submit();
									}
								}  else {
									$("#formModal").submit();
								}	
							});	
						});	
		
		
	</script>



</body>
</html>