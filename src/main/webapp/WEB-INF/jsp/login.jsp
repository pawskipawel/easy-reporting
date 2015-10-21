<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- jQuery  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>


<!--  TAG FOR JQUERY VALIDATION PLUGIN -->
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style>
.form-signin {
	max-width: 500px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.peopleCarouselImg img {
  width: auto;
  height: 225px;
  max-height: 225px;
}

</style>

<br>
<br>

<div class="row">
	<div class="col-xs-7">

		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img class="peopleCarouselImg" src="${pageContext.request.contextPath}/images/coffee.png"
						alt="Chania">
					<div class="carousel-caption">
						<h3>Make work easier</h3>
						<p>Using ERS solution you have control</p>
					</div>
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/images/clock.png"
						alt="Chania">
					<div class="carousel-caption">
						<h3>Save time</h3>
						<p>Using ERS you optimize processes</p>
					</div>
				</div>

				<div class="item">
					<img src="${pageContext.request.contextPath}/images/view.png"
						alt="Chania">
					<div class="carousel-caption">
						<h3>Access almost everywhere</h3>
						<p>Use ERS where you want</p>
					</div>
				</div>

			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

	</div>


	<div class="col-xs-5">
		<form class="form-signin" action="/easy-reporting/login" method="POST">
			<h2 class="form-signin-heading">Please sign in</h2>
			<input type="text" name="username" class="form-control"
				placeholder="Name" required> <input type="password"
				name="password" class="form-control" placeholder="Password" required>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
				in</button>
		</form>

	</div>
</div>

<script type="text/javascript">
	$('.carousel').carousel()
</script>


