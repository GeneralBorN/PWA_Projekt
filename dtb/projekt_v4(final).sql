-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2025 at 04:47 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projekt`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `ime` varchar(50) DEFAULT NULL,
  `prezime` varchar(50) DEFAULT NULL,
  `korisnicko_ime` varchar(50) DEFAULT NULL,
  `lozinka` varchar(255) DEFAULT NULL,
  `razina` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`, `razina`) VALUES
(1, 'Admin', 'Admin', 'Admin', '$2y$10$8jnzl7hYBpt9OBShQeo1cu4OX9Plf1jCBweD9Qh0mWIHt6mzmqxKa', 1),
(2, 'Borna', 'Horina', 'BorN', '$2y$10$UgRISxNfuwSK.iZG511OeeEr.zFoPL2qXqDxhUVL/mYzBFctUa6H2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int(11) NOT NULL,
  `datum` date DEFAULT NULL,
  `naslov` varchar(255) DEFAULT NULL,
  `sazetak` varchar(255) DEFAULT NULL,
  `tekst` longtext DEFAULT NULL,
  `slika` varchar(100) DEFAULT NULL,
  `kategorija` varchar(50) DEFAULT NULL,
  `arhiva` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `datum`, `naslov`, `sazetak`, `tekst`, `slika`, `kategorija`, `arhiva`) VALUES
(1, '2025-06-18', 'Testni naslov članka', 'Ovo je kratki sažetak testnog članka.', 'Ovo je **puni tekst** mog testnog članka. Može sadržavati više odlomaka.', 'test.jpg', 'Politik', 0),
(2, '2025-06-19', 'Testni naslov članka volume 2', 'Ovo je kratki sažetak testnog članka.', 'Ovo je **puni tekst** mog testnog članka. Može sadržavati više odlomaka.', 'test2.png', 'Politik', 0),
(3, '2025-06-19', 'Testni naslov članka', 'Ovo je kratki sažetak testnog članka.', 'Ovo je **puni tekst** mog testnog članka. Može sadržavati više odlomaka.', 'logo.png', 'Gesundheit', 0),
(4, '2025-06-21', 'Kako pravilno dezinficirati ruke', 'Jednostavne upute za pravilno pranje i dezinficiranje ruku kod kuće i na poslu.', '\r\nPravilno pranje i dezinficiranje ruku temeljna su mjera prevencije u borbi protiv širenja svih zaraznih bolesti. Prema WHO i CDC smjernicama, postupak se sastoji od nekoliko jasnih koraka:\r\n\r\n1. NAVLAŽI RUKE: Upotrijebi čistu, tekuću vodu (toplu ili hladnu).  \r\n2. NATAPKAJ SAPUN: Nanesite dovoljnu količinu sapuna da pokrije sve površine ruku.  \r\n3. TRLJAJ SAPUN: Trljaj površine pjena najmanje 20–30 sekundi. Obrati pažnju na:  \r\n   - Dlanove i leđa ruku  \r\n   - Prostori između prstiju  \r\n   - Rubovi noktiju i zapešća  \r\n   - Područje oko palčeva  \r\n\r\n4. ISPERI RUKU: Temeljito ispiri mlazom vode sve ostatke sapuna.  \r\n5. OSUŠI RUKU: Koristi jednokratne papirnate ubruse ili čistu krpu.  \r\n\r\nAko sapun i voda nisu dostupni, koristi alkoholno sredstvo s najmanje 60 % alkohola. Princip primjene je:  \r\n- Nanesite 2–3 ml sredstva na dlanove  \r\n- Trljajte ruke dok se potpuno ne osuše (20–30 sekundi)  \r\n- Posebnu pozornost posvetite rubovima noktiju, bočnim stranama i prostoru između malog prsta i prstenjaka  \r\n\r\nRedovita primjena prije jela, nakon korištenja javnog prijevoza, dodirivanja kvaka i tipkovnica smanjuje prijenos patogena i rizik od oboljenja.  \r\n', 'dezinficija.jpg', 'Gesundheit', 0),
(5, '2025-06-21', 'Tjelovježba i mentalno zdravlje: Što kaže istraživanje?', 'Redovita umjerena tjelovježba poboljšava raspoloženje i smanjuje simptome depresije.', '\r\nNovo istraživanje Sveučilišta Oxford fokusiralo se na povezanost umjerene tjelovježbe s mentalnim zdravljem. U studiju je bilo uključeno 5 000 ispitanika, stari između 18 i 65 godina, koje su podijelili u skupine prema učestalosti i intenzitetu tjelesne aktivnosti.\r\n\r\nSudionici koji su se bavili aerobnim vježbama (trčanje, brzo hodanje, biciklizam) tri puta tjedno po 30–45 minuta prikazali su 25 % manju stopu simptoma anksioznosti i depresije u usporedbi s kontrolnom skupinom. Oni koji su uz aerobne vježbe ubacili i dvije serije vježbi snage (sklekovi, čučnjevi) dvaput tjedno, imali su dodatnih 15 % poboljšanja u samoprocjeni raspoloženja.\r\n\r\nMehanizmi su povezani s povećanom razinom endorfina, serotonina i faktora neurotrofičkog porijekla (BDNF) koji potiče rast živčanih stanica u mozgu. „Vježbanje ne samo da jača mišiće, nego i mozak“, komentira prof. Sarah Johnson. Studija također navodi da kombinacija vježbi snage i aerobika pruža najbolje rezultate za stabilizaciju raspoloženja.\r\n\r\nPraktični savjeti:\r\n- 30–45 minuta umjerene aktivnosti najmanje tri puta tjedno  \r\n- Dvije sesije snage tjedno s fokusom na velike mišićne skupine  \r\n- Jedna sesija istezanja i disanja nakon svake vježbe  \r\nRedovita tjelovježba dugoročno smanjuje stres, poboljšava san i jača otpornost na svakodnevne izazove.\r\n', 'tjelovjezba.jpg', 'Gesundheit', 0),
(6, '2025-06-21', 'Prednosti mediteranske prehrane za srce', 'ova istraživanja potvrđuju da mediteranska dijeta značajno smanjuje rizik od kardiovaskularnih bolesti.', '\r\nMediteranska prehrana već desetljećima slovi kao zlatni standard u prevenciji kardiovaskularnih bolesti. Najnoviji podaci iz PREDIMED studije, koju je provelo Sveučilište u Barceloni, obuhvatili su 10 000 sudionika u dobi od 55 do 80 godina i pratili njihove prehrambene navike tijekom 15 godina.\r\n\r\nStudija je uspoređivala tri prehrambena obrasca: mediteransku dijetu s dodatkom ekstra djevičanskog maslinovog ulja, mediteransku dijetu s orašastim plodovima te kontrolnu grupu na niskomasnoj prehrani. Rezultati su pokazali 30 % smanjenje rizika od srčanog udara i moždanog udara kod obje grupe na mediteranskoj dijeti u odnosu na kontrolnu skupinu.\r\n\r\nKljučne komponente koje se povezuju s tim rezultatima su visoka razina mononezasićenih masnih kiselina u maslinovom ulju, omega-3 masne kiseline iz ribe te antioksidansi i vlakna iz svježeg povrća i voća. “Redovita konzumacija maslinovog ulja i orašastih plodova čini razliku u strukturi stijenki krvnih žila te smanjuje upalne procese”, objašnjava dr. María Santos, voditeljica studije.\r\n\r\nPreporučeni dnevni plan obroka uključuje:\r\n1. Doručak: grčki jogurt s medom i orasima  \r\n2. Ručak: salata od svježe rajčice, krastavaca i maslina s maslinovim uljem  \r\n3. Večera: pečeni losos s povrćem na žaru  \r\n4. Međuobrok: šaka badema ili oraha  \r\n\r\nUz prehranu, istraživanje ističe važnost redovite tjelesne aktivnosti, umjerenog unosa crnog vina i socijalnih obroka kao dodatnih faktora dugovječnosti.\r\n', 'medprehrana.jpg', 'Gesundheit', 1),
(7, '2025-06-21', 'Debata u Bundestagu: Financijska potpora obitelji', 'Parlament raspravlja o novom zakonu koji bi povećao dječji doplatak za 20 % od sljedeće godine.', '\nU jučerašnjoj plenarnoj sjednici Bundestaga raspravljalo se o zakonu koji predviđa povećanje dječjeg doplatka (Kinderzuschlag) za 20 % od sljedeće godine. Ministar obitelji iznio je statistike o padu nataliteta i upozorio na opasnost starenja društva bez adekvatnih poticaja za mlade roditelje.\n\nOporbeni zastupnici su kritizirali plan financiranja – jedni predlažu uvođenje većih poreza na velike korporacije, dok drugi žele pronaći uštede u prekomjernim socijalnim davanjima. Ministar financija Christian Lindner odbacio je opciju dodatnog zadiranja u državni proračun i poručio da će se sredstva naći unutar postojećih okvira.\n\nZa kraj debate, predsjednica Odbora za obitelj preporučila je utvrđivanje posebnog fonda za roditeljske naknade, kako bi se dugoročno osigurala stabilnost. Glasovanje je zakazano za idući tjedan, a očekuje se da će zakon proći uz minimalne ustupke.\n', 'debata.jpeg', 'Politik', 0),
(8, '2025-06-21', 'Njemački izbori 2025: Tko vodi u anketama?', 'Istraživanja javnog mnijenja pokazuju tijesan dvoboj između demokršćana i zelenih pred rujanske izbore.', '\r\nNjemački politički spektar kreće se u burnoj predizbornoj atmosferi, a najnovije ankete instituta Infratest Dimap pokazuju vrlo tijesan dvoboj između CDU/CSU i Zelenih. Prema rezultatima objavljenima prošlog tjedna, CDU/CSU vodi s 28 % potpore, dok Zeleni bilježe 26 %. Socijaldemokrati (SPD) su na trećem mjestu s približno 15 %, a Slobodna demokratska stranka (FDP) drži oko 10 %.\r\n\r\nFriedrich Merz, kandidat Unije, nastoji impresionirati birače porukama o gospodarskoj stabilnosti i sigurnom okruženju, te obećava rasterećenje poreza za srednji sloj. S druge strane, Annelena Baerbock iz Zelenih nastoji svoje birače privući ambicioznim planovima za zelene investicije, uvođenje novih poticaja za obnovljive izvore energije i pooštravanje zaštite okoliša. „Naša Zemlja ne može čekati“, ponavlja Baerbock, ističući nužnost hitnih klimatskih mjera.\r\n\r\nPolitički analitičari upozoravaju da trenutačno nijedna stranka ne može formirati vlast bez koalicijskih partnera, što znači da će pregovori biti ključni dan nakon izbornog dana. Fokus će biti na potencijalnom „semafor koaliciji“ (SPD–FDP–Zeleni) ili nastavku tradicionalne velike koalicije CDU/CSU–SPD. Uz to, očekuje se da će porast cijena energenata i pitanja migrantske politike dodatno “zagrijati” predizbornu debatu.\r\n\r\nIzlaznost birača, koja je prošlih godina bilježila pad ispod 70 %, još je jedan od triju faktora koji će utjecati na konačni ishod. Kampanje pozivaju na mobilizaciju starije populacije, dok se mlađi birači sve više okreću digitalnim inicijativama i online glasovanju. Krajnji rezultati mogli bi presuditi smjer daljnjih europskih politika – od integracije tržišta do zajedničke obrane.\r\n', 'njemizbori.jpg', 'Politik', 0),
(9, '2025-06-21', 'EU i Zapadni Balkan: Novi ciklus pregovora', 'Lideri EU danas su održali summit s predstavnicima Zapadnog Balkana, fokus je na daljnjoj integraciji i reformama.', '\r\nU Bruxellesu je jučer održan summit EU i zemalja Zapadnog Balkana na kojem su sudionici detaljno razmotrili napredak u ključnim reformama nužnim za otvaranje novih pregovaračkih poglavlja. Sastanku su prisustvovali premijeri i predsjednici vlada šest zemalja regije, predsjednik Europske komisije te visoki povjerenici za proširenje.\r\n\r\nU prvoj sesiji fokus je bio na vladavini prava: Europska komisija je predstavila izvještaj u kojemu upozorava na potrebu jačanja neovisnosti pravosuđa i borbe protiv korupcije. Rezultati upućuju na to da su neke zemlje regije ostvarile napredak u reformi sudskog sustava, no da još uvijek nedostaje sustavna primjena europskih standarda u svim županijama i općinama. „Ovo je faza u kojoj moramo dosljedno provoditi principe koji stoje u temelju EU, kako bismo izgradili povjerenje naših građana“, istaknula je predsjednica Europskog parlamenta.\r\n\r\nDrugi dio summita bio je posvećen gospodarskoj suradnji: predstavljen je paket od 2 milijarde eura namijenjen modernizaciji infrastrukture, digitalizaciji državne uprave i poticanju malih i srednjih poduzeća. Delegacije su potpisale memorandum o razumijevanju za uspostavu zajedničkog tržišta za poljoprivredne proizvode, a dogovoreno je i osnivanje centara izvrsnosti za istraživanje zelene energije u Skopju i Sarajevu.\r\n\r\nU završnoj sesiji raspravljalo se o sigurnosnoj suradnji i upravljanju migracijskim tokovima. Dogovoreno je uspostaviti zajedničku radnu skupinu za nadzor vanjskih granica i razmjenu žurnih obavještajnih podataka. Također, predstavnici šengenskih zemalja složili su se da će privremeno najaviti liberalizaciju viza u istočnom smjeru, uz intenzivnije provjere sigurnosnih standarda i praćenje kretanja putnika.  \r\n', 'balkconf.jpeg', 'Politik', 0),
(10, '2025-06-21', 'Prednosti mediteranske prehrane za srce', 'Nova istraživanja potvrđuju da mediteranska dijeta značajno smanjuje rizik od kardiovaskularnih bolesti.', '\r\nMediteranska prehrana već desetljećima slovi kao zlatni standard u prevenciji kardiovaskularnih bolesti. Najnoviji podaci iz PREDIMED studije, koju je provelo Sveučilište u Barceloni, obuhvatili su 10 000 sudionika u dobi od 55 do 80 godina i pratili njihove prehrambene navike tijekom 15 godina.\r\n\r\nStudija je uspoređivala tri prehrambena obrasca: mediteransku dijetu s dodatkom ekstra djevičanskog maslinovog ulja, mediteransku dijetu s orašastim plodovima te kontrolnu grupu na niskomasnoj prehrani. Rezultati su pokazali 30 % smanjenje rizika od srčanog udara i moždanog udara kod obje grupe na mediteranskoj dijeti u odnosu na kontrolnu skupinu.\r\n\r\nKljučne komponente koje se povezuju s tim rezultatima su visoka razina mononezasićenih masnih kiselina u maslinovom ulju, omega-3 masne kiseline iz ribe te antioksidansi i vlakna iz svježeg povrća i voća. “Redovita konzumacija maslinovog ulja i orašastih plodova čini razliku u strukturi stijenki krvnih žila te smanjuje upalne procese”, objašnjava dr. María Santos, voditeljica studije.\r\n\r\nPreporučeni dnevni plan obroka uključuje:\r\n1. Doručak: grčki jogurt s medom i orasima  \r\n2. Ručak: salata od svježe rajčice, krastavaca i maslina s maslinovim uljem  \r\n3. Večera: pečeni losos s povrćem na žaru  \r\n4. Međuobrok: šaka badema ili oraha  \r\n\r\nUz prehranu, istraživanje ističe važnost redovite tjelesne aktivnosti, umjerenog unosa crnog vina i socijalnih obroka kao dodatnih faktora dugovječnosti.\r\n', 'medprehrana.jpg', 'Gesundheit', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
