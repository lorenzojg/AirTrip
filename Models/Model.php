<?php

class Model
{
    /**
     * Attribut contenant l'instance PDO
     */
    private $bd;

    /**
     * Attribut statique qui contiendra l'unique instance de Model
     */
    private static $instance = null;

    /**
     * Constructeur : effectue la connexion à la base de données.
     */
    private function __construct()
    {
        include "Content/credentials.php";
        $this->bd = new PDO($dsn, $login, $mdp);
        $this->bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->bd->query("SET nameS 'utf8'");
    }

    /**
     * Méthode permettant de récupérer un modèle car le constructeur est privé (Implémentation du Design Pattern Singleton)
     */
    public static function getModel()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }


    public function getNbUsers()
    {
        $requete = $this->bd->prepare("SELECT COUNT(*) FROM users");
        $requete->execute();
        $resultat = $requete->fetch();
        return (int) $resultat[0];
    }

    public function getUserByEmail($email)
{
    $query = $this->bd->prepare("SELECT * FROM users WHERE mail = :email");
    $query->execute(['email' => $email]);
    return $query->fetch(PDO::FETCH_ASSOC);
}
    
    //Ajout de la methode insertUser (insertion dans la bdd apres le signUp) **HABDALLAHI
    public function insertUser($firstname, $lastname, $email, $password, $id_role)
    {
        $requete = $this->bd->prepare("INSERT INTO users (firstname, lastname, mail, pwd, id_role) VALUES (:firstname, :lastname, :email, :password, :id_role)");
        return $requete->execute([
            'firstname' => $firstname,
            'lastname'  => $lastname,
            'email'     => $email,
            'password'  => $password,
            'id_role'   => $id_role
        ]);
       
    }
     public function getFavoritesByUser($userId)
{
    $favorites = [];

    // 1. Rooms
    $query = $this->bd->prepare("
        SELECT r.*, 'room' AS type FROM favory f
        JOIN room r ON f.id_room = r.id_room
        WHERE f.id_user = :id_user AND f.id_room IS NOT NULL
    ");
    $query->execute(['id_user' => $userId]);
    $favorites = array_merge($favorites, $query->fetchAll(PDO::FETCH_ASSOC));

    // 2. Rentals
    $query = $this->bd->prepare("
        SELECT rent.*, 'rental' AS type FROM favory f
        JOIN rental rent ON f.id_rental = rent.id_rental
        WHERE f.id_user = :id_user AND f.id_rental IS NOT NULL
    ");
    $query->execute(['id_user' => $userId]);
    $favorites = array_merge($favorites, $query->fetchAll(PDO::FETCH_ASSOC));

    // 3. Activities
    $query = $this->bd->prepare("
        SELECT a.*, 'activity' AS type FROM favory f
        JOIN activities a ON f.id_activities = a.id_activities
        WHERE f.id_user = :id_user AND f.id_activities IS NOT NULL
    ");
    $query->execute(['id_user' => $userId]);
    $favorites = array_merge($favorites, $query->fetchAll(PDO::FETCH_ASSOC));

    // 4. Flights
    $query = $this->bd->prepare("
        SELECT fl.*, 'flight' AS type FROM favory f
        JOIN flights fl ON f.id_flights = fl.id_flights
            AND f.id_airport = fl.id_airport
            AND f.id_airport_1 = fl.id_airport_1
        WHERE f.id_user = :id_user AND f.id_flights IS NOT NULL
    ");
    $query->execute(['id_user' => $userId]);
    $favorites = array_merge($favorites, $query->fetchAll(PDO::FETCH_ASSOC));

    return $favorites;
    }


    public function removeFavoriteById($idFavory)
    {
        $query = $this->bd->prepare("DELETE FROM favory WHERE id_favory = :id_favory");
        return $query->execute(['id_favory' => $idFavory]);
    }

}