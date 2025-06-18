<?php
session_start();
include 'includes/connect.php';

// samo admini
if (!isset($_SESSION['user']) || $_SESSION['user']['razina'] != 1) {
  header('Location: login.php');
  exit;
}

// ako je POST, procesiraj unos
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  // 1) upload slike
  $targetDir = 'img/';
  $filename  = basename($_FILES['slika']['name']);
  $target    = $targetDir . $filename;

  if (!move_uploaded_file($_FILES['slika']['tmp_name'], $target)) {
    die('Greška pri uploadu slike.');
  }

  // 2) pripremi i izvrši INSERT
  $sql = "INSERT INTO vijesti
            (datum, naslov, sazetak, tekst, slika, kategorija, arhiva)
          VALUES
            (CURDATE(), ?, ?, ?, ?, ?, ?)";
  $stmt = mysqli_prepare($dbc, $sql);

  $naslov     = $_POST['naslov'];
  $sazetak    = $_POST['sazetak'];
  $tekst      = $_POST['tekst'];
  $slika      = $filename;
  $kategorija = $_POST['kategorija'];
  $arhiva     = isset($_POST['arhiva']) ? 1 : 0;

  mysqli_stmt_bind_param(
    $stmt,
    'ssssi i',
    $naslov,
    $sazetak,
    $tekst,
    $slika,
    $kategorija,
    $arhiva
  );
  mysqli_stmt_execute($stmt)
    or die('Greška u upitu: '. mysqli_error($dbc));

  // 3) redirect nazad na administraciju
  header('Location: administracija.php');
  exit;
} else {
  // ako netko dođe direktno na skriptu
  header('Location: new_article.php');
  exit;
}
