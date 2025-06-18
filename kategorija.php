<?php
session_start();
include 'includes/connect.php';
include 'includes/header.php';

$kategorija = $_GET['kat'] ?? '';
?>
<div class="container">
  <h2><?= htmlspecialchars($kategorija) ?></h2>
  <div class="grid">
  <?php
    $sql = "SELECT id, naslov, slika FROM vijesti WHERE kategorija=? AND arhiva=0 ORDER BY datum DESC";
    $stmt = mysqli_prepare($dbc, $sql);
    mysqli_stmt_bind_param($stmt, 's', $kategorija);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    while($row = mysqli_fetch_assoc($res)):
  ?>
    <article class="card">
      <a href="clanak.php?id=<?= $row['id'] ?>">
        <img src="pictures/<?= htmlspecialchars($row['slika']) ?>" alt="<?= htmlspecialchars($row['naslov']) ?>">
        <h3><?= htmlspecialchars($row['naslov']) ?></h3>
      </a>
    </article>
  <?php endwhile; ?>
  </div>
</div>
<?php include 'includes/footer.php'; ?>
