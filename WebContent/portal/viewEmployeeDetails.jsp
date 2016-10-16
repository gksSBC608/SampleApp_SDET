<%@page import="java.util.List"%>
<%@page import="com.mindtree.entity.Employee"%>
<%@ include file="head.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>View Employee Information</title>
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->

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
						<h1 class="page-header">View Employee Information</h1>

					</div>
				</div>
				<!-- /.row -->

				<%
					if (session.getAttribute("fetchStatus") != null) {
						String status = (String) session.getAttribute("fetchStatus");
				%>
				<div class="alert alert-info fade in" style="color: red;">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<i class="fa fa-info-circle"></i> <strong><%=status%></strong>
				</div>

				<%
					}
				%>

				<div class="container">
					<form action="getEmployeeDetails.do">

						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-12 text-center"></div>

								<div class="col-lg-12">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">Employee ID:</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<input type="text" name="mid" id="mid" required="required"
													pattern="^[M|m]\d{7}$"
													title="MID should be in Proper Format (M-------)" autocomplete="off" />
											</div>
										</div>
										<div class="col-lg-12 text-center">
											<button type="submit" class="btn btn-xl">Submit</button>
											<button type="reset" class="btn btn-xl">Reset</button>
										</div>

									</div>
								</div>



							</div>
						</div>
					</form>

					<%
						if (session.getAttribute("employeeData") != null) {
							List<Employee> empList = (List<Employee>) session.getAttribute("employeeData");
							if (empList.size() > 0) {
					%>
					<table
						class="table table-striped table-bordered dt-responsive nowrap"
						cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>MID</th>
								<th>Employee Name</th>
								<th>Competency</th>
								<th>Sub Practice</th>
								<th>Vertical</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Employee emp : empList) {
							%>

							<tr>
								<td><%=emp.getMid()%></td>
								<td><%=emp.getName()%></td>
								<td><%=emp.getCompetency()%></td>
								<td><%=emp.getSubpractice()%></td>
								<td><%=emp.getVertical()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<%
						} else {
					%>
					<div class="alert alert-info fade in" style="color: red;">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<i class="fa fa-info-circle"></i> <strong>Employee
							Summary is not Available.</strong>
					</div>

					<%
						}
						}
					%>


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
		session.removeAttribute("fetchStatus");
		session.removeAttribute("employeeData");
	%>
</body>

</html>
