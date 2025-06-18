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
          <?php if (isset($_SESSION['user']) && $_SESSION['user']['razina'] == 1): ?>
            <li><a href="administracija.php">Administracija</a></li>
          <?php endif; ?>
          <?php if (isset($_SESSION['user'])): ?>
            <li><a href="logout.php">Odjava (<?= htmlspecialchars($_SESSION['user']['korisnicko_ime']) ?>)</a></li>
          <?php else: ?>
            <li><a href="login.php">Prijava</a></li>
            <li><a href="registracija.php">Registracija</a></li>
          <?php endif; ?>
        </ul>
      </nav>
    </div>
  </header>
  <main>
