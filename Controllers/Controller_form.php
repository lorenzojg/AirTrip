<?php

class Controller_form extends Controller {

    public function action_form() {
        // On affiche la vue d'accueil
        $model = Model::getModel() ;
        $data = [ "nb" => $model->getNbUsers()];
        $this->render("form", $data);
    }

    public function action_default() {
        // On affiche la vue d'accueil par défaut
        $this->action_form();
    }






}