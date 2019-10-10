-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 10 oct. 2019 à 16:32
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse_livraison`
--

DROP TABLE IF EXISTS `adresse_livraison`;
CREATE TABLE IF NOT EXISTS `adresse_livraison` (
  `commande_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `adresse` varchar(45) NOT NULL,
  `code_postal` char(5) NOT NULL,
  `ville` varchar(45) NOT NULL,
  KEY `fk_client_commande_commande_idx` (`commande_id`),
  KEY `fk_client_commande_client_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `adresse_livraison`
--

INSERT INTO `adresse_livraison` (`commande_id`, `client_id`, `adresse`, `code_postal`, `ville`) VALUES
(1, 1, '5 rue Jean Jaures', '59300', 'Valenciennes'),
(2, 2, '8 rue Jean Jaures', '59300', 'Valenciennes'),
(3, 8, '18 route de la forêt de Machecoule', '59300', 'Valenciennes'),
(4, 6, '18 route de la forêt de Machecoule', '59300', 'Valenciennes'),
(5, 7, '6 rue Fantomas', '59300', 'Valenciennes'),
(6, 4, '68 résidence du lac', '59300', 'Valenciennes'),
(7, 5, '6 rue Tolstoï', '59300', 'Valenciennes'),
(8, 8, '18 route de la forêt de Machecoule', '59300', 'Valenciennes'),
(9, 2, '18 Résidence Jean Moulin', '59300', 'Valenciennes'),
(10, 3, '19 Rue Victor Hugo', '59300', 'Valenciennes');

-- --------------------------------------------------------

--
-- Structure de la table `chef`
--

DROP TABLE IF EXISTS `chef`;
CREATE TABLE IF NOT EXISTS `chef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `chef`
--

INSERT INTO `chef` (`id`, `nom`, `prenom`, `email`, `login`, `mdp`) VALUES
(1, 'Linguini', 'Alfredo', 'alfredo.linguini@expressfood.fr', 'alinguini', 'alfredo'),
(2, 'Tatou', 'Colette', 'colette.tatou@expressfood.fr', 'ctatou', 'colette'),
(3, 'Gusteau', 'Rémy', 'remy.gusteau@expressfood.fr', 'rgusteau', 'remy'),
(4, 'Gusteau', 'Auguste', 'auguste.gusteau@expressfood.fr', 'agusteau', 'auguste');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `adresse` varchar(90) NOT NULL,
  `code_postal` char(5) NOT NULL,
  `ville` varchar(45) NOT NULL,
  `tel_fixe` char(10) NOT NULL,
  `tel_portable` char(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `adresse`, `code_postal`, `ville`, `tel_fixe`, `tel_portable`, `email`, `login`, `mdp`) VALUES
(1, 'Durand', 'Nadia ', '5 rue Jean Jaures', '59300', 'Valenciennes', '0327152121', '0612122312', 'nadia.durand@yahoo.fr', 'ndurand', 'nadia'),
(2, 'Mbappe', 'Maurice ', '18 Résidence Jean Moulin', '59300', 'Valenciennes', '0327343414', '0615152315', 'Maurice.mbappe@gmail.com', 'mmbappe', 'maurice'),
(3, 'Dupont', 'Miguel ', '19 Rue Victor Hugo', '59300', 'Valenciennes', '0327141414', '0648492563', 'mdupont@sfr.fr', 'mdupont', 'miguel'),
(4, 'Petit', 'Gilbert', '58 Place Cuvelier', '59300', 'Valenciennes', '0328141814', '0612356984', 'gpetit@free.fr', 'gpetit', 'gilbert'),
(5, 'Dziouba', 'Natacha', '62 Avenue Foch', '59300', 'Valenciennes', '0327241515', '0668956321', 'fedor59300@orange.fr', 'Fedor', 'Natacha'),
(6, 'Juve', 'Paul', '5 rue Fantomas', '59300', 'Valenciennes', '0327241555', '0612122366', 'paul.juve.orange.fr', 'pjuve', 'paul'),
(7, 'Fandor', 'Jerome', '6 rue Fantomas', '59300', 'Valenciennes', '0327343444', '0615152377', 'jerome.fandor@gmail.com', 'jfandor', 'jerome'),
(8, 'Chaudard', 'Paul', '18 route de la forêt de Machecoule', '59300', 'Valenciennes', '0327343412', '0612356999', 'paul.chaudard@free.fr', 'pchaudard', 'paul'),
(9, 'Delille', 'Hélène', '18 rue de Paris', '59300', 'Valenciennes', '0327245454', '0668952323', 'helene.delille@orange.fr', 'hdelille', 'helene'),
(10, 'Pignon', 'gilberte', '42 résidence Victor Hugo', '59300', 'Valenciennes', '0327249647', '0668960607', 'hugette.pignon@free.fr', 'hpignon', 'Gilberte');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_commande` date NOT NULL,
  `total_ht` decimal(5,2) NOT NULL,
  `statut` varchar(45) NOT NULL,
  `livreur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commande_livreur_idx` (`livreur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `date_commande`, `total_ht`, `statut`, `livreur_id`) VALUES
(1, '2019-10-01', '20.00', 'Livrée', 1),
(2, '2019-10-01', '60.99', 'Livrée', 2),
(3, '2019-10-03', '33.50', 'Livrée', 4),
(4, '2019-10-03', '60.99', 'Livrée', 5),
(5, '2019-10-04', '98.00', 'Livrée', 8),
(6, '2019-10-04', '25.00', 'Livrée', 7),
(7, '2019-10-06', '55.99', 'Livrée', 6),
(8, '2019-10-06', '25.00', 'Livrée', 4),
(9, '2019-10-07', '60.00', 'Livrée', 2),
(10, '2019-09-07', '60.99', 'Livrée', 8);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

DROP TABLE IF EXISTS `ligne_commande`;
CREATE TABLE IF NOT EXISTS `ligne_commande` (
  `commande_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  KEY `fk_ligne_commande_plat_idx` (`plat_id`),
  KEY `fk_ligne_commande_commande_idx` (`commande_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`commande_id`, `plat_id`, `quantite`) VALUES
(1, 9, 1),
(1, 15, 1),
(2, 13, 2),
(2, 1, 2),
(3, 5, 2),
(3, 4, 2),
(3, 10, 3),
(3, 14, 1),
(4, 6, 1),
(4, 3, 2),
(4, 11, 2),
(4, 15, 1),
(5, 3, 1),
(5, 11, 1),
(6, 3, 2),
(6, 6, 1),
(7, 7, 2),
(7, 12, 2),
(8, 7, 1),
(8, 9, 3),
(8, 15, 2),
(9, 2, 1),
(9, 16, 1),
(10, 1, 1),
(10, 2, 1),
(10, 13, 1),
(10, 13, 1);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `liste_clients`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `liste_clients`;
CREATE TABLE IF NOT EXISTS `liste_clients` (
`id` int(11)
,`nom` varchar(45)
,`prenom` varchar(45)
,`adresse` varchar(90)
,`code_postal` char(5)
,`ville` varchar(45)
,`email` varchar(45)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `liste_commande`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `liste_commande`;
CREATE TABLE IF NOT EXISTS `liste_commande` (
`id` int(11)
,`nom` varchar(45)
,`prenom` varchar(45)
,`date_commande` date
,`total_ht` decimal(5,2)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `liste_livreurs`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `liste_livreurs`;
CREATE TABLE IF NOT EXISTS `liste_livreurs` (
`nom` varchar(45)
,`prenom` varchar(45)
,`statut` varchar(45)
,`geolocalisation` varchar(45)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `liste_plats_du_jour`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `liste_plats_du_jour`;
CREATE TABLE IF NOT EXISTS `liste_plats_du_jour` (
`libelle` varchar(45)
,`type` varchar(45)
,`date_menu` date
);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  `statut` varchar(45) NOT NULL,
  `geolocalisation` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id`, `nom`, `prenom`, `email`, `login`, `mdp`, `statut`, `geolocalisation`) VALUES
(1, 'Carrera', 'Sally', 'sally.carrera@expressfood.fr', 'scarrera', 'sally', 'maraude', '41.40335, 2.17303'),
(2, 'McQueen', 'Flash', 'flash.mcqueen@expressfood.fr', 'fmcqueen', 'flash', 'réaprovisionement', '41.44338, 2.27403'),
(3, 'Prost', 'Alain', 'alain.prost@expressfood.fr', 'aprost', 'alain', 'garage', '42.40338, 2.17403'),
(4, 'Loeb', 'Sebastien', 'sebastien.loeb@expressfood.fr', 'sloeb', 'sebastien', 'livraison', '43.40338, 2.17503'),
(5, 'Longo', 'Jeannie', 'Jeannie.longo@expressfood.fr', 'jlongo', 'jeannie', 'maraude', '43.40338, 2.2003'),
(6, 'Arron', 'Christine ', 'christine.arron@expressfood.fr', 'carron', 'christine', 'maraude', '43.40338, 2.8003'),
(7, 'Jones', 'Marion', 'marion.jones@gmail.com', 'mjones', 'marion', 'réapprovisionnement', '43.40338, 2.8005'),
(8, 'Armstrong', 'Lance', 'lance.armstrong@gmail.com', 'larmstrong', 'lance', 'livraison', '43.40338, 2.12222');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_menu` date NOT NULL,
  `plat_id` int(11) NOT NULL,
  `chef_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_plat_idx` (`plat_id`),
  KEY `fk_menu_chef_idx` (`chef_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id`, `date_menu`, `plat_id`, `chef_id`) VALUES
(1, '2019-10-01', 9, 2),
(2, '2019-10-01', 15, 2),
(3, '2019-10-01', 13, 2),
(4, '2019-10-01', 1, 2),
(5, '2019-10-02', 7, 4),
(6, '2019-10-02', 12, 4),
(7, '2019-10-02', 16, 4),
(8, '2019-10-02', 2, 4),
(11, '2019-10-03', 5, 2),
(12, '2019-10-03', 4, 2),
(13, '2019-10-03', 10, 2),
(14, '2019-10-03', 14, 2),
(15, '2019-10-04', 3, 2),
(16, '2019-10-04', 6, 2),
(17, '2019-10-04', 11, 2),
(18, '2019-10-04', 15, 2),
(19, '2019-10-06', 7, 4),
(20, '2019-10-06', 9, 4),
(21, '2019-10-06', 12, 4),
(22, '2019-10-06', 15, 4),
(23, '2019-10-07', 1, 1),
(24, '2019-10-07', 2, 1),
(25, '2019-10-07', 13, 1),
(26, '2019-10-07', 16, 1),
(27, '2019-10-08', 3, 2),
(28, '2019-10-08', 5, 2),
(29, '2019-10-08', 10, 2),
(30, '2019-10-08', 11, 2),
(31, '2019-10-09', 4, 2),
(32, '2019-10-09', 6, 2),
(33, '2019-10-09', 14, 2),
(34, '2019-10-09', 15, 2);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(45) NOT NULL,
  `stock` int(11) NOT NULL,
  `prix_ht` decimal(4,2) NOT NULL,
  `chef_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plat_chef_idx` (`chef_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id`, `libelle`, `type`, `description`, `photo`, `stock`, `prix_ht`, `chef_id`) VALUES
(1, 'Ratatouille', 'Plat', 'La ratatouille est une spécialité culinaire traditionnelle des cuisines niçoise, provençale, occitane et méditerranéenne, à base de ragoût mijoté de légumes méditerranéens, et d\'huile d\'olive.', 'photos/ratatouille.jpg', 10, '15.99', 1),
(2, 'Cassoulet', 'Plat', 'Le cassoulet est une spécialité régionale du Languedoc, à base de haricots secs, généralement blancs, et de viande.', 'photos/cassoulet.jpg', 10, '14.99', 2),
(3, 'Tartiflette', 'Plat', 'La tartiflette est un gratin de pommes de terre et d\'oignons sur lequel on fait fondre du reblochon, un fromage originaire des Pays de Savoie.', 'photos/tartiflette.jpg', 0, '14.99', 3),
(4, 'Quiche Maroilles', 'Plat', 'S\'il y a bien un fromage réputé dans le Nord c\'est bien le Maroilles ! Trempé dans le café du matin ou dans une quiche ce fromage a du caractère.', 'photos/quicheMaroilles.jpg', 0, '12.00', 1),
(5, 'Ficèle picarde', 'Plat', 'La ficelle picarde est une crêpe garnie de jambon, de champignons, d\'échalotes, de crème fraîche et cuite au four.\r\n\r\nLa garniture est faite à base d\'une duxelles de champignons, de crème, d\'échalote sur une demi-tranche de jambon blanc.', 'photos/ficelePicarde.jpg', 0, '12.00', 2),
(6, 'Paëlla', 'Plat', 'La paella est un plat traditionnel à base de riz rond, originaire de la région de Valence en Espagne, qui tient son nom de la poêle qui sert à la cuisiner. ', 'photos/paella.jpg', 0, '18.50', 2),
(7, 'Couscous Royal', 'Plat', 'Le couscous est servi le plus souvent avec un ragoût de légumes accompagné de viande, présenté parfois dans un plat en terre cuite traditionnel à tajine.', 'photos/couscousRoyale.jpg', 0, '19.99', 3),
(9, 'Boeuf Stroganov', 'Plat', 'Le bœuf Stroganov ou bœuf Stroganoff est une recette traditionnelle de la cuisine russe, à base de ragoût de viande de bœuf mariné, sauté, puis braisé avec une sauce à la crème de smetana ou de crème aigre, de moutarde, de paprika, d\'oignons, et de champignons. ', 'photos/boeufStroganov.jpg', 0, '15.50', 3),
(10, 'Tarte tatin', 'Dessert', 'La tarte Tatin est une tarte aux pommes caramélisées au sucre et au beurre, la pâte disposée au-dessus de la garniture. Après cuisson au four, elle est renversée sur un plat et servie tiède, comme veux la tradition, rien ne doit être rajouté sur la Tatin.', 'photos/tarteTatin.jpg', 0, '5.50', 2),
(11, 'Mille feuilles', 'Dessert', 'Un mille-feuille, ou millefeuille, est une pièce de pâtisserie faite de trois couches de pâte feuilletée et deux couches de crème pâtissière. Le dessus est glacé avec du sucre glace ou du fondant. On peut y ajouter de la confiture ou des fruits.', 'photos/milleFeuilles.jpg', 0, '5.50', 2),
(12, 'Makrout', 'Dessert', 'Le makrout, ou makroud, également orthographié maqrouth, maqroudh, est une pâtisserie maghrébine toujours en forme de losange. C\'est une pâtisserie très populaire en Tunisie, en Algérie, au Maroc, et également en Libye et à Malte.', 'photos/makrout.jpg', 0, '6.50', 2),
(13, 'Opéra', 'Dessert', 'L\'opéra est une pâtisserie française constituée d’une succession de biscuit Joconde, de ganache au chocolat et de crème au beurre au café. ', 'photos/opera.jpg', 10, '5.50', 1),
(14, 'Vatrouchka', 'Dessert', 'La vatrouchka est un gâteau russe traditionnel à base de fromage blanc.', 'photos/vatrouchka.jpg', 0, '7.00', 1),
(15, 'Moelleu chocolat', 'Dessert', 'Un petit gâteau, ou fondant au chocolat, est un dessert composé d\'un petit gâteau au chocolat à croûte croquante et à la garniture moelleuse qui est traditionnellement servi chaud avec de la crème glacée à la vanille dans une assiette.', 'photos/syrniki.jpg', 0, '5.50', 2),
(16, 'Placek', 'Dessert', 'Gâteau en polonais se dit placek, et c’est souvent le nom donné à cette recette. Il s’appelle aussi Drozdzowka qui signifie brioche dans la langue de Sienkiewicz. Donc comme nous disions à vous de voir !', 'photos/placek.jpg', 12, '5.50', 3);

-- --------------------------------------------------------

--
-- Structure de la table `stock_livreur`
--

DROP TABLE IF EXISTS `stock_livreur`;
CREATE TABLE IF NOT EXISTS `stock_livreur` (
  `livreur_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  KEY `fk_stock_livreur_livreur_idx` (`livreur_id`),
  KEY `fk_stock_livreur_plat_idx` (`plat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `stock_livreur`
--

INSERT INTO `stock_livreur` (`livreur_id`, `plat_id`, `stock`) VALUES
(7, 6, 0),
(7, 3, 2),
(7, 11, 1),
(7, 15, 0),
(3, 6, 0),
(3, 3, 0),
(3, 11, 0),
(3, 15, 0),
(1, 6, 6),
(1, 3, 6),
(1, 11, 6),
(1, 15, 6),
(2, 6, 2),
(2, 3, 2),
(2, 11, 1),
(2, 15, 1);

-- --------------------------------------------------------

--
-- Structure de la vue `liste_clients`
--
DROP TABLE IF EXISTS `liste_clients`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `liste_clients`  AS  select `client`.`id` AS `id`,`client`.`nom` AS `nom`,`client`.`prenom` AS `prenom`,`client`.`adresse` AS `adresse`,`client`.`code_postal` AS `code_postal`,`client`.`ville` AS `ville`,`client`.`email` AS `email` from `client` order by `client`.`id` ;

-- --------------------------------------------------------

--
-- Structure de la vue `liste_commande`
--
DROP TABLE IF EXISTS `liste_commande`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `liste_commande`  AS  select `commande`.`id` AS `id`,`client`.`nom` AS `nom`,`client`.`prenom` AS `prenom`,`commande`.`date_commande` AS `date_commande`,`commande`.`total_ht` AS `total_ht` from ((`commande` join `client`) join `adresse_livraison`) where ((`client`.`id` = `adresse_livraison`.`client_id`) and (`commande`.`id` = `adresse_livraison`.`commande_id`)) ;

-- --------------------------------------------------------

--
-- Structure de la vue `liste_livreurs`
--
DROP TABLE IF EXISTS `liste_livreurs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `liste_livreurs`  AS  select `livreur`.`nom` AS `nom`,`livreur`.`prenom` AS `prenom`,`livreur`.`statut` AS `statut`,`livreur`.`geolocalisation` AS `geolocalisation` from `livreur` ;

-- --------------------------------------------------------

--
-- Structure de la vue `liste_plats_du_jour`
--
DROP TABLE IF EXISTS `liste_plats_du_jour`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `liste_plats_du_jour`  AS  select `plat`.`libelle` AS `libelle`,`plat`.`type` AS `type`,`menu`.`date_menu` AS `date_menu` from (`plat` join `menu`) where ((`menu`.`date_menu` = '2019-10-04') and (`plat`.`id` = `menu`.`plat_id`)) ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse_livraison`
--
ALTER TABLE `adresse_livraison`
  ADD CONSTRAINT `fk_client_commande_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_client_commande_commande` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_livreur` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `fk_ligne_commande_commande` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ligne_commande_plat` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_chef` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_plat` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `fk_plat_chef` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  ADD CONSTRAINT `fk_stock_livreur_livreur` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stock_livreur_plat` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

