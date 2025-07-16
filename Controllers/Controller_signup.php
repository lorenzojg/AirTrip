<?php
require_once 'Models/Model.php'; // Inclusion du modèle

class Controller_signup extends Controller
{
    public function action_default()
    {
        $this->action_signup();
    }

    public function action_signup()
    {
        $this->render("signup", ["title" => "Inscription"]);
    }

    public function action_checkSignup()
    {
        if ( //VERIFICATION ;)
            !isset($_POST['email']) || !isset($_POST['password']) ||
            !isset($_POST['firstname']) || !isset($_POST['lastname']) || 
            !isset($_POST['id_role']) 
        ) {
            $this->action_error("Champs manquants.");
            return;
        }
        //RECUPERATION ;)
        $email = trim($_POST['email']);
        $password = $_POST['password'];
        $firstname = trim($_POST['firstname']);
        $lastname = trim($_POST['lastname']);
        $id_role = $_POST['id_role'];  

        $model = Model::getModel();

        // VEREIFCATION SI LE MAIL EXISTE DEJA ;)
        if ($model->getUserByEmail($email)) {
            $this->render("signup", [
                "title" => "Inscription",
                "error" => "Un compte avec cet email existe déjà."
            ]);
            return;
        }

        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
        
        
        $success = $model->insertUser($firstname, $lastname, $email, $hashedPassword, $id_role); 

        if ($success) {
            header("Location: ?controller=connection&action=login");
            exit;
        } else {
            $this->render("signup", [
                "title" => "Inscription",
                "error" => "Une erreur s'est produite lors de l'inscription."
            ]);
        }
    }
}