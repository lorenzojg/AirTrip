<h1>Mes Favoris</h1>

<?php if (empty($favorites)): ?>
    <p>Aucun favori trouvé.</p>
<?php else: ?>
    <ul>
        <?php foreach ($favorites as $fav): ?>
            <li>
                <strong>Type :</strong> <?= htmlspecialchars($fav['type']) ?><br>

                <?php if ($fav['type'] == 'room'): ?>
                    Chambre : <?= htmlspecialchars($fav['room_name']) ?>
                <?php elseif ($fav['type'] == 'rental'): ?>
                    Location : <?= htmlspecialchars($fav['rental_name']) ?>
                <?php elseif ($fav['type'] == 'activity'): ?>
                    Activité : <?= htmlspecialchars($fav['activity_name']) ?>
                <?php elseif ($fav['type'] == 'flight'): ?>
                    Vol de <?= htmlspecialchars($fav['id_airport']) ?> à <?= htmlspecialchars($fav['id_airport_1']) ?>
                <?php endif; ?>

                <!-- lien pour retirer des favoris -->
                <a href="?controller=favorites&action=removeFavorite&id_favory=<?= $fav['id_favory'] ?>">❌ Retirer des favoris</a>
            </li>
        <?php endforeach; ?>
    </ul>
<?php endif; ?>
