<?php
try {
    $connexion = new PDO('mysql:host=localhost;dbname=locauto', 'root', '');
    $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Erreur de connexion : " . $e->getMessage();
    exit();
}

// Récupérer les voitures qui ne sont pas actuellement louées
$sql = "
    SELECT v.id_voiture, v.immatriculation, v.compteur, m.libelle as modele, m.image
    FROM Voiture v
    JOIN Modele m ON v.id_modele = m.id_modele
    LEFT JOIN Location l ON v.id_voiture = l.id_voiture AND l.date_fin >= CURDATE()
    WHERE l.id_voiture IS NULL
";
$result = $connexion->query($sql);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voitures Disponibles</title>
    <link rel="stylesheet" href="styles2.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="image.png" alt="Car Logo">
        </div>
        <div class="bloc">
            <video autoplay="autoplay" muted="" loop="infinite" src="nigzz.mp4"></video>
        </div>
        <nav>
            <ul>
                <li><a href="php2.php">Stock de véhicule</a></li>
                <li><a href="#">Ajouter véhicule</a></li>
                <li><a href="#">Ajouter client</a></li>
                <li><a href="#">Historique</a></li>
            </ul>
        </nav>
    </header>
    <h1>Liste des Voitures Disponibles</h1>

    <div class="cars">
        <?php
        if ($result->rowCount() > 0) {
            while($row = $result->fetch(PDO::FETCH_ASSOC)) {
                echo "<div class='car'>";
                echo "<h2>" . htmlspecialchars($row['immatriculation']) . "</h2>";
                echo "<p>Modèle: " . htmlspecialchars($row['modele']) . "</p>";
                echo "<p>Compteur: " . htmlspecialchars($row['compteur']) . " km</p>";
                echo "<img src='images/" . htmlspecialchars($row['image']) . "' alt='" . htmlspecialchars($row['modele']) . "'>";
                echo "</div>";
            }
        } else {
            echo "Aucune voiture disponible.";
        }
        ?>
    </div>
</body>
</html>

<?php $connexion = null; ?>
