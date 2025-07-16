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
        if (!isset($_SESSION['id_user'])) {
            header("Location: ?controller=home&action=home");
            exit;
        }

        $model = Model::getModel();
        $favorites = $model->getFavoritesByUser($_SESSION['id_user']);
        $this->render("favorites", ["favorites" => $favorites]);
    }

    public function action_removeFavorite()
    {
        if (!isset($_SESSION['id_user']) || !isset($_GET['id_favory'])) {
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