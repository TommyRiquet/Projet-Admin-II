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
    $db_user = getenv('MYSQL_USER');
	$db_mdp = getenv('MYSQL_PSW');
    try {
        $bdd = new PDO('mysql:host=172.16.0.3;dbname=woodytoys_db;',username: $db_user, password: $db_mdp);
        $bdd->exec("SET CHARACTER SET utf8");
    }catch (\PDOException $e){
        throw new \PDOException($e->getMessage(), (int)$e->getCode());
    }
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
    $bdd = null;
?>
</body>

</html>