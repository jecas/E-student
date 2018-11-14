<?php
	//ocitavamo unete podatke
	$id_predmeta = $_GET['id_predmeta'];
	$naziv_roka = $_GET['naziv_roka'];
	$ocena = $_GET['ocena'];
	$datum_ispita = $_GET['datum_ispita'];
	$bodovi = $_GET['bodovi'];
	$indeks = $_GET['indeks'];
	$lozinka = $_GET['lozinka'];
	
	//parsiramo naziv roka, izdvajamo godinu od meseca
	$godina_roka = intval(substr($naziv_roka, -4, 4));
	$mesec_roka = strtolower(substr($naziv_roka, 0, 3));
	
	//konektujemo se na bazu
	$veza = mysqli_connect('localhost', 'root', '', 'e-students');
	
	//proveramo da li je konekcija uspela
	if(!$veza)
		die("Greška pri povezivanju sa bazom");
	
	//proveravamo da li ispitni rok postoji u bazi
	$upit = "select * from ispitni_rok where godina_roka = $godina_roka 
			and oznaka_roka = '$mesec_roka';";
	
	$rezultat = mysqli_query($veza, $upit);
	
	if(mysqli_num_rows($rezultat) == 0){
		//ispitni rok ne postoji u bazi, pa ga dodajemo
		$dodaj_rok_upit = "insert into ispitni_rok
				values ($godina_roka, '$mesec_roka', '$naziv_roka');";
		
		if($veza->query($dodaj_rok_upit) !== TRUE)
			echo 'Error: '.$dodaj_rok_upit.'<br>'.$veza->error;
	}
	
	//unosimo u tabelu ispit
	$upit = "insert into ispit
			values ($indeks, $id_predmeta, $godina_roka, '$mesec_roka', $ocena, 
					'$datum_ispita', $bodovi);";
					
	//izvrsavamo upit
	if($veza->query($upit) === TRUE){
		echo 'Uspešno ste dodali ispit.';
		echo '<br><a href = "javascript:history.back()">Vrati se nazad </a>';
	}
	else{
		echo 'Ispit već postoji u bazi.';
		echo '<br><a href = "javascript:history.back()">Vrati se nazad </a>';
	}
	//raskidamo konekciju
	mysqli_close($veza);
?>
