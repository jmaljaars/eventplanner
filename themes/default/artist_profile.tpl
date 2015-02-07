<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<table class="list">
		
		<tr>
			<td>&nbsp;</td>
			<td><h1><?php echo $this->artist['name']; ?></h1></td>
		</tr>
		
		<tr>
			<td>Prijs:</td>
			<td><?php echo $this->artist['rate']; ?></td>
		</tr>
		
		<?php if(isset($this->artist['website']) and $this->artist['website'] != '') : ?>
		<tr>
			<td>Website:</td>
			<td>
					<a target=_blank href="http://<?php echo $this->artist['website']; ?>">
						<?php echo $this->artist['website']; ?>
					</a>
				
			</td>
		</tr>
		<?php endif; ?>
		
		<?php if(isset($this->artist['image']) and $this->artist['image'] != '') : ?>
		<tr>
			<td>&nbsp;</td>
			<td>
					<img style="max-width:380px" src="images/<?php echo $this->artist['image']; ?>" />
			</td>
		</tr>
		<?php endif; ?>

		<tr><td colspan="2"><input type="button" name="btnBack" value="Terug naar overzicht" onclick="document.location.href='index.php?route=artist/overview&token=<?php echo $_GET['token']; ?>'" /></td></tr>
	</table>

</div>








