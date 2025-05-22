<?php
require_once 'Models/Model.php';

class Controller_favorites extends Controller
{
    public function action_default()
    {
        $this->action_listFavorites();
    }
    
    public function action_listFavorites()
    {
        session_start();
        if (!isset($_SESSION['user'])) {
            header("Location: ?controller=home&action=home");
            exit;
        }

        $model = Model::getModel();
        $favorites = $model->getFavoritesByUser($_SESSION['user']['id_user']);
        $this->render("favorites", ["favorites" => $favorites]);


        $this->render("favorites", ["favorites" => $favorites]);
    }

    public function action_removeFavorite()
    {
        session_start();
        if (!isset($_SESSION['user']) || !isset($_GET['id_favory'])) {
            header("Location: ?controller=home&action=home");
            exit;
        }
    
        $idFavory = $_GET['id_favory'];
        $model = Model::getModel();
        $model->removeFavoriteById($idFavory);
    
        header("Location: ?controller=favorites&action=listFavorites");
        exit;
    }
    
}
