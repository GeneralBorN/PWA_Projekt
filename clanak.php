<?php
session_start();
include 'includes/connect.php';
include 'includes/header.php';

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$sql = "SELECT naslov, tekst, slika, kategorija, datum FROM vijesti WHERE id=?";
$stmt = mysqli_prepare($dbc, $sql);
mysqli_stmt_bind_param($stmt, 'i', $id);
mysqli_stmt_execute($stmt);
$res = mysqli_stmt_get_result($stmt);
$clanak = mysqli_fetch_assoc($res);
?>
<div class="container">
<?php if ($clanak): ?>
  <h1><?= htmlspecialchars($clanak['naslov']) ?></h1>
  <p><em><?= htmlspecialchars($clanak['kategorija']) ?> | <?= $clanak['datum'] ?></em></p>
  <img src="pictures/<?= htmlspecialchars($clanak['slika']) ?>" alt="<?= htmlspecialchars($clanak['naslov']) ?>" class="article-image">
  <p><?= nl2br(htmlspecialchars($clanak['tekst'])) ?></p>
<?php else: ?>
  <p>Članak nije pronađen.</p>
<?php endif; ?>
</div>
<?php include 'includes/footer.php'; ?>
