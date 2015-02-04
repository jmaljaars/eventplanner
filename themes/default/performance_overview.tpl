<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
        <div>
        <select id="event" name="event" onchange="SelectRows()">
            <option value="">Alle Events</option>   
            <?php foreach($this->events as $events){ ?>
                <option value="<?php echo $events['event_id']; ?>"  <?php echo(isset($_GET['event']) && $events['event_id']==$_GET['event'])?'selected':'' ?> >
                <?php echo $events['name']; ?>
                </option>
            <?php } ?>
        </select>
        <select id="artist" name="artist" onchange="SelectRows()">
            <option value="">Alle Artiesten</option>   
            <?php foreach($this->artists as $artists){ ?>
                <option value="<?php echo $artists['artist_id']; ?>" <?php if (isset($_GET['artist']) && isset($_GET['artist'])) echo($artists['artist_id']==$_GET['artist'])?'selected':'' ?> >
                <?php echo $artists['name']; ?>
                </option>
            <?php } ?>
        </select>
        </div>
	<table class="list">
            <thead>
                <tr>
                    <td>Event</td>
                    <td>Titel</td>
                    <td>Artiest</td>
                    <td>Start datum</td>
                    <td>Eind datum</td>
                    <td>Confirmed</td>
                    <td colspan="1">&nbsp;</td> 
                </tr>
            </thead>
		<?php foreach($this->performance as $perf){ ?>
            <tr class="row artist_<?php echo $perf['artist_id'] ?> event_<?php echo $perf['event_id'] ?>">
                <td><?php echo $perf['eventname']; ?></td>
                <td><?php echo $perf['performance_title']; ?></td>
                <td><?php echo $perf['artistname']; ?></td>
                <td><?php echo $perf['date_from']; ?></td>
                <td><?php echo $perf['date_until']; ?></td>
                <td><?php echo $perf['confirmed']; ?></td>
                <td><a href="index.php?route=performance/edit&id=<?php echo $perf['performance_id'] ?>&token=<?php echo $_GET['token'] ?>">Edit</a></td>
		<!--		<td><a href="index.php?route=event/delete&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>">Delete</a></td> -->
			</tr>
		<?php } ?>		
		<tr><td colspan="6"><input type="button" onclick="addPerformance();" value="Performance toevoegen" /></td></tr>
	</table>
</div>

<script>
	function addPerfomance(){
		document.location.href='index.php?route=performance/add&token=<?php echo $_GET['token'] ?> ';
	}
	function __SelectEvent(){
            var myselect = document.getElementById("event");
            var str = myselect.options[myselect.selectedIndex].value;
            var location = 'index.php?route=performance/overview&event='.concat(str,'&token=<?php echo $_GET['token'] ?>');
            document.location.href=location;
        }
    function SelectRows(){
		event_id = $('select[name="event"]').val();
		artist_id = $('select[name="artist"]').val();

		if(event_id == '' && artist_id == ''){
			$('.row').show();
		}else{
			$('.row').hide();

			if(event_id != ''){
				if(artist_id != ''){
					$('.event_'+event_id+'.artist_'+artist_id).show();
				}else{
					$('.event_'+event_id).show();
				}
			}else if(artist_id != ''){
					$('.artist_'+artist_id).show();
			}
		}			

		

/*
        var myselect = document.getElementById("artist");
        var str = myselect.options[myselect.selectedIndex].value;
        var location = 'index.php?route=performance/overview&artist='.concat(str,'&token=<?php echo $_GET['token'] ?>');
        document.location.href=location;
*/
    }
</script>