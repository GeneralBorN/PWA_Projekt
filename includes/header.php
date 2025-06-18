<?php
// pokreni session ako već nije
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>
<!DOCTYPE html>
<html lang="hr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Stern – vijesti</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <header>
    <div class="container">

      <a class="logo" href="index.php"><img src="pictures/logo.png" style="width:30%;height:auto"></a>
      <nav>
        <ul>
          <li><a href="index.php">Home</a></li>
          <li><a href="kategorija.php?kat=Politik">Politik</a></li>
          <li><a href="kategorija.php?kat=Gesundheit">Gesundheit</a></li>
          <li><a href="administracija.php">Administracija</a></li>
        </ul>
      </nav>
    </div>
  </header>
  <main>
