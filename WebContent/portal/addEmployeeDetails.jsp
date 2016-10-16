<%@ include file="head.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Add Employee Information</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body style="background-image: url(../img/header-bg.jpg)">
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="../index.jsp">Employee
					Information</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">

					<li><a class="page-scroll" href="addEmployeeDetails.jsp">Add
							Details</a></li>
					<li><a class="page-scroll" href="viewEmployeeDetails.jsp">View
							Details</a></li>
				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div>
		<div id="page-wrapper">

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Add Employee Information</h1>

					</div>
				</div>
				<!-- /.row -->

				<%
					if (session.getAttribute("addStatus") != null) {
						String status = (String) session.getAttribute("addStatus");
				%>
				<div class="alert alert-info fade in">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<i class="fa fa-info-circle"></i> <strong><%=status%></strong>
				</div>

				<%
					}
				%>

				<div class="container">

					<div class="row">
						<div class="col-lg-12">
							<div class="col-lg-12 text-center"></div>

							<div class="col-lg-12">
								<form action="addEmployeeDetail.do" method="post">
									<div class="row">
										<div class="col-md-6">

											<div class="form-group">Employee ID:</div>

											<div class="form-group">Employee Name:</div>

											<div class="form-group">Competency:</div>

											<div class="form-group">Sub practice:</div>

											<div class="form-group">Vertical:</div>

										</div>

										<div class="col-md-6">
											<div class="form-group">
												<input type="text" name="mid" id="id" required="required"
													pattern="^[M|m]\d{7}$"
													title="MID should be in Proper Format (M-------)"
													autocomplete="off" />
											</div>

											<div class="form-group">
												<input type="text" name="name" id="name" required="required"
													autocomplete="off" />
											</div>

											<div class="form-group">
												<select name="comp" id="comp" required="required">
													<option value="C1" selected="selected">C1</option>
													<option value="C2">C2</option>
													<option value="C3">C3</option>
													<option value="C4">C4</option>
													<option value="C5">C5</option>
													<option value="C6">C6</option>
													<option value="C7">C7</option>
												</select>
											</div>

											<div class="form-group">
												<input type="text" name="s_prac" id="s_prac"
													required="required" autocomplete="off" />
											</div>

											<div class="form-group">
												<input type="text" name="vert" id="vert" required="required"
													autocomplete="off" />
											</div>

										</div>

										<div class="col-lg-12 text-center">
											<button type="submit" class="btn btn-xl"
												onclick="return validate()">Submit</button>
											<button type="reset" class="btn btn-xl">Reset</button>

										</div>
									</div>
								</form>

							</div>

						</div>
					</div>
				</div>

			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->



	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	<%
		session.removeAttribute("addStatus");
	%>

</body>

</html>
