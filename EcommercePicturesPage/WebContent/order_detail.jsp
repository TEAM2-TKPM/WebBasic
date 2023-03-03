<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="Header.jsp" />
</head>

<body>
	<!-- Navbar Start -->
	<div class="container-fluid bg-dark mb-30">
		<div class="row px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a
					class="btn d-flex align-items-center justify-content-between bg-primary w-100"
					data-toggle="collapse" href="#navbar-vertical"
					style="height: 65px; padding: 0 30px;">
					<h6 class="text-dark m-0">
						<i class="fa fa-bars mr-2"></i>Categories
					</h6> <i class="fa fa-angle-down text-dark"></i>
				</a>
				<nav
					class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
					id="navbar-vertical"
					style="width: calc(100% - 30px); z-index: 999;">
					<div class="navbar-nav w-100">
						<div class="nav-item dropdown dropright">
							<a href="#" class="nav-link dropdown-toggle"
								data-toggle="dropdown">Hot <i
								class="fa fa-angle-right float-right mt-1"></i></a>
							<div
								class="dropdown-menu position-absolute rounded-0 border-0 m-0">
								<c:forEach var="c" items="${listCategory}">
									<a href="view_category?id=${c.categoryId}"
										class="dropdown-item">${c.name}</a>
								</c:forEach>
							</div>
						</div>
						<c:forEach var="c" items="${listCategory}">
							<a href="view_category?id=${c.categoryId}"
								class="nav-item nav-link">${c.name}</a>
						</c:forEach>
					</div>
				</nav>
			</div>
			<div class="col-lg-9">
				<nav
					class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
					<a href="index.html" class="text-decoration-none d-block d-lg-none">
						<span class="h1 text-uppercase text-dark bg-light px-2">Pictures</span>
						<span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
					</a>
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse" action="Header.html">
						<div class="navbar-nav mr-auto py-0">
							<a href="home" class="nav-item nav-link" id="home">Home</a> <a
								href="view_category" class="nav-item nav-link" id="shop">Shop</a>
							<a href="view_picture?id=2" class="nav-item nav-link"
								id="shop_detail">Shop Detail</a>
							<div class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle active"
									data-toggle="dropdown" id="page">Pages <i
									class="fa fa-angle-down mt-1"></i></a>
								<div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
									<a href="view_cart" class="dropdown-item">Shopping Cart</a> <a
										href="#" class="dropdown-item">Checkout</a>
								</div>
							</div>
							<a href="contact.jsp" class="nav-item nav-link" id="contact">Contact</a>
						</div>
						<div class="navbar-nav ml-auto py-0 d-none d-lg-block">
							<a href="" class="btn px-0"> <i
								class="fas fa-heart text-primary"></i> <span
								class="badge text-secondary border border-secondary rounded-circle"
								style="padding-bottom: 2px;">0</span>
							</a> <a href="view_cart" class="btn px-0 ml-3"> <i
								class="fas fa-shopping-cart text-primary"></i> <span
								class="badge text-secondary border border-secondary rounded-circle"
								style="padding-bottom: 2px;">${cart.totalQuantity}</span>
							</a>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- Navbar End -->

	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="home">Home</a> <a
						class="breadcrumb-item text-dark" href="view_category">Shop</a> <span
						class="breadcrumb-item active">My Order Details</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->
	<c:if test="${order == null}">
		<div align="center">
			<h5 class="section-title position-relative text-uppercase mb-3">
				<span class="bg-secondary pr-3">Sorry, you are not authorized
					to view this order!</span>
			</h5>
		</div>
	</c:if>
	<!-- Checkout Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<c:if test="${order != null}">
				<div class="col-lg-12">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">View Order's information
							(Order ID:${order.orderId})</span>
					</h5>
					<div class="bg-light p-30 mb-5">
						<div class="row">
							<div class="col-md-6 form-group">
								<label><b>Order By</b></label> <input readonly="readonly"
									class="form-control" type="text" value="${order.customer.fullname}">
							</div>
							<div class="col-md-6 form-group">
								<label><b>Order Status</b></label> <input readonly="readonly"
									class="form-control" type="text" value="${order.status}">
							</div>
							<div class="col-md-6 form-group">
								<label><b>Order Date</b></label> <input readonly="readonly"
									class="form-control" type="text" value="${order.orderDate}">
							</div>
							<div class="col-md-6 form-group">
								<label><b>Quantity</b></label> <input readonly="readonly"
									class="form-control" type="text" value="${order.pictureCopies}">
							</div>
							<div class="col-md-6 form-group">
								<label><b>Total Amount</b></label> <input readonly="readonly"
									class="form-control" type="text"
									value="<fmt:formatNumber
													value="${order.total}" type="currency" currencySymbol="$" />">
							</div>
							<div class="col-md-6 form-group">
								<label><b>Payment Method</b></label> <input readonly="readonly"
									class="form-control" type="text" value="${order.paymentMethod}">
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">View Recipient's information
							(Customer ID:${order.customer.customerId})</span>
					</h5>
					<div class="bg-light p-30 mb-5">
						<div class="row">
							<div class="col-md-6 form-group">
								<label><b>First Name</b></label> <input readonly="readonly"
									class="form-control" type="text" value="${order.firstname}">
							</div>
							<div class="col-md-6 form-group">
								<label><b>Last Name</b></label> <input readonly="readonly"
									class="form-control" type="text" value="${order.lastname}">
							</div>
							<div class="col-md-6 form-group">
								<label><b>Recipient Phone</b></label> <input readonly="readonly"
									class="form-control" type="text"
									value="${order.phone}">
							</div>
							<div class="col-md-6 form-group">
								<label><b>Address Line 1</b></label> <input readonly="readonly"
									class="form-control" type="text"
									value="${order.addressLine1} ">
							</div>
							<div class="col-md-6 form-group">
								<label><b>Address Line 2</b></label> <input readonly="readonly"
									class="form-control" type="text"
									value="${order.addressLine2} ">
							</div>
							<div class="col-md-6 form-group">
								<label><b>City</b></label> <input readonly="readonly"
									class="form-control" type="text"
									value="${order.city} ">
							</div>
							<div class="col-md-6 form-group">
								<label><b>State</b></label> <input readonly="readonly"
									class="form-control" type="text"
									value="${order.state} ">
							</div>
							<div class="col-md-6 form-group">
								<label><b>Country</b></label> <input readonly="readonly"
									class="form-control" type="text"
									value="${order.countryName} ">
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">View Ordered Pictures</span>
					</h5>
					<div class="bg-light p-30 mb-5">
						<table
							class="table table-light table-borderless table-hover text-center mb-0">
							<thead class="thead-dark">
								<tr>
									<th>No</th>
									<th>Picture</th>
									<th>Author</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Total</th>
								</tr>
							</thead>
							<tbody class="align-middle">
								<c:forEach var="orderDetail" items="${order.orderDetails}"
									varStatus="status">
									<tr>
										<td class="align-middle">${status.index + 1}</td>
										<td class="align-middle"><img class="img-fluid w-90"
											style="height: 100px; padding: 10px; margin-left: auto; margin-right: auto;"
											src="data:image/jpg;base64,${orderDetail.picture.base64Image}"
											alt="Image">${orderDetail.picture.title}</td>
										<td class="align-middle">${orderDetail.picture.author}</td>
										<td class="align-middle"><fmt:formatNumber
												value="${orderDetail.picture.price}" type="currency"
												currencySymbol="$" /></td>
										<td class="align-middle">${orderDetail.quantity}</td>
										<td class="align-middle"><fmt:formatNumber
												value="${orderDetail.subtotal}" type="currency"
												currencySymbol="$" /></td>
									</tr>
								</c:forEach>
								<tr align="center">
									<th colspan="4" align="right">TOTAL</th>
									<td>${order.pictureCopies}</td>
									<td><fmt:formatNumber value="${order.total}"
											type="currency" currencySymbol="$" />
										<br/>(Shipping fee and tax included)
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
		</div>

	</div>
	<!-- Checkout End -->

	<!-- Footer Start -->
	<jsp:include page="Footer.jsp" />
	<!-- Footer End -->


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