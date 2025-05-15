<?php
require_once 'Models/Model.php'; // Assure-toi que le modèle est bien inclus

class Controller_connection extends Controller
{
    public function action_default()
    {
        $this->action_login();
    }

    public function action_login()
    {
        $this->render("connection", ["title" => "Connexion"]);
    }

    public function action_checkLogin()
    {
        if (!isset($_POST['email']) || !isset($_POST['password'])) {
            $this->action_error("Champs manquants.");
        }

        $email = $_POST['email'];
        $password = $_POST['password'];

        $model = Model::getModel();

        $user = $model->getUserByEmail($email);

        if ($user && password_verify($password, $user['pwd'])) {
            session_start();
            $_SESSION['mail'] = $user['mail'];
            $_SESSION['firstname'] = $user['firstname'];
            $_SESSION['lastname'] = $user['lastname'];
            $_SESSION['id_user'] = $user['id_user'];

            header("Location: ?controller=home");
            exit;
        } else {
            $this->render("connection", [
                "title" => "Connexion",
                "error" => "Email ou mot de passe incorrect."
            ]);
        }
    }
}
