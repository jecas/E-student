<!-- DOCTYPE html -->
<html>
	<head>
		<title> Lična </title>
		<meta charset = 'utf-8'>
		<meta name = 'author' content = 'Jelena Smiljkovic'>
		<link rel = "stylesheet" href = "stil_licna.css">
		<script type = 'text/javascript' src='jquery-3.1.1.min.js'> </script>
		
		<script>
			function prikazi_formu(n){
				var p = document.getElementById("deo_"+n);
				
				if(n==1){
					var p2 = document.getElementById("deo_2");
					if(p2.style.display === "")
						p2.style.display = "none";
				}
				
				if(n == 2){
					var p1 = document.getElementById("deo_1");
					if(p1.style.display === "")
						p1.style.display = "none";
				}
				
				p.style.display = "";
			}
		</script>
	</head>
	
	<body>
	
		<?php
			//postavljamo odg. nivo provere gresaka
			error_reporting(E_ALL);
			
			//prosledjeni indeks
			$indeks = $_GET['indeks'];
				
			//moramo ga parsirati jer je u bazi u obliku ggggbbbb
			list($br_indeksa, $godina_upisa) = explode("/", $indeks);
			
			//indeks u odg. formatu za pretragu u bazi
			$new_indeks = $godina_upisa.$br_indeksa;
			
			//prosledjena lozinka
			$lozinka = $_GET['lozinka'];
			
			//konektujemo se na bazu
			$veza=mysqli_connect('localhost', 'root', '', 'e-students');
			
			//proveramo da li je konekcija uspela
			if(!$veza)
				die("Greška pri povezivanju sa bazom");
			
			//proveravamo da li su lozinka i indeks korektni
			$upit = "select lozinka
					from logovanje
					where indeks = $new_indeks";
						
			//izvrsavamo sql upit
			$rezultat = mysqli_query($veza, $upit) or 
				die("Greška prilikom izvršavanja upita");

			//ako nema redova u rezultatu, znaci da indeks ne postoji u tabeli
			if(mysqli_num_rows($rezultat) == 0){
				echo '<script type = "text/javascript">';
				echo 'alert("Uneli ste pogrešan broj indeksa ili još uvek nemate nalog.")';
				echo '</script>';
				//preusmeravamo korisnika na pocetnu stranicu, kako bi mogao da se registruje
				echo '<script> window.location.href = "pocetna.html"; </script>';
			}
			else{
				$red = mysqli_fetch_row($rezultat);
				if($lozinka != $red[0]){
					echo '<script type = "text/javascript">';
					echo 'alert("Uneli ste pogrešnu lozinku")';
					echo '</script>';
					
					//preusmeravamo korisnika na pocetnu stranicu
					echo '<script> window.location.href = "pocetna.html"; </script>';
				}
			}
			
			//oslobadjamo strukturu rezultat
			mysqli_free_result($rezultat);
		?>
		
		<div id = "levo">
			<div id = "opcije">
				<button type = "button" onclick = "prikazi_formu(1);"> 
					Unesi ispit </button>
				<br>
				<button type = "button" onclick = "prikazi_formu(2)">
					Položeni ispiti </button>
				<br>
				<button type = "button" action = "action" 
					onclick = "window.history.go(-1); return false;"> Odjavljivanje </button>
			</div>
		</div>
		
		<div id = "centar">
			<?php
				//inace ispisujemo ime i prezime
				$upit = "select ime, prezime
						from dosije
						where indeks = $new_indeks";
					
				$rezultat = mysqli_query($veza, $upit) or 
					die("Greška prilikom izvršavanja upita");
			
				$red = mysqli_fetch_row($rezultat);
				echo '<b style = "font-size: 30;">'.$red[0].' '.$red[1].' '.$indeks.'</b>';
			
				//oslobadjamo strukturu rezultat
				mysqli_free_result($rezultat);
			?>
			<br>
			<div id = "akcije">
				<div id = "deo_1" style = "display: none;">
					<form action = "unesi.php", method = "GET">
						<br>
						ID predmeta: 
						<input type = "text" name = "id_predmeta" required> <br>
						Naziv roka:
						<input type = "text" name = "naziv_roka" required> <br>
						Ocena:
						<input type = "text" name = "ocena"> <br>
						Datum ispita:
						<input type = "date" name = "datum_ispita"> <br>
					    Bodovi:
						<input type = "text" name = "bodovi"> <br><br>
						
						<?php
							echo "<input type = 'hidden' name = 'indeks' 
									value = '$new_indeks'>";
							echo "<input type = 'hidden' name = 'lozinka'
									value = '$lozinka'>";
						?>
						<input type = "submit" value = "Unesi">
					</form>
				</div>
				<script>
					$(document).ready(function(){
						//kada kliknemo na dugme submit
						$("form").submit(function(){
						
						//ucitavamo broj indeksa
						var id_predmeta = $("input[name = 'id_predmeta']").val();
					
						//proveravamo da li je unet id_predmeta
						if(id_predmeta === "")
							window.alert("Niste uneli ID predmeta.");
					
						if(isNaN(id_predmeta))
							window.alert("ID predmeta mora biti ceo broj.");
					
						//ucitavamo naziv roka
						var naziv_roka = $("input[name = 'naziv_roka']").val();
						if(naziv_roka.length == 0)
							window.alert("Niste uneli Naziv roka.");
					
						return true;
						});
					});
				</script>
				
				<div id = "deo_2" style = "display: none;">
					<b>Do sada položeni ispiti:</b>
					<?php
						//izdvajamo sve ispite koje je student polozio
						$upit = "select naziv from predmet as p
								where exists(select * 
											from ispit
											where indeks = $new_indeks and
												id_predmeta = p.id_predmeta)";
						
						$rezultat = mysqli_query($veza, $upit) or 
							die("Greska prilikom izvrsavanja upita");
						
						$n = mysqli_num_rows($rezultat);
						if($n == 0)
							echo 'Još uvek nema položenih ispita.';
						else{
							echo '<ul>';
							while($red = mysqli_fetch_assoc($rezultat))
								echo '<li style="color: orange;">'.$red['naziv'].'</li>';
							echo '</ul>';
							
							echo '<b>Ukupno položenih ispita: '.$n.'</b>';
						}
						//oslobadjamo strukturu rezultat
						mysqli_free_result($rezultat); 
			
						//raskidamo konekciju
						mysqli_close($veza);
					?>
				</div>
			</div>
		</div>
		
		<div id = "desno">
			<q> Znati, misliti, sanjati. To je sve. </q> 
			<br> <b> Viktor Igo </b> <br> <br>
			<q> Mana mnogih ljudi je što žele da budu učitelji drugih, a u stvari bi
				trebalo još dugo da ostanu učenici. </q> 
			<br> <b> Baruh de Spinoza </b> <br> <br>
			<q> Nikad nisam ništa naučio pričanjem, nego postavljanjem pitanja. </q>
			<br> <b> Lu Holc </b> <br> <br>
			<q> Učenje je kao veslanje uzvodno, čim se prestane, odmah se kreće unazad. </q>
			<br> <b> Lao Ce </b> <br> <br>
		</div>
	</body>
</html>