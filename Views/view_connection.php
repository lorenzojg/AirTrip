<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion - AirTrip</title>
    <link rel="stylesheet" href="./Content/css/style_form.css">
    <link rel="stylesheet" href="./Content/css/style_header.css">
</head>
<body class="login-page">
    <?php include("./Utils/header.php"); ?>

    <div class="login-container">
        <div class="login-box">
            <h1>Espace Tripper :<br><span>Connection</span></h1>
            <p class="subtitle">Se connecter, planifier, voyager ...</p>
            <form method="POST" action="?controller=connection&action=checkLogin">
                <label for="email">Email *</label>
                <input type="email" id="email" name="email" placeholder="mariedupont@mydomain.org" required>

                <label for="pwd">Mot de passe *</label>
                <input type="password" id="pwd" name="password" placeholder="************" required>

                <a class="forgot" href="#">Mot de passe oublié ?</a>

                <div class="button-row">
                    <a href="?controller=signup&action=signup" class="btn light">Devenir un Tripper</a>
                    <button type="submit" class="btn dark">Se connecter</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
