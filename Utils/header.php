<?php

?>
<header class="header">
        <div class="logo">🌍 AirTrip</div>

        <nav class="nav">
            <a href="index.php">Accueil</a>
            <a href="search.php">SearchTrip</a>
            <a href="about.php">À propos d'AirTrip</a>
        </nav>

        <?php if (isset($_SESSION['mail'])): ?>
            <!-- Menu utilisateur connecté -->
            <div class="user-menu">
                <img src="./Content/img/img.png" alt="Profil" class="profile-pic" onclick="toggleDropdown()" />
                <div class="dropdown" id="dropdownMenu">
                    <p><strong><?php echo $_SESSION['firstname'] ?? 'Utilisateur'; ?></strong><br><small>Voir mon profil</small></p>
                    <hr>
                    <a href="?controller=home&action=home">Paramètres du compte</a>
                    <a href="?controller=home&action=home">Mes Trips</a>
                    <a href="?controller=favorites&action=listFavorites">Mes favoris</a>
                    <a href="?controller=home&action=deconnection">Déconnexion</a>
                </div>
            </div>
        <?php else: ?>
            <!-- Boutons Connexion / Inscription -->
            <div class="auth-buttons">
                <a href="?controller=connection&action=login" class="btn">Se connecter</a>
                <a href="?controller=signup&action=signup" class="btn btn-dark">S'inscrire</a>
            </div>
        <?php endif; ?>
    </header>