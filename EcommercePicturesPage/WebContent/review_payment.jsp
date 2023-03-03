<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Pictures Shop - Online Shop Website</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="img/favicon.png" rel="icon">


<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Checkout Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-lg-12">
				<h1 align="center">Review Payment</h1>
				<br/>
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Payer Infomation:</span>
				</h5>
				<form id="orderForm" action="place_order" method="post">
					<div class="bg-light p-30 mb-5">
						<div class="row">
							<div class="col-md-6 form-group">
								<label><b>First Name</b></label> <input name="firstName"
									class="form-control" type="text" value="${payer.firstName}"
									readonly="readonly">
							</div>
							<div class="col-md-6 form-group">
								<label><b>Last Name</b></label> <input name="lastName"
									class="form-control" type="text" value="${payer.lastName}"
									readonly="readonly">
							</div>
							<div class="col-md-6 form-group">
								<label><b>E-mail</b></label> <input name="lastName"
									class="form-control" type="text" value="${payer.email}"
									readonly="readonly">
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-12">
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Recipient Infomation:</span>
				</h5>
				<div class="bg-light p-30 mb-5">
					<div class="row">
						<div class="col-md-6 form-group">
							<label><b>Recipient Name</b></label> <input name="firstName"
								class="form-control" type="text" value="${recipient.recipientName}"
								readonly="readonly">
						</div>
						<div class="col-md-6 form-group">
							<label><b>Address Line 1</b></label> <input
								name="address1" class="form-control" type="text"
								value="${recipient.line1}" readonly="readonly">
						</div>
						<div class="col-md-6 form-group">
							<label><b>Address Line 2</b></label> <input
								name="address2" class="form-control" type="text"
								value="${recipient.line2}" readonly="readonly">
						</div>
						<div class="col-md-6 form-group">
							<label><b>City</b></label> <input class="form-control"
								name="city" type="text" value="${recipient.city}" readonly="readonly">
						</div>
						<div class="col-md-6 form-group">
							<label><b>State</b></label> <input class="form-control"
								name="state" type="text" value="${recipient.state}"
								readonly="readonly">
						</div>
						<div class="col-md-6 form-group">
							<label><b>Country</b></label> <input class="form-control"
								name="country" type="text" value="${recipient.countryCode}"
								readonly="readonly">
						</div>
						<div class="col-md-6 form-group">
							<label><b>Postal Code</b></label> <input class="form-control"
								name="country" type="text" value="${recipient.postalCode}"
								readonly="readonly">
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Transaction Details:</span>
				</h5>
				<div class="bg-light p-30 mb-5">
					<div class="row">
						<div class="col-md-6 form-group">
							<label><b>Description</b></label> <input name="firstName"
								class="form-control" type="text" value="${transaction.description}"
								readonly="readonly">
						</div>
					</div>
					<table
						class="table table-light table-borderless table-hover text-center mb-0">
						<thead class="thead-dark">
							<tr>
								<th>No</th>
								<th>Picture</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody class="align-middle">
							<c:forEach items="${transaction.itemList.items}" var="item" varStatus="status">
								<tr>
									<td class="align-middle">${status.index + 1}</td>
									<td class="align-middle">${item.name}</td>
									<td class="align-middle">${item.quantity}</td>
									<td class="align-middle"><fmt:formatNumber
											value="${item.price}" type="currency" currencySymbol="$" /></td>
									<td class="align-middle"><fmt:formatNumber
											value="${item.price * item.quantity}" type="currency"
											currencySymbol="$" /></td>
								</tr>
							</c:forEach>
							<tr align="center">
								<th style="vertical-align: middle;" colspan="4" align="right">SUB
									TOTAL</th>
								<td style="vertical-align: middle;"><fmt:formatNumber
										value="${transaction.amount.details.subtotal}" type="currency" currencySymbol="$" /></td>
							</tr>
							<tr align="center">
								<th style="vertical-align: middle;" colspan="4" align="right">TAX</th>
								<td style="vertical-align: middle;"><fmt:formatNumber
										value="${transaction.amount.details.tax}" type="currency" currencySymbol="$" /></td>
							</tr>
							<tr align="center">
								<th style="vertical-align: middle;" colspan="4" align="right">SHIPPING
									FEE</th>
								<td style="vertical-align: middle;"><fmt:formatNumber
										value="${transaction.amount.details.shipping}" type="currency" currencySymbol="$" /></td>
							</tr>
							<tr align="center">
								<th colspan="4" align="right">TOTAL</th>
								<td><fmt:formatNumber value="${transaction.amount.total}" type="currency"
										currencySymbol="$" /></td>
							</tr>
						</tbody>
					</table>
					<form action="execute_payment" method="post">
						<input type="hidden" name="paymentId" value="${param.paymentId}"/>
						<input type="hidden" name="PayerID" value="${param.PayerID}"/>
						<div class="d-flex align-items-center mb-4 pt-2"
							style="margin-left: 300px; margin-right: 300px;">
							<input type="submit"
								class="btn btn-block btn-primary font-weight-bold my-3 py-3" 
								value="Pay Now"/>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<!-- Checkout End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="mail/jqBootstrapValidation.min.js"></script>
	<script src="mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
	<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
</body>

</html>