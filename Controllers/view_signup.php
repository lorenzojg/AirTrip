<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription - AirTrip</title>
    <link rel="stylesheet" href="./Content/css/style_form.css">
    <link rel="stylesheet" href="./Content/css/style_header.css">
</head>
<body class="login-page">
    <?php include("./Utils/header.php"); ?>

    <div class="login-container">
        <div class="login-box">
            <h1>Rejoins l'aventure :<br><span>Inscription</span></h1>
            <p class="subtitle">Crée ton compte Tripper et commence à explorer.</p>

            <?php if (isset($error)) : ?>
                <div class="error-message"><?= htmlspecialchars($error) ?></div>
            <?php endif; ?>

            <form method="POST" action="?controller=signup&action=checkSignup">
            <div class="form-group">
                <label for="firstname" class="form-label">Prénom *</label>
                <input type="text" id="firstname" name="firstname" placeholder="Saisir votre prénom" required>
            </div>

            <div class="form-group">
                <label for="lastname" class="form-label">Nom *</label>
                <input type="text" id="lastname" name="lastname" placeholder="Saisir votre nom" required>
            </div>
                
            <div class="form-group">
                <label for="email" class="form-label">Email *</label>
                <input type="email" id="email" name="email" placeholder="example : senegaleseboy@wolof.org" required>
            </div>
            <div class="form-group">
                <label for="password" class="form-label">Mot de passe *</label>
                <input type="password" id="password" name="password" placeholder="************" required>
            </div>
            <label for="role">Rôle *</label>
            <select id="role" name="id_role" required>
                <option value="" disabled selected>Choisis un rôle</option>
                <option value="1">Client</option>
                <option value="2">Admin</option>
                <option value="3">Agent</option>
                <option value="4">Guide</option>
                <option value="5">Gestionnaire</option>
            </select>

                <p></p>
                <p></p>
                <p></p>
                <div class="button-row">
                    <a href="?controller=connection&action=login" class="btn light">Déjà un compte ?</a>
                    <button type="submit" class="btn dark">S'inscrire</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
