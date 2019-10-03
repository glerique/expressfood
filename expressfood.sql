-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 03 oct. 2019 à 17:20
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
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `categorie`) VALUES
(1, 'Plat'),
(2, 'Dessert');

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
  `codePostal` char(5) NOT NULL,
  `ville` varchar(45) NOT NULL,
  `telFixe` char(10) NOT NULL,
  `telPortable` char(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `adresse`, `codePostal`, `ville`, `telFixe`, `telPortable`, `email`, `login`, `mdp`) VALUES
(1, 'Durand', 'Nadia ', '5 rue Jean Jaures', '59300', 'Valenciennes', '0327152121', '0612122312', '0612122312', 'ndurand', 'nadia'),
(2, 'Mbappe', 'Maurice ', '18 Résidence Jean Moulin', '59300', 'Valenciennes', '0327343414', '0615152315', '0615152315', 'mmbappe', 'maurice'),
(3, 'Dupont', 'Miguel ', '19 Rue Victor Hugo', '59300', 'Valenciennes', '0327141414', '0648492563', '0648492563', 'mdupont', 'miguel'),
(4, 'Petit', 'Gilbert', '58 Place Cuvelier', '59300', 'Valenciennes', '0328141814', '0612356984', '0612356984', 'gpetit', 'gilbert'),
(5, 'Dziouba', 'Natacha', '62 Avenue Foch', '59300', 'Valenciennes', '0327241515', '0668956321', '0668956321', 'Fedor', 'Natacha'),
(6, 'Juve', 'Paul', '5 rue Fantomas', '59300', 'Valenciennes', '0327241555', '0612122366', 'paul.juve.orange.fr', 'pjuve', 'paul'),
(7, 'Fandor', 'Jerome', '6 rue Fantomas', '59300', 'Valenciennes', '0327343444', '0615152377', 'jerome.fandor@gmail.com', 'jfandor', 'jerome'),
(8, 'Chaudard', 'Paul', '18 route de la forêt de Machecoule', '59300', 'Valenciennes', '0327343412', '0612356999', 'paul.chaudard@free.fr', 'pchaudard', 'paul'),
(9, 'Delille', 'Hélène', '18 rue de Paris', '59300', 'Valenciennes', '0327245454', '0668952323', 'helene.delille@orange.fr', 'hdelille', 'helene'),
(10, 'Pignon', 'Huguette', '42 résidence Victor Hugo', '59300', 'Valenciennes', '0327249647', '0668960607', 'hugette.pignon@free.fr', 'hpignon', 'huguette');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCommande` date NOT NULL,
  `totalHt` decimal(4,2) NOT NULL,
  `statutCommande` varchar(45) NOT NULL,
  `client_id` int(11) NOT NULL,
  `livreur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commande_client_idx` (`client_id`),
  KEY `fk_commande_livreur_idx` (`livreur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `dateCommande`, `totalHt`, `statutCommande`, `client_id`, `livreur_id`) VALUES
(1, '2019-09-08', '20.00', 'Livrée', 1, 1),
(2, '2019-09-09', '60.99', 'Livrée', 3, 2),
(3, '2019-09-11', '33.50', 'Livrée', 5, 4),
(4, '2019-09-08', '60.99', 'Livrée', 10, 5),
(5, '2019-09-14', '98.00', 'Livrée', 8, 8),
(6, '2019-09-15', '25.00', 'Livrée', 8, 7),
(7, '2019-09-15', '55.99', 'Livrée', 2, 6),
(8, '2019-10-15', '25.00', 'Livrée', 4, 4),
(9, '2019-10-15', '60.00', 'Livrée', 9, 2),
(10, '2019-09-16', '60.99', 'Livrée', 1, 8);

-- --------------------------------------------------------

--
-- Structure de la table `lignecommande`
--

DROP TABLE IF EXISTS `lignecommande`;
CREATE TABLE IF NOT EXISTS `lignecommande` (
  `commande_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  KEY `fk_ligneCommande_commande_idx` (`commande_id`),
  KEY `fk_ligneCommande_plat_idx` (`plat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignecommande`
--

INSERT INTO `lignecommande` (`commande_id`, `plat_id`, `quantite`) VALUES
(1, 9, 2),
(1, 15, 2),
(2, 2, 1),
(2, 5, 1),
(1, 13, 1),
(1, 11, 1),
(3, 7, 2),
(3, 1, 2),
(3, 12, 2),
(3, 10, 2),
(4, 11, 2),
(4, 15, 1),
(5, 7, 2),
(5, 13, 2),
(6, 6, 1),
(6, 3, 1),
(7, 5, 3),
(7, 11, 1),
(7, 16, 3),
(8, 4, 1),
(9, 1, 1),
(9, 6, 3),
(9, 10, 2),
(9, 12, 2),
(10, 3, 1),
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
,`codePostal` char(5)
,`ville` varchar(45)
,`telFixe` char(10)
,`telPortable` char(10)
,`email` varchar(45)
,`login` varchar(45)
,`mdp` varchar(45)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `liste_commandes`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `liste_commandes`;
CREATE TABLE IF NOT EXISTS `liste_commandes` (
`id` int(11)
,`dateCommande` date
,`totalHT` decimal(4,2)
,`nom` varchar(45)
,`prenom` varchar(45)
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
,`description` text
,`categorie_id` int(11)
,`platDuJour` int(11)
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
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `stock` int(11) NOT NULL,
  `prixHt` decimal(4,2) NOT NULL,
  `chef_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `platDuJour` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plat_categorie_idx` (`categorie_id`),
  KEY `fk_plat_chef_idx` (`chef_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id`, `libelle`, `description`, `stock`, `prixHt`, `chef_id`, `categorie_id`, `platDuJour`) VALUES
(1, 'Ratatouille', 'La ratatouille est une spécialité culinaire traditionnelle des cuisines niçoise, provençale, occitane et méditerranéenne, à base de ragoût mijoté de légumes méditerranéens, et d\'huile d\'olive.', 10, '15.99', 1, 1, 1),
(2, 'Cassoulet', 'Le cassoulet est une spécialité régionale du Languedoc, à base de haricots secs, généralement blancs, et de viande. À son origine, il était à base de fèves. Le cassoulet tient son nom de la cassole en terre cuite émaillée fabriquée à Issel.', 10, '14.99', 2, 1, 1),
(3, 'Tartiflette', 'La tartiflette est un gratin de pommes de terre et d\'oignons sur lequel on fait fondre du reblochon, un fromage originaire des Pays de Savoie et fabriqué dans les Aravis et le Val d\'Arly. La « tartiflette au reblochon ou reblochon de Savoie » a obtenu un Label rouge le 9 octobre 2014.', 0, '14.99', 3, 1, 0),
(4, 'Quiche Maroilles', 'S\'il y a bien un fromage réputé dans le Nord c\'est bien le Maroilles ! Trempé dans le café du matin ou dans une quiche ce fromage a du caractère.', 0, '12.00', 1, 1, 0),
(5, 'Ficèle picarde', 'La ficelle picarde est une crêpe garnie de jambon, de champignons, d\'échalotes, de crème fraîche et cuite au four.\r\n\r\nLa garniture est faite à base d\'une duxelles de champignons, de crème, d\'échalote sur une demi-tranche de jambon blanc.', 0, '12.00', 2, 1, 0),
(6, 'Paëlla', 'La paella est un plat traditionnel à base de riz rond, originaire de la région de Valence en Espagne, qui tient son nom de la poêle qui sert à la cuisiner. ', 0, '18.50', 2, 1, 0),
(7, 'Couscous Royal', 'Le couscous est servi le plus souvent avec un ragoût de légumes accompagné de viande, présenté parfois dans un plat en terre cuite traditionnel à tajine. Le plat de base consiste en l\'association du couscous (céréale) et des pois chiches (légumineuses) mais sans viande, la légumineuse jouant le rôle d\'apport protéinique. Il peut aussi être consommé seul, aromatisé ou nature, chaud ou froid, comme dessert avec du sucre ou plat d\'accompagnement.', 0, '19.99', 3, 1, 0),
(9, 'Boeuf Stroganov', 'Le bœuf Stroganov ou bœuf Stroganoff est une recette traditionnelle de la cuisine russe, à base de ragoût de viande de bœuf mariné, sauté, puis braisé avec une sauce à la crème de smetana ou de crème aigre, de moutarde, de paprika, d\'oignons, et de champignons. ', 0, '15.50', 3, 1, 0),
(10, 'Tarte tatin', 'La tarte Tatin est une tarte aux pommes caramélisées au sucre et au beurre, la pâte disposée au-dessus de la garniture. Après cuisson au four, elle est renversée sur un plat et servie tiède, comme veux la tradition, rien ne doit être rajouté sur la Tatin.', 0, '5.50', 2, 2, 0),
(11, 'Mille feuilles', 'Un mille-feuille, ou millefeuille, est une pièce de pâtisserie faite de trois couches de pâte feuilletée et deux couches de crème pâtissière. Le dessus est glacé avec du sucre glace ou du fondant. On peut y ajouter de la confiture ou des fruits.', 0, '5.50', 2, 2, 0),
(12, 'Makrout', 'Le makrout, ou makroud, également orthographié maqrouth, maqroudh, est une pâtisserie maghrébine toujours en forme de losange. C\'est une pâtisserie très populaire en Tunisie, en Algérie, au Maroc, et également en Libye et à Malte.', 0, '6.50', 2, 2, 0),
(13, 'Opéra', 'L\'opéra est une pâtisserie française constituée d’une succession de biscuit Joconde, de ganache au chocolat et de crème au beurre au café. ', 10, '5.50', 1, 2, 1),
(14, 'Vatrouchka', 'La vatrouchka est un gâteau russe traditionnel à base de fromage blanc.', 0, '7.00', 1, 2, 0),
(15, 'Syrniki', 'Les syrniki sont un plat russe, biélorusse et ukrainien. Il s\'agit d\'une sorte de beignet à base de fromage frais, de farine et d\'œufs. On l\'agrémente parfois de crème fraîche, de confiture, de miel, de compote de pommes ou encore de kissel.', 0, '5.50', 2, 2, 0),
(16, 'Placek', 'Gâteau en polonais se dit placek, et c’est souvent le nom donné à cette recette. Il s’appelle aussi Drozdzowka qui signifie brioche dans la langue de Sienkiewicz. Donc comme nous disions à vous de voir ! La texture est superbe et le dessus est une version polonaise du Streusel que les gourmands picorent avant même de mordre dans leur part. Servez-le au dessert, au gouter, avec le café et au petit déjeuné. Il se transporte sans soucis donc c’est parfait pour offrir aussi. Et oui oui, on y vient il convient au cake design (sans le streusel) et fait un excellent pain perdu… pour une seule recette cela en fait des choses !', 12, '5.50', 3, 2, 1);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `qui_quoi_quand`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `qui_quoi_quand`;
CREATE TABLE IF NOT EXISTS `qui_quoi_quand` (
`id` int(11)
,`nom` varchar(45)
,`quantite` int(11)
,`libelle` varchar(45)
,`dateCommande` date
);

-- --------------------------------------------------------

--
-- Structure de la vue `liste_clients`
--
DROP TABLE IF EXISTS `liste_clients`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `liste_clients`  AS  select `client`.`id` AS `id`,`client`.`nom` AS `nom`,`client`.`prenom` AS `prenom`,`client`.`adresse` AS `adresse`,`client`.`codePostal` AS `codePostal`,`client`.`ville` AS `ville`,`client`.`telFixe` AS `telFixe`,`client`.`telPortable` AS `telPortable`,`client`.`email` AS `email`,`client`.`login` AS `login`,`client`.`mdp` AS `mdp` from `client` ;

-- --------------------------------------------------------

--
-- Structure de la vue `liste_commandes`
--
DROP TABLE IF EXISTS `liste_commandes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `liste_commandes`  AS  select `commande`.`id` AS `id`,`commande`.`dateCommande` AS `dateCommande`,`commande`.`totalHt` AS `totalHT`,`client`.`nom` AS `nom`,`client`.`prenom` AS `prenom` from (`commande` join `client`) where (`client`.`id` = `commande`.`client_id`) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `liste_plats_du_jour`  AS  select `plat`.`libelle` AS `libelle`,`plat`.`description` AS `description`,`plat`.`categorie_id` AS `categorie_id`,`plat`.`platDuJour` AS `platDuJour` from `plat` where (`plat`.`platDuJour` = 1) order by `plat`.`categorie_id` ;

-- --------------------------------------------------------

--
-- Structure de la vue `qui_quoi_quand`
--
DROP TABLE IF EXISTS `qui_quoi_quand`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qui_quoi_quand`  AS  select `commande`.`id` AS `id`,`client`.`nom` AS `nom`,`lignecommande`.`quantite` AS `quantite`,`plat`.`libelle` AS `libelle`,`commande`.`dateCommande` AS `dateCommande` from (((`client` join `commande`) join `plat`) join `lignecommande`) where ((`plat`.`id` = `lignecommande`.`plat_id`) and (`client`.`id` = `commande`.`client_id`) and (`lignecommande`.`commande_id` = `commande`.`id`)) order by `commande`.`id` ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_livreur` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD CONSTRAINT `fk_ligneCommande_commande` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ligneCommande_plat` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `fk_plat_categorie` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_plat_chef` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
