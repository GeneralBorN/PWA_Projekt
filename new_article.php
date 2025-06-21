<?php
session_start();
include 'includes/connect.php';
include 'includes/header.php';

// zaštita: samo admin (razina=1) smije
if (!isset($_SESSION['user']) || $_SESSION['user']['razina'] != 1) {
  header('Location: administracija.php');
  exit;
}
?>

<div class="container">
  <div class="article-form">
    <h2>Unos novog članka</h2>
    <form action="skripta_unos.php" method="post" enctype="multipart/form-data">
    <label>Naslov:<br>
      <input type="text" name="naslov" required>
    </label><br><br>

    <label>Sažetak:<br>
      <textarea name="sazetak" rows="2" required></textarea>
    </label><br><br>

    <label>Tekst:<br>
      <textarea name="tekst" rows="6" required></textarea>
    </label><br><br>

    <label>Slika:<br>
      <input type="file" name="slika" accept="image/*" required>
    </label><br><br>

    <label>Kategorija:
      <select name="kategorija">
        <option value="Politik">Politik</option>
        <option value="Gesundheit">Gesundheit</option>
      </select>
    </label><br><br>

    <label>
      <input type="checkbox" name="arhiva" value="1">
      Arhiviraj odmah
    </label><br><br>

      <button type="submit">Spremi članak</button>
    </form>
  </div>
</div>

<?php include 'includes/footer.php'; ?>
