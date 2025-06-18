<?php
session_start();
include 'includes/connect.php';
include 'includes/header.php';
?>
<div class="container">
  <!-- POLITIK -->
  <section class="section politik">
    <h2>Politik</h2>
    <div class="grid">
    <?php
      // pripremi query za 3 najnovija aktivna članka iz kategorije Politik
      $sql = "SELECT id, naslov, slika FROM vijesti
              WHERE arhiva=0 AND kategorija=? 
              ORDER BY datum DESC LIMIT 3";
      $stmt = mysqli_prepare($dbc, $sql);
      $kat = 'Politik';
      mysqli_stmt_bind_param($stmt, 's', $kat);
      mysqli_stmt_execute($stmt);
      $res = mysqli_stmt_get_result($stmt);
      while($row = mysqli_fetch_assoc($res)):
    ?>
      <article class="card">
        <a href="clanak.php?id=<?= $row['id'] ?>">
          <img src="pictures/<?= htmlspecialchars($row['slika']) ?>"
               alt="<?= htmlspecialchars($row['naslov']) ?>">
          <h3><?= htmlspecialchars($row['naslov']) ?></h3>
        </a>
      </article>
    <?php endwhile; ?>
    </div>
  </section>

  <!-- GESUNDHEIT -->
  <section class="section gesundheit">
    <h2>Gesundheit</h2>
    <div class="grid">
    <?php
      // reuse prepared statement za kategoriju Gesundheit
      mysqli_stmt_reset($stmt);
      $kat = 'Gesundheit';
      mysqli_stmt_bind_param($stmt, 's', $kat);
      mysqli_stmt_execute($stmt);
      $res = mysqli_stmt_get_result($stmt);
      while($row = mysqli_fetch_assoc($res)):
    ?>
      <article class="card">
        <a href="clanak.php?id=<?= $row['id'] ?>">
          <img src="pictures/<?= htmlspecialchars($row['slika']) ?>"
               alt="<?= htmlspecialchars($row['naslov']) ?>">
          <h3><?= htmlspecialchars($row['naslov']) ?></h3>
        </a>
      </article>
    <?php endwhile;
      mysqli_stmt_close($stmt);
    ?>
    </div>
  </section>
</div>
<?php include 'includes/footer.php'; ?>
