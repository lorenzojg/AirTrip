<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="./Content/css/globals.css" />
    <link rel="stylesheet" href="./Content/css/styleguide.css" />
    <link rel="stylesheet" href="./Content/css/style_header.css">
    <script src="./Content/Javascript/script_menu_user.js"></script>
    <link rel="stylesheet" href="./Content/css/style.css" />
    <title>SearchTrip - AirTrip</title>
  </head>
  <body>
    <?php include("./Utils/header.php"); ?>
    <div class="page-searchtrip" data-model-id="14:1482">

      <main class="component">
        <h1 class="logo">
          <span class="span">SearchTrip</span><br />
          <span class="text-wrapper-2">Low fare, go far !</span>
        </h1>
        <form>
          <div class="text-input">
            <label for="departure-date" class="p">
              <span class="text-wrapper-3">Date de départ </span>
              <span class="text-wrapper-4">*</span>
            </label>
            <input type="date" id="departure-date" class="text-block" required>
          </div>
          <div class="text-input">
            <label for="return-date" class="p">
              <span class="text-wrapper-3">Date de retour </span>
              <span class="text-wrapper-4">*</span>
            </label>
            <input type="date" id="return-date" class="text-block" required>
          </div>
          <div class="slider-field">
            <label for="budget-slider" class="label">
              <span class="label-2">Budget</span>
              <output class="slider-output">
                <span class="text-wrapper-5">€</span>
                <span class="text-wrapper-5">0-10 000</span>
              </output>
            </label>
            <input type="range" id="budget-slider" min="0" max="10000" step="100" class="slider">
            <span class="description-2">Budget pour ce Trip</span>
          </div>
          <div class="text-input">
            <label for="destination" class="div-3">
              <span class="text-wrapper-3">Destination </span>
              <span class="text-wrapper-4">*</span>
            </label>
            <div class="search">
              <input type="text" id="destination" class="value" placeholder="Destination" required>
              <button type="button" class="space">
                <img src="https://c.animaapp.com/15gSzOpC/img/x.svg" alt="Clear" />
              </button>
            </div>
          </div>
          <img class="image" src="https://c.animaapp.com/15gSzOpC/img/image@2x.png" alt="Destination image" />
          <fieldset class="component-2">
            <legend class="div-4">
              <span class="text-wrapper-3">Préférence </span>
              <span class="text-wrapper-4">*</span>
            </legend>
            <div class="radio-field">
              <label class="div-5">
                <input type="radio" name="preference" value="equilibre" checked>
                <span class="label-2">Équilibré</span>
              </label>
              <span class="description-3">Budget équilibré</span>
            </div>
            <div class="radio-field-2">
              <label class="div-5">
                <input type="radio" name="preference" value="hotel">
                <span class="label-2">Hôtel</span>
              </label>
              <span class="description-3">Budget favorisant l'hôtel</span>
            </div>
            <div class="radio-field-3">
              <label class="div-5">
                <input type="radio" name="preference" value="vol">
                <span class="label-2">Vol</span>
              </label>
              <span class="description-3">Budget favorisant les vols</span>
            </div>
            <div class="radio-field-4">
              <label class="div-5">
                <input type="radio" name="preference" value="activites">
                <span class="label-2">Activités</span>
              </label>
              <span class="description-3">Budget favorisant les activités</span>
            </div>
          </fieldset>
          <div class="button-group">
            <button type="reset" class="button button-2">Réinitialiser</button>
            <button type="submit" class="button-3 button-4">AirTrip !</button>
          </div>
        </form>
      </main>
      <footer class="text-wrapper-6">© AirTrip 2025</footer>
    </div>
  </body>
</html>
