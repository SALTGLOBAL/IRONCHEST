
<!-- Modal -->
<div id="loginpop" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="row">
				<div class="col-sm-6 login">
					<h4>Login</h4>
					<form class="" role="form" action="process.php" method="POST">
						<div class="form-group">
							<label class="sr-only" for="exampleInputEmail2">Email address</label>
							<input type="email" class="form-control" id="user" name="user" placeholder="Enter email">
						</div>
						<div class="form-group">
							<label class="sr-only" for="exampleInputPassword2">Password</label>
							<input type="password" class="form-control" id="pass" name="pass" placeholder="Password">
						</div>
						<button type="submit" class="btn btn-success" id="btn" name="login_btn" value="login">Sign in</button>
					</form>          
				</div>
				<div class="col-sm-6">
					<h4>New User Sign Up</h4>
					<p>Join today and get updated with all the properties deal happening around.</p>
					<button type="submit" class="btn btn-info"  onclick="window.location.href='register.php'">Join Now</button>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- /.modal -->


<script>
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
    close[i].onclick = function(){
        var div = this.parentElement;
        div.style.opacity = "0";
        setTimeout(function(){ div.style.display = "none"; }, 600);
    }
}
</script>
</body>
</html>



