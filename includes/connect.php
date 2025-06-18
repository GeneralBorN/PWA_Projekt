<?php
// uključuje se na vrhu svakog skripta prije bilo kakvog outputa
header('Content-Type: text/html; charset=utf-8');

// prijava na MySQL
$dbc = mysqli_connect(
    'localhost',   // server
    'root',        // korisnik
    '',            // lozinka
    'projekt'   // ime baze
) or die('Ne mogu se spojiti na bazu: ' . mysqli_connect_error());

// postavi utf8 encoding
mysqli_set_charset($dbc, 'utf8');