<?php

	$mysqli = new mysqli("127.0.0.1", "root", "", "jachtydb", 3306);

	$vechicleID = 0;
	$result = $mysqli->query("SELECT * FROM jachty");

	$vechicles = [];
	for ($row_no = $result->num_rows - 1; $row_no >= 0; $row_no--) {
		$row = $result->fetch_assoc();
		$vechicles[] = $row;
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
					
					<li class="nav-item active">
						<a class="nav-link" href="jechty.php"> Jachty </a>
					</li>
					
					<li class="nav-item">
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
					<h1 >Nasze Jachty</h1>	
				</div>		
				
				<?php foreach ($vechicles as $vech): ?>

					<div class="row jacht" id="nr_<?php echo $vech; ?>">	
					
						<div class="picture col-lg-4">	
							<a><img src="<?php echo $vech["image"]; ?>"></a>
						</div>
						
						<div class="p_text col-lg-8">	
							<?php echo $vech["Opis"]; ?>
						</div>

					</div>	

				<?php endforeach; ?>
					
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

