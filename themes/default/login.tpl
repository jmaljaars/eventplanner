<div>
	<?php if($this->error_msg != ''){ ?>
		<div class="error"><?php echo $this->error_msg; ?></div>	
	<?php } ?>
	<form method="post" action="index.php?route=login/login">
		<table>
			<tr>
				<td>Email:</td>
				<td><input type="text" name="username" value="" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" value="" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" name="submit" value="Inloggen" />
				</td>
			</tr>
		</table>
	</form>
</div>
