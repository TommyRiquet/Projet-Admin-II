<html>

<head>
	<title> WoodyToys B2B </title> 
	<link rel="stylesheet" href="css/index.css">
</head>

<body>

<form method="POST" action="?"> 
	<input type="search" placeholder="nom du produit" name="nomDuProduit">
	<input type="search" placeholder="prix du produit" name="prixDuProduit">
	<button type="submit"> Enregistrer le produit </button>
</form>

<?php
//	$var_mdp = get_env('WOODYTOYS_DATABASE_PASSWORD');
	$bdd = new PDO('mysql:host=135.125.101.237;dbname=woodytoys_db;charset=utf8', 'admin', "root");
	$reponse = $bdd->query("SELECT * FROM Produits");

	while($donneesProduits = $reponse->fetch())
					{
						echo '<div id="divProduit">' . $donneesProduits["nomProduit"] . " " . $donneesProduits["prodPrix"] . " €</div>";
					}
					$reponse->closeCursor();

	if (isset($_POST["nomDuProduit"])) {
		$requete_insertion = $bdd -> prepare('INSERT INTO Produits(nomProduit, prodPrix) VALUES (:nomProduit_param, :prodPrix_param)');

		$requete_insertion->execute(array(
			'nomProduit_param' => $_POST["nomDuProduit"],
			'prodPrix_param' => $_POST["prixDuProduit"]
		));
	}
?>
</body>

</html>