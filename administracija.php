<?php
session_start();
include 'includes/connect.php';

$login_msg = '';
$reg_msg   = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['action']) && $_POST['action'] === 'login') {
        $korime = $_POST['korisnicko_ime'];
        $lozinka = $_POST['lozinka'];

        $sql = "SELECT * FROM korisnik WHERE korisnicko_ime=?";
        $stmt = mysqli_prepare($dbc, $sql);
        mysqli_stmt_bind_param($stmt, 's', $korime);
        mysqli_stmt_execute($stmt);
        $res  = mysqli_stmt_get_result($stmt);
        $user = mysqli_fetch_assoc($res);

        if ($user && password_verify($lozinka, $user['lozinka'])) {
            $_SESSION['user'] = $user;
            header('Location: administracija.php');
            exit;
        } else {
            $login_msg = 'Pogrešno korisničko ime ili lozinka.';
        }
    } elseif (isset($_POST['action']) && $_POST['action'] === 'register') {
        $ime    = $_POST['ime'];
        $prezime = $_POST['prezime'];
        $korime  = $_POST['korisnicko_ime'];
        $lozinka = password_hash($_POST['lozinka'], PASSWORD_DEFAULT);

        $sql = "INSERT INTO korisnik (ime, prezime, korisnicko_ime, lozinka, razina) VALUES (?, ?, ?, ?, 0)";
        $stmt = mysqli_prepare($dbc, $sql);
        mysqli_stmt_bind_param($stmt, 'ssss', $ime, $prezime, $korime, $lozinka);
        if (mysqli_stmt_execute($stmt)) {
            $reg_msg = 'Registracija uspješna. Možete se prijaviti.';
        } else {
            $reg_msg = 'Greška pri registraciji.';
        }
    }
}

include 'includes/header.php';
?>

<div class="container">
<?php if (!isset($_SESSION['user'])): ?>
  <?php $view = $_GET['view'] ?? null; ?>
  <?php if (!$view): ?>
    <div class="auth-options">
      <a href="administracija.php?view=login" class="btn">Prijava</a>
      <a href="administracija.php?view=register" class="btn">Registracija</a>
    </div>
  <?php elseif ($view === 'login'): ?>
    <div class="auth-form">
      <h2>Prijava</h2>
      <?php if ($login_msg) echo '<p class="message">'.$login_msg.'</p>'; ?>
      <form method="post">
        <input type="hidden" name="action" value="login">
        <label>Korisničko ime:
          <input type="text" name="korisnicko_ime" required>
        </label>
        <label>Lozinka:
          <input type="password" name="lozinka" required>
        </label>
        <button type="submit">Prijavi se</button>
      </form>
      <p class="text-center"><a href="administracija.php?view=register">Registriraj se</a></p>
    </div>
  <?php elseif ($view === 'register'): ?>
    <div class="auth-form">
      <h2>Registracija</h2>
      <?php if ($reg_msg) echo '<p class="message">'.$reg_msg.'</p>'; ?>
      <form method="post">
        <input type="hidden" name="action" value="register">
        <label>Ime:
          <input type="text" name="ime" required>
        </label>
        <label>Prezime:
          <input type="text" name="prezime" required>
        </label>
        <label>Korisničko ime:
          <input type="text" name="korisnicko_ime" required>
        </label>
        <label>Lozinka:
          <input type="password" name="lozinka" required>
        </label>
        <button type="submit">Registriraj se</button>
      </form>
      <p class="text-center"><a href="administracija.php?view=login">Imate račun? Prijavite se</a></p>
    </div>
  <?php endif; ?>
<?php elseif ($_SESSION['user']['razina'] == 1): ?>
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
<?php else: ?>
  <p>Nemate prava za pristup administraciji.</p>
<?php endif; ?>
</div>

<?php include 'includes/footer.php'; ?>

