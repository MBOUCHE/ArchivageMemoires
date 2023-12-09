-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  sam. 26 mai 2018 à 13:31
-- Version du serveur :  10.1.31-MariaDB
-- Version de PHP :  7.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `armem`
--

-- --------------------------------------------------------

--
-- Structure de la table `avoir`
--

CREATE TABLE `avoir` (
  `idav` int(11) NOT NULL,
  `idcyc` int(11) NOT NULL,
  `idMent` int(11) NOT NULL,
  `nomAv` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS POUR LA TABLE `avoir`:
--   `idcyc`
--       `cycle` -> `idcyc`
--   `idMent`
--       `mentions` -> `idMent`
--

--
-- Déchargement des données de la table `avoir`
--

INSERT INTO `avoir` (`idav`, `idcyc`, `idMent`, `nomAv`) VALUES
(1, 1, 1, 'DUT-GIN'),
(2, 1, 2, 'DUT-GIM'),
(3, 1, 3, 'DUT-GBIO'),
(4, 2, 1, 'LICENCE-GIN'),
(5, 2, 2, 'LICENCE-GIM'),
(6, 2, 3, 'LICENCE-GBIO');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idcat` int(11) NOT NULL,
  `nomcat` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS POUR LA TABLE `categorie`:
--

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idcat`, `nomcat`) VALUES
(1, 'Professeur'),
(2, 'Maitre De Conf'),
(3, 'Docteur'),
(4, 'Charger des TD ');

-- --------------------------------------------------------

--
-- Structure de la table `cycle`
--

CREATE TABLE `cycle` (
  `idcyc` int(11) NOT NULL,
  `nomcyc` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS POUR LA TABLE `cycle`:
--

--
-- Déchargement des données de la table `cycle`
--

INSERT INTO `cycle` (`idcyc`, `nomcyc`) VALUES
(1, 'DUT'),
(2, 'LICENCE');

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE `document` (
  `idDoc` int(11) NOT NULL,
  `themeDoc` longtext NOT NULL,
  `motClesDoc` longtext NOT NULL,
  `resume` longtext NOT NULL,
  `typeDoc` varchar(19) NOT NULL,
  `mentionsObtenue` varchar(31) NOT NULL,
  `idEtudiant` int(11) NOT NULL,
  `docPDF` varchar(35) NOT NULL,
  `urlFich` varchar(31) NOT NULL,
  `extention` varchar(15) NOT NULL,
  `dateEnr` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS POUR LA TABLE `document`:
--   `idEtudiant`
--       `etudiant` -> `idEtu`
--

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`idDoc`, `themeDoc`, `motClesDoc`, `resume`, `typeDoc`, `mentionsObtenue`, `idEtudiant`, `docPDF`, `urlFich`, `extention`, `dateEnr`) VALUES
(2, 'Gestion Bibliotheque de l\'IUT', 'auteur bibliotheque livre lire', 'sentir dans la mesure où les informations contenues dans les paquets doivent être analysées plus finement.\r\n-	Le VLAN par protocole : il permet de créer un réseau virtuel par type de protocole, en regroupant ainsi toutes les machines utilisant les mêmes protocoles dans un même réseau.  Avec ce type de VLAN, c’est le protocole de couche 3 transporté par la trame qui permet de déterminer l’appartenance au réseau VLAN. Cette méthode est mieux adaptée dans un environnement où figurent plusieurs protocoles, mais n’est pas très pratique sur un réseau à prédominance IP.\r\n', 'Publique', 'Bien', 4, 'Firebase.pdf', 'Memoires/Firebase', '.pdf', '2018-05-20'),
(3, 'Gestion Pharmacie', 'pharmacie medicament fournisseur stocks', '?	Flexibilité : Possibilité de travailler au niveau 2 (Adresse MAC) ou au niveau 3 (IP). Les VLANs fonctionnent au niveau de la couche 2 du modèle OSI. Toutefois, un VLAN est souvent configuré pour se connecter directement à un réseau IP, ce qui donne l\'impression de travailler plutôt au niveau de la couche 3. Les VLAN\'S peuvent aussi se baser sur les ports physiques des commutateurs (attention à ne pas confondre les ports \"physiques\" avec les ports \"logiques\" du protocole) (en anglais : \"port based\") ce qui correspond au niveau 1 du modèle OSI.', 'Publique', 'Bien', 5, '235061-creer-des-gif-animes.pdf', 'Memoires/235061-creer-des-gif-a', '.pdf', '2018-05-21'),
(4, 'Gestion Pharmacie', 'pharmacie medicament fournisseur stocks', '?	Flexibilité : Possibilité de travailler au niveau 2 (Adresse MAC) ou au niveau 3 (IP). Les VLANs fonctionnent au niveau de la couche 2 du modèle OSI. Toutefois, un VLAN est souvent configuré pour se connecter directement à un réseau IP, ce qui donne l\'impression de travailler plutôt au niveau de la couche 3. Les VLAN\'S peuvent aussi se baser sur les ports physiques des commutateurs (attention à ne pas confondre les ports \"physiques\" avec les ports \"logiques\" du protocole) (en anglais : \"port based\") ce qui correspond au niveau 1 du modèle OSI.', 'Publique', 'Bien', 8, '671455-bruit-de-perlin.pdf', 'Memoires/671455-bruit-de-perlin', '.pdf', '2018-05-21'),
(5, 'redimentionnement des pieces voiturieres ', 'voitur piece', 'Les rÃ©seaux virtuels (Virtual LAN) sont apparus comme une nouvelle fonctionnalitÃ© dans lâ€™administration rÃ©seau avec le dÃ©veloppement des commutateurs. La notion de VLAN est un concept qui permet de rÃ©aliser des rÃ©seaux de faÃ§on indÃ©pendante du systÃ¨me de cÃ¢blage. Ces rÃ©seaux permettent de dÃ©finir des domaines de diffusions restreints, cela signifie quâ€™un message Ã©mis par une station du VLAN ne pourra Ãªtre reÃ§u que par les stations de ce mÃªme VLAN. Un VLAN, est donc, un regroupement logique, et non physique, de plusieurs stations. Pour rÃ©aliser ce regroupement, on intervient directement, par voie logicielle, sur le ou les Ã©lÃ©ments actifs que sont les commutateurs VLAN', 'Privee', 'Assez-bien', 9, '88620-votre-site-php-presque-comple', 'Memoires/88620-votre-site-php-p', '.pdf', '2018-05-25'),
(6, 'redimentionnement des pieces voiturieres ', 'voitur piece', 'Les rÃ©seaux virtuels (Virtual LAN) sont apparus comme une nouvelle fonctionnalitÃ© dans lâ€™administration rÃ©seau avec le dÃ©veloppement des commutateurs. La notion de VLAN est un concept qui permet de rÃ©aliser des rÃ©seaux de faÃ§on indÃ©pendante du systÃ¨me de cÃ¢blage. Ces rÃ©seaux permettent de dÃ©finir des domaines de diffusions restreints, cela signifie quâ€™un message Ã©mis par une station du VLAN ne pourra Ãªtre reÃ§u que par les stations de ce mÃªme VLAN. Un VLAN, est donc, un regroupement logique, et non physique, de plusieurs stations. Pour rÃ©aliser ce regroupement, on intervient directement, par voie logicielle, sur le ou les Ã©lÃ©ments actifs que sont les commutateurs VLAN', 'Publique', 'Excellent', 9, 'CAHIER DES CHARGES.docx', 'Memoires/CAHIER DES CHARGES.doc', '.doc', '2018-05-25'),
(7, 'reseau social des etudiants', 'social reseau anciens etudiant', 'Les rÃ©seaux virtuels (Virtual LAN) sont apparus comme une nouvelle fonctionnalitÃ© dans lâ€™administration rÃ©seau avec le dÃ©veloppement des commutateurs. La notion de VLAN est un concept qui permet de rÃ©aliser des rÃ©seaux de faÃ§on indÃ©pendante du systÃ¨me de cÃ¢blage. Ces rÃ©seaux permettent de dÃ©finir des domaines de diffusions restreints, cela signifie quâ€™un message Ã©mis par une station du VLAN ne pourra Ãªtre reÃ§u que par les stations de ce mÃªme VLAN. Un VLAN, est donc, un regroupement logique, et non physique, de plusieurs stations. Pour rÃ©aliser ce regroupement, on intervient directement, par voie logicielle, sur le ou les Ã©lÃ©ments actifs que sont les commutateurs VLAN.', 'Privee', 'Bien', 10, 'ProjetGroup1.docx', 'Memoires/ProjetGroup1.docx', '.docx', '2018-05-26'),
(8, 'reseau social des etudiants', 'social reseau anciens etudiant', 'Les rÃ©seaux virtuels (Virtual LAN) sont apparus comme une nouvelle fonctionnalitÃ© dans lâ€™administration rÃ©seau avec le dÃ©veloppement des commutateurs. La notion de VLAN est un concept qui permet de rÃ©aliser des rÃ©seaux de faÃ§on indÃ©pendante du systÃ¨me de cÃ¢blage. Ces rÃ©seaux permettent de dÃ©finir des domaines de diffusions restreints, cela signifie quâ€™un message Ã©mis par une station du VLAN ne pourra Ãªtre reÃ§u que par les stations de ce mÃªme VLAN. Un VLAN, est donc, un regroupement logique, et non physique, de plusieurs stations. Pour rÃ©aliser ce regroupement, on intervient directement, par voie logicielle, sur le ou les Ã©lÃ©ments actifs que sont les commutateurs VLAN.', 'Privee', 'Bien', 10, 'ProjetGroup1.docx', 'Memoires/ProjetGroup1.docx', '.docx', '2018-05-26'),
(9, 'archivage memoire DUT LICENCE', 'bonjour bonsoir good morning', 'Les rÃ©seaux virtuels (Virtual LAN) sont apparus comme une nouvelle fonctionnalitÃ© dans lâ€™administration rÃ©seau avec le dÃ©veloppement des commutateurs. La notion de VLAN est un concept qui permet de rÃ©aliser des rÃ©seaux de faÃ§on indÃ©pendante du systÃ¨me de cÃ¢blage. Ces rÃ©seaux permettent de dÃ©finir des domaines de diffusions restreints, cela signifie quâ€™un message Ã©mis par une station du VLAN ne pourra Ãªtre reÃ§u que par les stations de ce mÃªme VLAN. Un VLAN, est donc, un regroupement logique, et non physique, de plusieurs stations. Pour rÃ©aliser ce regroupement, on intervient directement, par voie logicielle, sur le ou les Ã©lÃ©ments actifs que sont les commutateurs VLAN', 'Publique', 'Excellent', 10, 'Creolink Cameroun.pdf', 'Memoires/Creolink Cameroun.pdf', '.pdf', '2018-05-26'),
(10, 'archivage memoire DUT LICENCE', 'bonjour bonsoir good morning', 'Les rÃ©seaux virtuels (Virtual LAN) sont apparus comme une nouvelle fonctionnalitÃ© dans lâ€™administration rÃ©seau avec le dÃ©veloppement des commutateurs. La notion de VLAN est un concept qui permet de rÃ©aliser des rÃ©seaux de faÃ§on indÃ©pendante du systÃ¨me de cÃ¢blage. Ces rÃ©seaux permettent de dÃ©finir des domaines de diffusions restreints, cela signifie quâ€™un message Ã©mis par une station du VLAN ne pourra Ãªtre reÃ§u que par les stations de ce mÃªme VLAN. Un VLAN, est donc, un regroupement logique, et non physique, de plusieurs stations. Pour rÃ©aliser ce regroupement, on intervient directement, par voie logicielle, sur le ou les Ã©lÃ©ments actifs que sont les commutateurs VLAN', 'Publique', 'Excellent', 10, 'Creolink Cameroun.pdf', 'Memoires/Creolink Cameroun.pdf', '.pdf', '2018-05-26'),
(11, 'test de fichier word', 'word office doc', 'Encore appelÃ© rÃ©seaux VLAN bases sur les protocoles, le VLAN de niveau 3 se subdivise en deux types : -	Le VLAN par sous-rÃ©seau : il associe des sous-rÃ©seaux selon lâ€™adresse IP des datagrammes. Ce type de solution apporte une grande souplesse dans la mesure oÃ¹ la configuration des commutateurs se modifient automatiquement en cas de dÃ©placement dâ€™une station. En contrepartie une lÃ©gÃ¨re dÃ©gradation en performance peut se faire ', 'Privee', 'Bien', 10, 'CAHIER DES CHARGES.docx', 'Memoires/CAHIER DES CHARGES.doc', '.doc', '2018-05-26'),
(12, 'production des gateaux', 'gatea fari bon ', 'En conclusions nous pouvons dire que les VLANs nous permettent de sÃ©parer notre LAN en plusieurs sous-rÃ©seaux virtuels. Cela nous permet de faciliter la gestions de notre rÃ©seaux (sÃ©parations des utilisateurs par groupe de travail), dÂ´amÃ©liorer  la gestions des ressources , dÂ´amÃ©liorer la sÃ©curitÃ© de notre rÃ©seau, et dÂ´amÃ©liorer la bande passante en divisant les domaine de Broadcast   ', 'Privee', 'Assez-bien', 11, 'intro theorie des graphes Partie 1 ', 'Memoires/intro theorie des grap', '.pdf', '2018-05-26'),
(13, 'Gestion Bibliotheque de l\'IUT', 'pharmacie medicament fournisseur stocks', 'Les rÃ©seaux virtuels (Virtual LAN) sont apparus comme une nouvelle fonctionnalitÃ© dans lâ€™administration rÃ©seau avec le dÃ©veloppement des commutateurs. La notion de VLAN est un concept qui permet de rÃ©aliser des rÃ©seaux de faÃ§on indÃ©pendante du systÃ¨me de cÃ¢blage. Ces rÃ©seaux permettent de dÃ©finir des domaines de diffusions restreints, cela signifie quâ€™un message Ã©mis par une station du VLAN ne pourra Ãªtre reÃ§u que par les stations de ce mÃªme VLAN. Un VLAN, est donc, un regroupement logique, et non physique, de plusieurs stations. Pour rÃ©aliser ce regroupement, on intervient directement, par voie logicielle, sur le ou les Ã©lÃ©ments actifs que sont les commutateurs VLAN', 'Publique', 'Tres-bien', 12, 'Firebase.pdf', 'Memoires/Firebase.pdf', '.pdf', '2018-05-26');

-- --------------------------------------------------------

--
-- Structure de la table `encadreur`
--

CREATE TABLE `encadreur` (
  `idEnc` int(11) NOT NULL,
  `nomEnc` varchar(35) NOT NULL,
  `prenomEnc` varchar(35) NOT NULL,
  `EMailEnc` varchar(45) NOT NULL,
  `phoneEnc` int(15) NOT NULL,
  `idcat` int(11) NOT NULL,
  `dateEnr` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS POUR LA TABLE `encadreur`:
--   `idcat`
--       `categorie` -> `idcat`
--

--
-- Déchargement des données de la table `encadreur`
--

INSERT INTO `encadreur` (`idEnc`, `nomEnc`, `prenomEnc`, `EMailEnc`, `phoneEnc`, `idcat`, `dateEnr`) VALUES
(1, 'Ndam', 'Harouna', 'harounandam@gmail.com', 69985749, 1, '2018-05-18'),
(2, 'Dangbe', 'Ezekiel', 'ezekieldangbe@gmail.com', 658745896, 3, '2018-05-18'),
(3, 'fendji', 'louis', 'louisfendji@gmail.com', 69857458, 3, '2018-05-26');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `idEtu` int(11) NOT NULL,
  `nomEtu` varchar(19) NOT NULL,
  `prenomEtu` varchar(19) NOT NULL,
  `dateNais` date NOT NULL,
  `MatEtu` varchar(8) NOT NULL,
  `EMailEtu` varchar(31) NOT NULL,
  `PhoneEtu` int(9) NOT NULL,
  `idcyc` int(11) NOT NULL,
  `idMent` int(11) NOT NULL,
  `idparcours` int(11) NOT NULL,
  `idEnc` int(11) NOT NULL,
  `dateEnr` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS POUR LA TABLE `etudiant`:
--   `idparcours`
--       `parcours` -> `idpar`
--   `idEnc`
--       `encadreur` -> `idEnc`
--   `idcyc`
--       `cycle` -> `idcyc`
--   `idMent`
--       `mentions` -> `idMent`
--

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`idEtu`, `nomEtu`, `prenomEtu`, `dateNais`, `MatEtu`, `EMailEtu`, `PhoneEtu`, `idcyc`, `idMent`, `idparcours`, `idEnc`, `dateEnr`) VALUES
(1, 'abouabakr', 'abdoulbagui', '2018-05-31', '16I003IU', 'abdoulbaguiaboubakar@gmail.com', 65894589, 1, 1, 1, 1, '2018-05-20'),
(2, 'abouabakr', 'abdoulbagui', '2018-05-31', '16I003IU', 'abdoulbaguiaboubakar@gmail.com', 65894589, 1, 1, 1, 1, '2018-05-20'),
(3, 'abouabakr', 'abdoulbagui', '1997-02-18', '16I003IU', 'abdoulbaguiaboubakar@gmail.com', 65894589, 1, 1, 1, 1, '2018-05-20'),
(4, 'abouabakr', 'abdoulbagui', '1997-02-18', '16I003IU', 'abdoulbaguiaboubakar@gmail.com', 65894589, 1, 1, 1, 1, '2018-05-20'),
(5, 'Adoum', 'Taiga', '1896-12-18', '16I007IU', 'taigaadoum@gmail.com', 69874588, 1, 1, 1, 2, '2018-05-21'),
(6, 'Adoum', 'Taiga', '1896-12-18', '16I008IU', 'taigaadoum@gmail.com', 698745869, 1, 1, 1, 2, '2018-05-21'),
(7, 'Adoum', 'Taiga', '1896-12-18', '16I008IU', 'taigaadoum@gmail.com', 698745869, 1, 1, 1, 2, '2018-05-21'),
(8, 'Adoum', 'Taiga', '1896-12-18', '16I008IU', 'taigaadoum@gmail.com', 698745869, 1, 1, 1, 2, '2018-05-21'),
(9, 'patrick', 'ange', '2018-05-23', '16M063IU', 'angepatrick@gmail.com', 65894589, 1, 2, 3, 1, '2018-05-25'),
(10, 'Houssaini', '', '2018-05-29', '16I024IU', 'houssaini@gmail.com', 698545896, 1, 1, 1, 2, '2018-05-26'),
(11, 'jo', 'kal', '2018-05-29', '16M063IU', 'jokal@gm.vn', 6544586, 1, 3, 6, 1, '2018-05-26'),
(12, 'aboubakar', 'abdoulbagui', '2018-05-16', '16I003IU', 'abdoulbaguiaboubakar@gmail.com', 6589745, 1, 2, 3, 2, '2018-05-26');

-- --------------------------------------------------------

--
-- Structure de la table `gestionnaire`
--

CREATE TABLE `gestionnaire` (
  `idGes` int(11) NOT NULL,
  `nomGes` varchar(35) NOT NULL,
  `prenomGes` varchar(35) NOT NULL,
  `EMailGes` varchar(65) NOT NULL,
  `nomUser` varchar(35) NOT NULL,
  `passGes` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS POUR LA TABLE `gestionnaire`:
--

--
-- Déchargement des données de la table `gestionnaire`
--

INSERT INTO `gestionnaire` (`idGes`, `nomGes`, `prenomGes`, `EMailGes`, `nomUser`, `passGes`) VALUES
(1, 'Aboubakar', 'Abdoulbagui', 'abdoulbaguiaboubakar@gmail.com', 'abk', '123654');

-- --------------------------------------------------------

--
-- Structure de la table `mentions`
--

CREATE TABLE `mentions` (
  `idMent` int(11) NOT NULL,
  `nomMent` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS POUR LA TABLE `mentions`:
--

--
-- Déchargement des données de la table `mentions`
--

INSERT INTO `mentions` (`idMent`, `nomMent`) VALUES
(1, 'GIN'),
(2, 'GIM'),
(3, 'GBIO');

-- --------------------------------------------------------

--
-- Structure de la table `moyenne`
--

CREATE TABLE `moyenne` (
  `idMoy` int(11) NOT NULL,
  `nbNote` int(11) NOT NULL,
  `somme` int(11) NOT NULL,
  `idDoc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS POUR LA TABLE `moyenne`:
--   `idDoc`
--       `document` -> `idDoc`
--

-- --------------------------------------------------------

--
-- Structure de la table `parcours`
--

CREATE TABLE `parcours` (
  `idpar` int(11) NOT NULL,
  `nompar` varchar(15) NOT NULL,
  `idav` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS POUR LA TABLE `parcours`:
--   `idav`
--       `avoir` -> `idav`
--

--
-- Déchargement des données de la table `parcours`
--

INSERT INTO `parcours` (`idpar`, `nompar`, `idav`) VALUES
(1, 'GIN', 1),
(2, 'GTE', 2),
(3, 'GMP', 2),
(4, 'GEL', 2),
(5, 'MIP', 2),
(6, 'IAB', 3),
(7, 'ABB', 3),
(8, 'GEN', 3),
(9, 'GLO', 4),
(10, 'RES/INT', 4),
(11, 'GTE', 5),
(12, 'GEL', 5),
(13, 'GMP', 5),
(14, 'MIP', 5),
(15, 'IAB', 6),
(16, 'ABB', 6),
(17, 'GEN', 6);

-- --------------------------------------------------------

--
-- Structure de la table `typedoc`
--

CREATE TABLE `typedoc` (
  `idType` int(11) NOT NULL,
  `nomType` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS POUR LA TABLE `typedoc`:
--

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD PRIMARY KEY (`idav`),
  ADD KEY `idcyc` (`idcyc`),
  ADD KEY `idMent` (`idMent`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idcat`);

--
-- Index pour la table `cycle`
--
ALTER TABLE `cycle`
  ADD PRIMARY KEY (`idcyc`);

--
-- Index pour la table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`idDoc`),
  ADD KEY `idEtudiant` (`idEtudiant`);

--
-- Index pour la table `encadreur`
--
ALTER TABLE `encadreur`
  ADD PRIMARY KEY (`idEnc`),
  ADD KEY `idcat` (`idcat`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`idEtu`),
  ADD KEY `idparcours` (`idparcours`),
  ADD KEY `idEnc` (`idEnc`),
  ADD KEY `idcyc` (`idcyc`),
  ADD KEY `idMent` (`idMent`);

--
-- Index pour la table `gestionnaire`
--
ALTER TABLE `gestionnaire`
  ADD PRIMARY KEY (`idGes`);

--
-- Index pour la table `mentions`
--
ALTER TABLE `mentions`
  ADD PRIMARY KEY (`idMent`);

--
-- Index pour la table `moyenne`
--
ALTER TABLE `moyenne`
  ADD PRIMARY KEY (`idMoy`),
  ADD KEY `idDoc` (`idDoc`);

--
-- Index pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD PRIMARY KEY (`idpar`),
  ADD KEY `idav` (`idav`);

--
-- Index pour la table `typedoc`
--
ALTER TABLE `typedoc`
  ADD PRIMARY KEY (`idType`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avoir`
--
ALTER TABLE `avoir`
  MODIFY `idav` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idcat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `cycle`
--
ALTER TABLE `cycle`
  MODIFY `idcyc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `document`
--
ALTER TABLE `document`
  MODIFY `idDoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `encadreur`
--
ALTER TABLE `encadreur`
  MODIFY `idEnc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `idEtu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `gestionnaire`
--
ALTER TABLE `gestionnaire`
  MODIFY `idGes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `mentions`
--
ALTER TABLE `mentions`
  MODIFY `idMent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `moyenne`
--
ALTER TABLE `moyenne`
  MODIFY `idMoy` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `parcours`
--
ALTER TABLE `parcours`
  MODIFY `idpar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `typedoc`
--
ALTER TABLE `typedoc`
  MODIFY `idType` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD CONSTRAINT `avoir_ibfk_1` FOREIGN KEY (`idcyc`) REFERENCES `cycle` (`idcyc`),
  ADD CONSTRAINT `avoir_ibfk_2` FOREIGN KEY (`idMent`) REFERENCES `mentions` (`idMent`);

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_2` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiant` (`idEtu`);

--
-- Contraintes pour la table `encadreur`
--
ALTER TABLE `encadreur`
  ADD CONSTRAINT `encadreur_ibfk_1` FOREIGN KEY (`idcat`) REFERENCES `categorie` (`idcat`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`idparcours`) REFERENCES `parcours` (`idpar`),
  ADD CONSTRAINT `etudiant_ibfk_2` FOREIGN KEY (`idEnc`) REFERENCES `encadreur` (`idEnc`),
  ADD CONSTRAINT `etudiant_ibfk_3` FOREIGN KEY (`idcyc`) REFERENCES `cycle` (`idcyc`),
  ADD CONSTRAINT `etudiant_ibfk_4` FOREIGN KEY (`idMent`) REFERENCES `mentions` (`idMent`);

--
-- Contraintes pour la table `moyenne`
--
ALTER TABLE `moyenne`
  ADD CONSTRAINT `moyenne_ibfk_1` FOREIGN KEY (`idDoc`) REFERENCES `document` (`idDoc`);

--
-- Contraintes pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD CONSTRAINT `parcours_ibfk_1` FOREIGN KEY (`idav`) REFERENCES `avoir` (`idav`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
