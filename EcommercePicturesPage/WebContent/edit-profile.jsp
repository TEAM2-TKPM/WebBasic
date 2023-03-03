<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
								<a href="#" class="nav-link dropdown-toggle"
									data-toggle="dropdown" id="page">Pages <i
									class="fa fa-angle-down mt-1"></i></a>
								<div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
									<a href="view_cart" class="dropdown-item">Shopping Cart</a> <a
										href="view_checkout" class="dropdown-item">Checkout</a>
								</div>
							</div>
							<a href="contact.jsp" class="nav-item nav-link" id="contact">Contact</a>
							<a href="#" class="nav-item nav-link active" id="contact">Profile</a>
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

	<div class="container">
		<div class="main-body">

			<!-- Breadcrumb -->
			<nav aria-label="breadcrumb" class="main-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="home">Home</a></li>
					<li class="breadcrumb-item"><a href="view_profile">Profile</a></li>
					<li class="breadcrumb-item active" aria-current="page">Edit
						Profile</li>
				</ol>
			</nav>
			<!-- /Breadcrumb -->

			<div class="row gutters-sm">
				<div class="col-md-4 mb-3">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
								<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
									alt="Admin" class="rounded-circle" width="150">
								<div class="mt-3">
									<h4>${loggedCustomer.fullname}</h4>
									<p class="text-muted font-size-sm">${loggedCustomer.email}</p>
									<!-- <button class="btn btn-primary">Follow</button>
									<button class="btn btn-outline-primary">Message</button> -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="card mb-3">
						<div class="card-body">
							<form id="CustomerForm" action="update_profile" method="post">
								<div class="modal-header">
									<h4 class="modal-title">Edit Customer</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<input type="hidden" id="customerId" name="customerId"
											class="form-control" value="${loggedCustomer.customerId}" required>
									</div>
									<div class="form-group">
										<label>Email</label> <input type="email" id="email"
											name="email" class="form-control" value="${loggedCustomer.email}"
											required>
									</div>
									<div class="form-group">
										<label>First name</label> <input type="text" id="firstName"
											name="firstName" class="form-control"
											value="${loggedCustomer.firstname}" required>
									</div>
									<div class="form-group">
										<label>Last name</label> <input type="text" id="lastName"
											name="lastName" class="form-control"
											value="${loggedCustomer.lastname}" required>
									</div>
									<div class="form-group">
										<label>Password</label> <input type="password" id="password"
											name="password" class="form-control"
											value="${loggedCustomer.password}" required>
									</div>
									<div class="form-group">
										<label>Confirm password</label> <input type="password"
											id="confirmPassword" name="confirmPassword"
											class="form-control" value="${loggedCustomer.password}" required>
									</div>
									<div class="form-group">
										<label>Phone numer</label> <input type="text" id="phone"
											name="phone" class="form-control" value="${loggedCustomer.phone}"
											required>
									</div>
									<div class="form-group">
										<label>Address Line 1</label> <input type="text" id="address1"
											name="address1" class="form-control"
											value="${loggedCustomer.addressLine1}" required>
									</div>
									<div class="form-group">
										<label>Address Line 2</label> <input type="text" id="address2"
											name="address2" class="form-control"
											value="${loggedCustomer.addressLine2}" required>
									</div>
									<div class="form-group">
										<label>City</label> <input type="text" id="city" name="city"
											class="form-control" value="${loggedCustomer.city}" required>
									</div>
									<div class="form-group">
										<label>State</label> <input type="text" id="state" name="state"
											class="form-control" value="${loggedCustomer.state}" required>
									</div>
									<div class="form-group">
										<label>Country</label> <input type="text" id="country"
											name="country" class="form-control"
											value="${loggedCustomer.country}" required>
									</div>
								</div>
								<div align="center">
									<input type="button" class="btn btn-default"
										onClick="javascript:history.go(-1)" data-dismiss="modal"
										value="Cancel"> <input type="submit"
										class="btn btn-primary" value="Save">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
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
	<!-- Template Javascript -->
	<script src="js/main.js"></script>
	
	<!-- Valid -->
	<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script src="js/customer.js"></script>
</body>

</html>