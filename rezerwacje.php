<?php
	include_once($_SERVER['DOCUMENT_ROOT'] . "/zadanie/utils/calendar.php");

	$mysqli = new mysqli("127.0.0.1", "root", "", "jachtydb", 3306);

	$vechicleID = 1;
	if (isset($_GET["vechicleID"]) && is_numeric($_GET["vechicleID"])) {
		$vechicleID = $_GET["vechicleID"];
	}
	
	$result = $mysqli->query("SELECT * FROM rezerwacje WHERE ID_jachtu = " . intval($vechicleID) . " ORDER BY Rezerwacja_od DESC");
	
	for ($row_no = $result->num_rows - 1; $row_no >= 0; $row_no--) {
		$result->data_seek($row_no);
		$row = $result->fetch_assoc();
		$fromTime = strtotime($row["Rezerwacja_od"]);
		$toTime = strtotime($row["Rezerwacja_do"]);
		$datediff = $toTime - $fromTime;
		$dayCnt = round($datediff / (60 * 60 * 24));

		for ($i = 0; $i <= $dayCnt; $i++) {
			$Date = $row["Rezerwacja_od"];
			$dateSlot = date('Y-m-d', strtotime($Date. ' + '.$i.' days'));
			$dateArray[$dateSlot] = $dateSlot;
		}
	}

	$resultName = $mysqli->query("SELECT ID, Nazwa  FROM jachty ORDER BY ID DESC");
	$vechicles=[];
	for ($row_no = $resultName->num_rows - 1; $row_no >= 0; $row_no--) {
		$row = $resultName->fetch_assoc();
		$vechicles[]=$row;

	}
?>

<!DOCTYPE html>
<html lang="pl">
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>Jachty</title>
	<meta http-equiv="X-Ua-Compatible" content="IE=edge">
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="main.css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&amp;subset=latin-ext" rel="stylesheet">
	
	<!--[if lt IE 9]>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
	<![endif]-->
	<script type="text/javascript">
		function onChangeVechicle() {
			document.getElementById("vechicleForm").submit();
		}

		function change(value) {
			all= $(".cal");
			active= $(".cal.d-block").first();
			next=active.next();
			prev=active.prev();
			if(value === 1){
				if(!next.hasClass("cal")) return;

				active.removeClass("d-block");
				active.addClass("d-none");
				next.removeClass("d-none");
				next.addClass("d-block");
			}

			if(value === -1){
				if(!prev.hasClass("cal")) return;

				active.removeClass("d-block");
				active.addClass("d-none");
				prev.removeClass("d-none");
				prev.addClass("d-block");
			}
		}

		
	</script>

	<style>
		.busy-day {
			background: silver;
		}
	</style>

</head>

<body>

	<header>
	
		<nav class="navbar navbar-dark k-menu navbar-expand-sm">
		
			<a class="navbar-brand" href="index.html"><img src="img/log.png" width="50" height="50" class="d-inline-block ml-3 align-bottom" alt=""></a>
		
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu">
				<span class="navbar-toggler-icon"></span>
			</button>
		
			<div class="collapse navbar-collapse c-menu  " id="menu"   >
			
				<ul class="navbar-nav ml-auto mr-5" >
						
					<li class="nav-item">
						<a class="nav-link" href="index.html"> O firmie </a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" href="jechty.php"> Jachty </a>
					</li>
					
					<li class="nav-item active">
						<a class="nav-link" href="rezerwacje.php"> Rezerwacje </a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" href="kontakt.html"> Kontakt </a>
					</li>
				
				</ul>
			
			</div>
		
		</nav>
	
	</header>
	
	<main>	
			<div class="container">
			
				<div class="header">	
					<h1 >Rezerwacja</h1>	
				</div>
				
				<div class="row">	

					<div class="col-lg-6">

						<form method="get" id="vechicleForm">

							<label>Wybierz Jacht, który Ciebie interesuje </label>

							<select name="vechicleID"  onChange="onChangeVechicle()">
							
								<?php foreach ($vechicles as $vech): ?>
									<option value="<?php echo $vech["ID"]; ?>" <?php if($vechicleID == $vech["ID"]) { echo "selected"; } ?>><?php echo $vech["Nazwa"]; ?></option>
								<?php endforeach; ?>

							</select>

						</form>

						<br>
						<p>W celu rezerwacji jachtu prosimy o kontak telefoniczny lub mailowy</p>
						<p>(szare pola są zarezerwowane)</p>

					</div>

					<div class="col-lg-6">

						<button type="button" class="btn btn-outline-secondary " onclick="change(-1)"><</button>
						<button type="button" class="btn btn-outline-secondary " onclick="change(+1)">></button>

						<div class="d-block cal">
							<?php
							$dateComponents = getdate();
							$month = $dateComponents['mon'];  // Pobieranie obecenego miesiaca                
							$year = $dateComponents['year'];

							echo build_calendar($month, $year, $dateArray);
							?>
						</div>	
						
						<div class="d-none cal">
							<?php
							$dateComponents = getdate();
							$month = $dateComponents['mon'];                  
							$year = $dateComponents['year'];

							echo build_calendar($month +1, $year, $dateArray);
							?>
						</div>	

						<div class="d-none cal">
							<?php
							$dateComponents = getdate();
							$month = $dateComponents['mon'];                  
							$year = $dateComponents['year'];

							echo build_calendar($month +2, $year, $dateArray);
							?>
						</div>	
						
					</div>
				</div>	
			</div>				
		
			
	</main>
	
	<footer class="text-muted">

      <div class="container ml-1">

        <p class="float-left text_footer" >
			Jachty<br>Lądek-Zdrój<br>ul. Poprawna 284C
        </p>

      </div>

    </footer>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	
	<script src="js/bootstrap.min.js"></script>
	
</body>
</html>