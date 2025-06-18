<?php
session_start();
include 'includes/connect.php';

if (isset($_SESSION['user'])) {
    header('Location: index.php');
    exit;
}

$poruka = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $ime = $_POST['ime'];
    $prezime = $_POST['prezime'];
    $korime = $_POST['korisnicko_ime'];
    $lozinka = password_hash($_POST['lozinka'], PASSWORD_DEFAULT);

    $sql = "INSERT INTO korisnik (ime, prezime, korisnicko_ime, lozinka, razina)
            VALUES (?, ?, ?, ?, 0)";
    $stmt = mysqli_prepare($dbc, $sql);
    mysqli_stmt_bind_param($stmt, 'ssss', $ime, $prezime, $korime, $lozinka);
    if (mysqli_stmt_execute($stmt)) {
        $poruka = 'Registracija uspješna. Možete se prijaviti.';
    } else {
        $poruka = 'Greška pri registraciji.';
    }
}

include 'includes/header.php';
?>
<div class="container">
  <h2>Registracija</h2>
  <?php if ($poruka) echo '<p>'.$poruka.'</p>'; ?>
  <form method="post">
    <label>Ime:<br>
      <input type="text" name="ime" required>
    </label><br><br>
    <label>Prezime:<br>
      <input type="text" name="prezime" required>
    </label><br><br>
    <label>Korisničko ime:<br>
      <input type="text" name="korisnicko_ime" required>
    </label><br><br>
    <label>Lozinka:<br>
      <input type="password" name="lozinka" required>
    </label><br><br>
    <button type="submit">Registriraj se</button>
  </form>
</div>
<?php include 'includes/footer.php'; ?>
