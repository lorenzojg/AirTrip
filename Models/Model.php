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

    
    public function removeNobelPrize($id_np)
    {
        $requete = $this->bd->prepare("DELETE FROM nobels WHERE id = :id");
        $requete->bindValue(':id', (int) $id_np, PDO::PARAM_INT);
        $requete->execute();
        return (bool) $requete->rowCount();
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
}
