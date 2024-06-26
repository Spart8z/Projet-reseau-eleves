<?php

include("config.php");

$message = '';

if (isset($_POST['nom']) && isset($_POST['motDePasse'])) {
    $username = $_POST['nom'];
    $password = password_hash($_POST['motDePasse'], PASSWORD_DEFAULT);
    $email = $_POST['email'];
    $prenom= $_POST['prenom'];
    $tel= $_POST['numeroTelephone'];

    $sql = "INSERT INTO etudiant (email, nom, prenom, numeroTelephone, motDePasse) VALUES (:email, :nom, :prenom, :numeroTelephone, :motDePasse)";
    $stmt = $pdo->prepare($sql);
    $result = $stmt->execute(['email' => $email, 'nom' => $username, 'prenom' => $prenom, 'numeroTelephone' => $tel, 'motDePasse' => $password]);

    if ($result) {
        $message = 'Inscription réussie!';
        header('Location: login.php');
    } else {
        $message = 'Erreur lors de l\'inscription.';
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription</title>
    <style>
        /* Utilisez le même CSS que login.php */
        body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.login-container {
    max-width: 400px;
    margin: 100px auto;
    background-color: #fff;
    padding: 20px 30px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

h2 {
    margin-top: 0;
    color: #333;
}

label {
    display: block;
    margin-bottom: 8px;
    color: #555;
}

input[type="text"], input[type="password"], input[type="email"], input[type="tel"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
}

input[type="submit"] {
    background-color: #1FA055;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

p {
    color: red;
    font-weight: bold;
}

    </style>
</head>
<body>

<div class="login-container">
    <h2>Inscription</h2>

    <?php if (!empty($message)): ?>
        <p style="color:red"><?= $message ?></p>
    <?php endif; ?>

    <form action="register.php" method="post">
        <div>
            <label for="email">Adresse e-mail:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="nom">Nom :</label>
            <input type="text" id="nom" name="nom">
        </div>
        <div>
            <label for="prenom">Prenom :</label>
            <input type="text" id="prenom" name="prenom">
        </div>

        <div>
            <label for="numeroTelephone">Telephone :</label>
            <input type="tel" id="numeroTelephone" name="numeroTelephone">
        </div>

        <div>
            <label for="motDePasse">Mot de passe:</label>
            <input type="password" id="motDePasse" name="motDePasse">
        </div>

        <div>
            <input type="submit" value="S'inscrire">
        </div>
    </form>
</div>

</body>
</html>
