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
<title>FINANCE page</title>
</head>
<body>
	<strong>${user}</strong>Welcome to Finance Page.
	<a href="<c:url value="/logout" />">Logout</a>

	<div class="bootstrap-demo">
		<table id="table" class="table table-striped">
			<thead class="thead-inverse">
				<tr>
					<th data-field="tour_id">Tour ID</th>
					<th data-field="tour_purpose">Purpose</th>
					<th style="display: none;" data-field="travel_startdate">Start
						Date</th>
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
						<td style="display: none;">${tours.travel_startdate}</td>
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

	<div class="modal hide fade in" id="detailsModal" role="dialog"
		aria-hidden="true" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span>Tour Details
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form:form method="POST" action="/MWTour/submitFinance"
						modelAttribute="tour" id="formModal">

						<form:hidden path="tour_id" value="${tour_id}" />
						<label for="purpose">Purpose</label>
						<form:input class="form-control" path="tour_purpose"
							id="tour_purpose" value="${tour.tour_purpose}" readonly="true" />
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
							<form:input class="form-control" path="ticket_cost"
								id="ticket_cost" value="${tour.ticket_cost}" readonly="true"/>
						</div>
						<div class="form-group">
							<label>Travel Mode</label>
							<form:input class="form-control" path="travel_mode"
								id="travel_mode" value="${tour.travel_mode}" readonly="true"/>
						</div>
						<div class="form-group">
							<label>Cab Home</label>
							<form:input class="form-control" path="cab_home" id="cab_home"
								value="${tour.cab_home}" readonly="true"/>
						</div>
						<div class="form-group">
							<label>Cab Destination</label>
							<form:input class="form-control" path="cab_dest" id="cab_dest"
								value="${tour.cab_dest}" readonly="true"/>
						</div>
						<div class="form-group">
							<label>Hotel Cost</label>
							<form:input class="form-control" path="hotel_cost"
								id="hotel_cost" value="${tour.hotel_cost}" readonly="true"/>
						</div>
						<div class="form-group">
							<label>Local Conveyance</label>
							<form:input class="form-control" path="local_convey"
								id="local_convey" value="${tour.local_convey}" readonly="true"/>
						</div>
						<div class="form-group">
							<label>Approving Manager</label>
							<form:input class="form-control" path="approving_manager"
								id="approving_manager" value="${tour.approving_manager}"
								readonly="true" />
						</div>
						<div class="form-group">
							<label>Tour Information</label>
							<form:input class="form-control" path="tour_information"
								id="tour_information" value="${tour.tour_information}" />
						</div>
						<div class="form-group">
							<label>Action</label>
							<form:select path="tour_status" id="tour_status">
								<form:option value="REJECTED">REJECT</form:option>
								<form:option value="APPROVED">APPROVE</form:option>
								<form:option value="REQUESTINFORMATION">Request for Information</form:option>
							</form:select>
						</div>
						<input type="submit" class="btn  btn-default" value="submit" />
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

	<!-- Include Date Range Picker -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var container = $('.bootstrap-iso form').length > 0 ? $(
									'.bootstrap-iso form').parent()
									: "body";

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
												$("#tour_information")
														.val(
																$(this)
																		.closest(
																				'tr')
																		.children()[12].textContent);
											});

						});
	</script>

</body>
</html>