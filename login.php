<?php
session_start();
include 'includes/connect.php';

// ako je korisnik već prijavljen, preusmjeri na početnu
if (isset($_SESSION['user'])) {
    header('Location: index.php');
    exit;
}

$poruka = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $korime = $_POST['korisnicko_ime'];
    $lozinka = $_POST['lozinka'];

    $sql = "SELECT * FROM korisnik WHERE korisnicko_ime=?";
    $stmt = mysqli_prepare($dbc, $sql);
    mysqli_stmt_bind_param($stmt, 's', $korime);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    $user = mysqli_fetch_assoc($res);

    if ($user && password_verify($lozinka, $user['lozinka'])) {
        $_SESSION['user'] = $user;
        header('Location: index.php');
        exit;
    } else {
        $poruka = 'Pogrešno korisničko ime ili lozinka.';
    }
}

include 'includes/header.php';
?>
<div class="container">
  <h2>Prijava</h2>
  <?php if ($poruka) echo '<p>'.$poruka.'</p>'; ?>
  <form method="post">
    <label>Korisničko ime:<br>
      <input type="text" name="korisnicko_ime" required>
    </label><br><br>
    <label>Lozinka:<br>
      <input type="password" name="lozinka" required>
    </label><br><br>
    <button type="submit">Prijavi se</button>
  </form>
</div>
<?php include 'includes/footer.php'; ?>
