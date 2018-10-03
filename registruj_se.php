<?php
	
	//ocitavamo unete podatke
	$ime = $_GET['ime'];
	$prezime = $_GET['prezime'];
	$indeks = $_GET['indeks'];
	$lozinka = $_GET['lozinka'];
	$upis = $_GET['datum_upisa'];
	$rodjenje = $_GET['datum_rodjenja'];
	$mesto = $_GET['mesto_rodjenja'];
	
	//konektujemo se na bazu
	$veza=mysqli_connect('localhost', 'root', '', 'e-students');
			
	//proveramo da li je konekcija uspela
	if(!$veza)
		die("Greška pri povezivanju sa bazom");
	
	//parsiranje indeksa, zbog oblika u bazi
	list($br_indeksa, $godina_upisa) = explode("/", $indeks);
			
	//indeks u odg. formatu za unos u bazu
	$new_indeks = $godina_upisa.$br_indeksa;
	
	//unosimo studenta u tabelu dosije
	$upit = "insert into dosije (indeks, ime, prezime, datum_upisa, 
								datum_rodjenja, mesto_rodjenja)
			values ($new_indeks, '$ime', '$prezime', '$upis', '$rodjenje', '$mesto');";
			
	//izvrsavamo upit
	if($veza->query($upit) !== TRUE)
		echo "Error: ".$upit."<br>".$veza->error;
	
	//unosimo studenta u tabelu logovanje
	$upit = "insert into logovanje (indeks, lozinka)
			values ($new_indeks, '$lozinka')";
			
	//izvrsavamo upit
	if($veza->query($upit) === TRUE)
		$msg = "Uspesno ste se registrovali. Prijavite se da biste videli
				svoje podatke.";
	else
		echo "Error: ".$upit."<br>".$veza->error;
	
	//raskidamo konekciju
	mysqli_close($veza);
	
	if(isset($msg)){
		echo $msg;
		echo "<script> setTimeout(\"location.href = 'pocetna.html';\",3000); </script>";
	}
?>
