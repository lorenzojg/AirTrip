<?php

class Controller_home extends Controller {

    public function action_home() {
        // On affiche la vue d'accueil
        $model = Model::getModel() ;
        $data = [ "nb" => $model->getNbUsers()];
        $this->render("home", $data);
    }

    public function action_deconnection(){
        // On détruit la session
        session_start();
        session_destroy();
        // On redirige vers la page d'accueil
        $this->render("home", ["title" => "Déconnexion"]);
    }

    public function action_default() {
        // On affiche la vue d'accueil par défaut
        $this->action_home();
    }






}