-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 29 déc. 2018 à 11:02
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `my_quizz`
--
CREATE DATABASE IF NOT EXISTS `my_quizz` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `my_quizz`;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'Harry Potter'),
(2, '\nSigles Français'),
(3, '\nDéfinitions de mots'),
(4, '\nLes spécialités culinaires'),
(5, '\nSéries TV : les simpson - partie 1'),
(6, '\nSéries TV : les simpson - partie 2'),
(7, '\nSéries TV : Stargate SG1'),
(8, '\nSéries TV : NCIS'),
(9, '\nJeux de société'),
(10, '\nProgrammation'),
(11, '\nSigles informatiques');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20181208163930'),
('20181208164119'),
('20181208175412');

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quizz_id` int(11) NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8ADC54D5BA934BCD` (`quizz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`id`, `quizz_id`, `question`) VALUES
(1, 1, 'Dans la partie déchec, Harry Potter prend la place de :'),
(2, 1, 'Quel est le mot de passe du bureau de Dumbledore ?'),
(3, 1, 'Quel chiffre est écrit à l\'avant du Poudlard Express ?'),
(4, 1, 'Avec qui Harry est-il interdit de jouer à vie au Quidditch par Ombrage ?'),
(5, 1, 'Sur quelle(s) main(s) Harry s\'écrit-il je ne dois pas dire de mensonge pendant ses retenues avec Ombrage ?'),
(6, 1, 'Everard et Dilys sont :'),
(7, 1, 'Quel est le prénom du professeur Gobe-Planche ?'),
(8, 1, 'Quel est le nom de jeune fille de Molly Weasley ?'),
(9, 1, 'Lequel de ces Mangemorts n\'était pas présent lors de l\'invasion au ministère ?'),
(10, 1, 'En quelle année sont morts les parents de Harry Potter ?'),
(11, 2, 'Que signifie AOC ?'),
(12, 2, 'Que signifie CROUS ?'),
(13, 2, 'Que signifie FAI ?'),
(14, 2, 'Que signifie l\'INSEE ?'),
(15, 2, 'Que signifie ADN ?'),
(16, 2, 'Que signifie SAMU ?'),
(17, 2, 'Que signifie SFR ?'),
(18, 2, 'Que signifie FNAC ?'),
(19, 2, 'Que signifie RATP ?'),
(20, 2, 'Que signifie SMIC ?'),
(21, 3, 'Que signifie le verbe Enrêner ?'),
(22, 3, 'Qu\'est-ce qu\'un protocole ?'),
(23, 3, 'Que fait une langue qui est protractile ?'),
(24, 3, 'Qu\'est ce qu\'un Campanile ?'),
(25, 3, 'Que signifie le mot « gentilé » ?'),
(26, 3, 'Qu\'est ce qu\'un Pugilat ?'),
(27, 3, 'Parmi ces définitions, laquelle n\'est pas une torpille ?'),
(28, 3, 'Qu\'est ce que la déontologie ?'),
(29, 3, 'Qu\'est ce qu\'un carcan ?'),
(30, 3, 'Que signifie le terme univoque ?'),
(31, 4, 'Quelle est la spécialité de Reims ?'),
(32, 4, 'Parmi ces spécialités, laquelle ne fait pas partie du patrimoine gastronomique de la ville de Troyes ?'),
(33, 4, 'Dans quelle département trouve-t-on les lentilles du Puy ?'),
(34, 4, 'Dans quel département trouve-t-on la Teurgoule ?'),
(35, 4, 'Quel fromage ne trouve-t-on pas en Normandie ?'),
(36, 4, 'Parmi ces spécialités, laquelle ne vient pas de la région PACA ?'),
(37, 4, 'Quelle est la spécialité de Tours ?'),
(38, 4, 'Parmi ces biscuits lesquelles ne vient pas de Bretagne ?'),
(39, 4, 'Quelle est le nom de cette recette: Lamproie à la ?'),
(40, 4, 'Le Kouglof est une spécialité de :'),
(41, 5, 'Comment s\'appelle le père d\'Homer Simpson ?'),
(42, 5, 'Quel est le nom du dessin animé gore préféré de Bart et Lisa Simpson ?'),
(43, 5, 'De quel instrument joue Lisa Simpson ?'),
(44, 5, 'Comment s\'appelle le meilleur ami de Bart ?'),
(45, 5, 'Quelle est la profession de Wiggum ?'),
(46, 5, 'Qui en veut à la vie de Bart Simpson ?'),
(47, 5, 'Qui est Smithers ?'),
(48, 5, 'Quelle est la nationalité de Willy ?'),
(49, 5, 'Quelle est la nourriture préférée d\'Homer ?'),
(50, 5, 'Dans quelle ville habitent les Simpson ?'),
(51, 6, 'Qui est le créateur des Simpson ?'),
(52, 6, 'Quel est le nom de jeune fille de Marge Simpson ?'),
(53, 6, 'Que faisait le chien des Simpson avant qu\'ils l\'adoptent ?'),
(54, 6, 'Où Maud Flanders trouva t-elle la mort ?'),
(55, 6, 'Quelle réplique prononce très souvent Homer Simpson ?'),
(56, 6, 'Comment s\'appelle la bière préférée des habitat de Springfield ?'),
(57, 6, 'Comment s\'appelle la mère d\'Homer ?'),
(58, 6, 'Comment s\'appelle la ville voisine et ennemie de Springfrield ?'),
(59, 6, 'Quelle est l\'une des particularités de Moe ?'),
(60, 7, 'Où se trouve la base de commandement du SGC ?'),
(61, 7, 'Comment s\'appelle les crabes métalliques qui se reproduisent rapidement en se nourrissant de métal ?'),
(62, 7, 'Combien a y-t-il de saisons dans Stargate SG1 ?'),
(63, 7, 'Dans l\'épisode « L\'histoire sans fin » que font Jack et Teal\'c d\'assez particulier ?'),
(64, 7, 'Qui est le commandant suprême de la flotte Asgard ?'),
(65, 7, 'De qui Jolinar était-elle la compagne ?'),
(66, 7, 'Quel mot désigne les habitants de la planète Terre ?'),
(67, 7, 'De qui Sha\'are devient-elle l\'hôte ?'),
(68, 7, 'L\'alliance des quatre races est composée des Anciens, Des Asgards, des Furlings et..'),
(69, 7, 'Comment meurt Daniel Jackson avant de faire son Ascension et d\'être ensuite remplacé par Jonas Quinn ?'),
(70, 8, 'Quels sont les prénoms de Gibbs ?'),
(71, 8, 'Comment est morte Kate à la fin de la deuxième saison ?'),
(72, 8, 'Quelle est la boisson préférée d\'Abby ?'),
(73, 8, 'Qui est en réalité Jeanne Benoit, la petite amie de Tony dans la Saison 4 ?'),
(74, 8, 'De quelle grave maladie Tony DiNozzo est infectée dans la saison 2 ?'),
(75, 8, 'A part les filles, quelle est la grande passion de Tony DiNozzo ?'),
(76, 8, 'Ziva David est un ancien officier du ?'),
(77, 8, 'Lorsque Gibbs décide de démissionner à la fin de la Saison 3, quel personnage devient le chef de l\'équipe ?'),
(78, 8, 'Avec quel agent Palmer a-t-il eu une liaison ?'),
(79, 8, 'Comment Jenny Shepard trouve-t-elle la mort au court de la saison 5 ?'),
(80, 9, 'Lequel de ces navires ne se retrouvent pas dans le « Toucher-couler » ?'),
(81, 9, 'Laquelle de ces couleurs n\'existe pas au Trivial poursuite traditionnel ?'),
(82, 9, 'Laquelle de ces lettres vaut 10 points au scrabble ?'),
(83, 9, 'Quelle est la rue qui coute le moins cher au Monopoly français ?'),
(84, 9, 'Dans le monopoly d\'origine combien gagnait-on en passant par la case départ ?'),
(85, 9, 'Parmi ces pays, lequel n\'est pas présent sur le plateau du jeu « Risk » ?'),
(86, 9, 'Combien y a-t-il de flèches au Backgammon ?'),
(87, 9, 'Lequel de ces déplacement n\'existe pas aux échecs ?'),
(88, 9, 'Au jeu du Cluedo qui est professeur ?'),
(89, 9, 'Comment appelle-t-on le groupe de cartes au 1000 bornes qui comprend : As du volant, camion-citerne, increvable, prioritaire....'),
(90, 10, 'Lequel de ces langages ne peut pas être exécuté côté serveur ?'),
(91, 10, 'Lequel de ces langages a la vitesse d\'éxécution la plus rapide ?'),
(92, 10, 'Quel est l\'animal qui représente habituellement le langage PHP ?'),
(93, 10, 'Lequel de ces systèmes d\'exploitation est sous environnement UNIX ?'),
(94, 10, 'Lequel de ces langages est reconnu pour sa grande portabilité et sa flexibilité ?'),
(95, 10, 'Laquelle de ces propositions n\'est pas un langage de programmation ?'),
(96, 10, 'Quelle commande permet de planifier l\'éxécution de tâches sous UNIX ?'),
(97, 10, 'Quel est le composant principal d\'un ordinateur, sur lequel sont greffés les autres ?'),
(98, 10, 'Quel port externe n\'existe pas sur un ordinateur ?'),
(99, 10, 'Quel nom d\'attaque n\'existe pas dans le domaine de la sécurité ?'),
(100, 11, 'Que signifie HTTP ?'),
(101, 11, 'Que signifie SSL ?'),
(102, 11, 'Que signifie FTP ?'),
(103, 11, 'Laquelle de ces propositions n\'est pas un SGBDR ?'),
(104, 11, 'Que signifie WWW ?'),
(105, 11, 'Que signifie URI ?'),
(106, 11, 'Que signifie IP ?'),
(107, 11, 'Qu\'est-ce que peut évoquer REMOTE_ADDR ?'),
(108, 11, 'Laquelle de ces propositions n\'est pas une IP correcte ?'),
(109, 11, 'Laquelle de ces propositions n\'est pas une MAC correcte ?');

-- --------------------------------------------------------

--
-- Structure de la table `quizz`
--

DROP TABLE IF EXISTS `quizz`;
CREATE TABLE IF NOT EXISTS `quizz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7C77973DBCF5E72D` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `quizz`
--

INSERT INTO `quizz` (`id`, `categorie_id`, `title`, `description`, `image`) VALUES
(1, 1, 'Harry Potter', 'Incolable sur Harry potter ? Venez le prouver dans ce quizz !', 'https://www.lapiramideopticas.com/wp-content/uploads/2016/09/Font-Harry-Potter-Logo.jpg'),
(2, 2, 'Sigles Français', 'Un quizz sur les sigles Français que vous voyez tout les jours !', 'https://i.imgur.com/GO9vm2t.png'),
(3, 3, 'Définitions de mots', 'Vous avez mangé un dico étant enfant ? Venez le réciter dans ce quizz !', 'https://www.babelio.com/users/AVT_Larousse_9692.jpg'),
(4, 4, 'Les spécialités culinaires', 'Incollable sur les émissions de cuisine ? Vous rêvez de Gordon Ramsey ? Prouvez que vous avez l\'âme d\'un chef en jouant à ce quizz !', 'https://tel.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FTEL.2EeventSeason.2F2018.2F01.2F09.2Fbe338f62-bed0-4294-82d0-9628e373fd3c.2Ejpeg/1150x322/quality/80/saison-5.jpg'),
(5, 5, 'Séries TV : les simpson - partie 1', 'Rejoignez les aventures des Simpson dans ce quizz en deux parties !', 'https://tel.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FTEL.2Enews.2F2018.2F01.2F11.2Fd4837e90-2482-4b7d-9f70-e48447484219.2Ejpeg/1150x495/crop-from/top/les-simpson-preparent-un-episode-en-direct.jpg'),
(6, 6, 'Séries TV : les simpson - partie 2', 'Suite et fin du quizz sur les Simpson', 'https://static-media.fxx.com/img/FX_Networks_-_FXX/359/435/Simpsons_06_15_P5_640x360_312576067969.jpg'),
(7, 7, 'Séries TV : Stargate SG1', 'Rejoignez Tilk et son équipe au sein de ce quizz sur l\'univers de Stargate SG1', 'https://cdn1us.denofgeek.com/sites/denofgeekus/files/styles/main_wide/public/stargate_sg-1_cast.jpg?itok=EucgrKA3'),
(8, 8, 'Séries TV : NCIS', 'Vous connaissez la vie de Dinozo par coeur ? Ce quizz est fait pour vous !', 'https://lightbox-prod.imgix.net/images/assets/100091980-1061203-NCIS_large.jpg'),
(9, 9, 'Jeux de société', 'Les journées chez mamie vous manquent ? Tentez de répondre aux questions sur les jeux de société de votre enfance !', 'http://www.mamanvogue.fr/wp-content/uploads/2016/07/jeux-de-societe-740x380.jpg'),
(10, 10, 'Programmation', 'if($programmeur){echo: \"Ce quizz est génial !\";}', 'https://i.ytimg.com/vi/4TstXRDGcM0/maxresdefault.jpg'),
(11, 11, 'Sigles informatiques', 'Vous êtes un nerd ? Venez tester vos connaissances dans ce quizz !', 'http://i0.wp.com/menututo.com/siteweb_mt_ctnu/uploads/2015/04/SiglesInformatiques-e1428334903407.png?fit=310%2C200');

-- --------------------------------------------------------

--
-- Structure de la table `reponses`
--

DROP TABLE IF EXISTS `reponses`;
CREATE TABLE IF NOT EXISTS `reponses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `reponse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reponse_expected` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1E512EC61E27F6BF` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reponses`
--

INSERT INTO `reponses` (`id`, `question_id`, `reponse`, `reponse_expected`) VALUES
(1, 1, 'Un fou', 1),
(2, 1, 'Une tour', 0),
(3, 1, 'Un pion', 0),
(4, 2, 'Sorbet Citron', 1),
(5, 2, 'Chocogrenouille', 0),
(6, 2, 'Dragées Surprise', 0),
(7, 3, '5972', 1),
(8, 3, '4732', 0),
(9, 3, '6849', 0),
(10, 4, 'George Weasley', 1),
(11, 4, 'Fred Weasley', 0),
(12, 4, 'Drago Malefoy', 0),
(13, 5, 'La droite', 1),
(14, 5, 'La gauche', 0),
(15, 5, 'Les deux', 0),
(16, 6, 'Deux directeurs de Poudlard', 1),
(17, 6, 'Deux amants célèbres de Poudlard', 0),
(18, 6, 'Deux préfets en chef', 0),
(19, 7, 'Wilhelmina', 1),
(20, 7, 'Libellia', 0),
(21, 7, 'Carlotta', 0),
(22, 8, 'Prewett', 1),
(23, 8, 'Foist', 0),
(24, 8, 'Jugson', 0),
(25, 9, 'Rowle', 1),
(26, 9, 'Crabbe', 0),
(27, 9, 'Goyle', 0),
(28, 10, '1981', 1),
(29, 10, '1982', 0),
(30, 10, '1983', 0),
(31, 11, 'Appellation d\'Origine Contrôlée', 1),
(32, 11, 'Aliment Original Contrôlé', 0),
(33, 11, 'Association des Obligations des Consommateurs', 0),
(34, 12, 'Centre Régional des Oeuvres Universitaires et Scolaires', 1),
(35, 12, 'Centre de Restauration et d\'Organisation Universitaire et Secondaire', 0),
(36, 12, 'Comité Régional pour l\'Organisation Universitaire et Scolaire', 0),
(37, 13, 'Fournisseur d\'Accès Internet', 1),
(38, 13, 'Fournisseur d\'Alimention et d\'Informatique', 0),
(39, 13, 'Fédération à l\'Accès Informatique', 0),
(40, 14, 'Institut National de la Statistique et des Études Économiques', 1),
(41, 14, 'Institut National de Service pour l\'Économie et l\'Enseignement', 0),
(42, 14, 'Institution Nationalisé pour les Statistiques des Établissements Économiques', 0),
(43, 15, 'Acide Desoxyriboucléique', 1),
(44, 15, 'Atome Desoxygénénucléique', 0),
(45, 15, 'Aspérité Desoxygéné et Nucléanbique', 0),
(46, 16, 'Service d\'Aide Médicale Urgente', 1),
(47, 16, 'Service d\'Ambulance et de Médecine d\'Urgence', 0),
(48, 16, 'Service Auxiliaire Mutualisé d\'Urgence', 0),
(49, 17, 'Société Française de Radiotéléphone', 1),
(50, 17, 'Société Francophone des Réseaux', 0),
(51, 17, 'Société Financière et Radio-téléphonique', 0),
(52, 18, 'Fédération Nationale d\'Achat des Cadres', 1),
(53, 18, 'Franchise Nationale d\'Art et de Culture', 0),
(54, 18, 'Firme Nationale d\'Achat Culturel', 0),
(55, 19, 'Régie autonome des transports parisiens', 1),
(56, 19, 'Reseaux automatisé des transports parisiens', 0),
(57, 19, 'Régie automatique des transports de Paris', 0),
(58, 20, 'Salaire Minimum Interprofessionnel de Croissance', 1),
(59, 20, 'Salaire Médian d\'Intérêt Communautaire', 0),
(60, 20, 'Salaire Moyen d\'Insertion de Croissance', 0),
(61, 21, 'Mettre des rênes', 1),
(62, 21, 'Etre dépendent de quelque chose', 0),
(63, 21, 'Etre à l\'origine d\'un fait', 0),
(64, 22, 'Un ensemble de règles établies', 1),
(65, 22, 'Le fait de savoir parler plusieurs langues', 0),
(66, 22, 'Une série de chiffre', 0),
(67, 23, 'Elle peut être étirée vers l\'avant', 1),
(68, 23, 'Elle peut se diviser en deux', 0),
(69, 23, 'Elle peut s\'enrouler sur elle même', 0),
(70, 24, 'Un cloché', 1),
(71, 24, 'Une maison de campagne', 0),
(72, 24, 'Une forteresse', 0),
(73, 25, 'C\'est le nom des habitants d\'un lieu', 1),
(74, 25, 'C\'est un synonyme du mot gentillesse', 0),
(75, 25, 'C\'est le nom du mouvement que l\'on fait avec un tournevis', 0),
(76, 26, 'Un combat au corps à corps', 1),
(77, 26, 'Une demande d\'audience', 0),
(78, 26, 'Une sorte de dague', 0),
(79, 27, 'Une espèce de calamar', 1),
(80, 27, 'Un poisson qui ressemble à une raie', 0),
(81, 27, 'Un engin automoteur sous-marin', 0),
(82, 28, 'Le code de conduite d\'une profession', 1),
(83, 28, 'Une partie de la médecine qui étudie la peau', 0),
(84, 28, 'L\'étude des facultés psychiques des dauphins', 0),
(85, 29, 'Une contrainte qui entrave la liberté', 1),
(86, 29, 'Une sorte de montre', 0),
(87, 29, 'Une pièce de tissu', 0),
(88, 30, 'Qui n\'a qu\'un sens', 1),
(89, 30, 'Qui a plusieurs sens', 0),
(90, 30, 'Qui est sans contrainte', 0),
(91, 31, 'Le biscuit rose', 1),
(92, 31, 'Le trou rémois', 0),
(93, 31, 'Le cidre rosé', 0),
(94, 32, 'La pâte de fruit à la mirabelle', 1),
(95, 32, 'Le chaource', 0),
(96, 32, 'L\'andouillette', 0),
(97, 33, 'Haute Loire', 1),
(98, 33, 'Allier', 0),
(99, 33, 'Cantal', 0),
(100, 34, 'Le Calvados', 1),
(101, 34, 'Le cantal', 0),
(102, 34, 'L\'ardèche', 0),
(103, 35, 'Saint Félicien', 1),
(104, 35, 'Livarot', 0),
(105, 35, 'Neufchâtel', 0),
(106, 36, 'Le cassoulet', 1),
(107, 36, 'La tapenade', 0),
(108, 36, 'Les calissons', 0),
(109, 37, 'Les rillons', 1),
(110, 37, 'Le confis', 0),
(111, 37, 'Le magret', 0),
(112, 38, 'Les madeleines', 1),
(113, 38, 'Les craquelins', 0),
(114, 38, 'Les gavottes', 0),
(115, 39, 'Bordelaise', 1),
(116, 39, 'Toulousaine', 0),
(117, 39, 'Marseillaise', 0),
(118, 40, 'L\'Alsace', 1),
(119, 40, 'La lorraine', 0),
(120, 40, 'La Franche comté', 0),
(121, 41, 'Abraham', 1),
(122, 41, 'Georges', 0),
(123, 41, 'Francis', 0),
(124, 42, 'Itchy et Scratchy show', 1),
(125, 42, 'Les tronçonneuses folles', 0),
(126, 42, 'Cat and dog', 0),
(127, 43, 'Du saxophone', 1),
(128, 43, 'De la trompette', 0),
(129, 43, 'De la clarinette', 0),
(130, 44, 'Milhouse', 1),
(131, 44, 'Martin', 0),
(132, 44, 'Ralph', 0),
(133, 45, 'C\'est le chef de la police', 1),
(134, 45, 'Il est vendeur de BD', 0),
(135, 45, 'C\'est le vrai nom de l\'homme Abeille', 0),
(136, 46, 'Tahiti Bob', 1),
(137, 46, 'Krusty le clown', 0),
(138, 46, 'L\'homme Abeille', 0),
(139, 47, 'L\'assistant du président de la centrale nucléaire', 1),
(140, 47, 'Un collègue d\'Homer Simpson', 0),
(141, 47, 'Le président de la centrale nucléaire où travaille Homer', 0),
(142, 48, 'Ecossais', 1),
(143, 48, 'Canadien', 0),
(144, 48, 'Australien', 0),
(145, 49, 'Les donuts', 1),
(146, 49, 'Les pizzas', 0),
(147, 49, 'Les hamburgers', 0),
(148, 50, 'Springfield', 1),
(149, 50, 'Sheffield', 0),
(150, 50, 'Shortfield', 0),
(151, 51, 'Matt Groening', 1),
(152, 51, 'Seth Mac Farlane', 0),
(153, 51, 'Glenn Eichler', 0),
(154, 52, 'Bouvier', 1),
(155, 52, 'Polsen', 0),
(156, 52, 'March', 0),
(157, 53, 'De la course de lévriers', 1),
(158, 53, 'C\'était un chien d\'aveugle', 0),
(159, 53, 'Il était chien policer', 0),
(160, 54, 'Dans les gradins d\'un stade', 1),
(161, 54, 'Elle disparaît en mer', 0),
(162, 54, 'Dans la maison des Simpson', 0),
(163, 55, 'Oh punaise!', 1),
(164, 55, 'Oh mon dieu!', 0),
(165, 55, 'Oh bravo!', 0),
(166, 56, 'La Duff', 1),
(167, 56, 'La Kronekein', 0),
(168, 56, 'La Spiner', 0),
(169, 57, 'Mona', 1),
(170, 57, 'Gina', 0),
(171, 57, 'Dina', 0),
(172, 58, 'Shelbyville', 1),
(173, 58, 'Summerville', 0),
(174, 58, 'Stringville', 0),
(175, 59, 'Il a des tendances suicidaires', 1),
(176, 59, 'Il est ventriloque', 0),
(177, 59, 'Il vole dans les supermarchés', 0),
(178, 60, 'Dans le Colorado', 1),
(179, 60, 'Dans l\'Arizona', 0),
(180, 60, 'Dans l\'Utah', 0),
(181, 61, 'Les réplicateurs', 1),
(182, 61, 'Les réplicants', 0),
(183, 61, 'Les répliqueurs', 0),
(184, 62, '10 Saisons', 1),
(185, 62, '8 Saisons', 0),
(186, 62, '12 Saisons', 0),
(187, 63, 'Ils font du golf avec la porte des étoiles', 1),
(188, 63, 'Ils jouent au tennis dans les couloirs de la base', 0),
(189, 63, 'Ils font du camping dans la base', 0),
(190, 64, 'Thor', 1),
(191, 64, 'Loki', 0),
(192, 64, 'Penegal', 0),
(193, 65, 'Martouf', 1),
(194, 65, 'Selmak', 0),
(195, 65, 'Malek', 0),
(196, 66, 'Les Tau\'ri', 1),
(197, 66, 'Les Tok\'ra', 0),
(198, 66, 'Les Oris', 0),
(199, 67, 'Amonet', 1),
(200, 67, 'Amaterasu', 0),
(201, 67, 'Hathor', 0),
(202, 68, 'Des Nox', 1),
(203, 68, 'Des Ori', 0),
(204, 68, 'Des Unas', 0),
(205, 69, 'Il absorbe une dose de radiation', 1),
(206, 69, 'Il est tué par Apophis', 0),
(207, 69, 'Il tombe dans un ravin', 0),
(208, 70, 'Leroy Jethro', 1),
(209, 70, 'Jack Lenny', 0),
(210, 70, 'Lance Jimmy', 0),
(211, 71, 'D\'une balle dans la tête', 1),
(212, 71, 'Lors d\'une explosion', 0),
(213, 71, 'En tombant d\'un toit', 0),
(214, 72, 'Un soda caféine', 1),
(215, 72, 'Un diabolo menthe', 0),
(216, 72, 'Un thé glacé', 0),
(217, 73, 'La fille d\'un trafiquant d\'armes', 1),
(218, 73, 'Une espionne russe', 0),
(219, 73, 'Un agent double de la CIA', 0),
(220, 74, 'La peste', 1),
(221, 74, 'La tuberculose', 0),
(222, 74, 'Le cholera', 0),
(223, 75, 'Le cinéma', 1),
(224, 75, 'Le base-ball', 0),
(225, 75, 'Les voitures de courses', 0),
(226, 76, 'Mossad', 1),
(227, 76, 'KGB', 0),
(228, 76, 'NSA', 0),
(229, 77, 'Tony', 1),
(230, 77, 'Ziva', 0),
(231, 77, 'McGee', 0),
(232, 78, 'Lee', 1),
(233, 78, 'Ziva', 0),
(234, 78, 'Kate', 0),
(235, 79, 'Lors d\'une fusillade', 1),
(236, 79, 'Lors d\'un accident de voiture', 0),
(237, 79, 'Lors d\'une explosion', 0),
(238, 80, 'Un cuirassé', 1),
(239, 80, 'Un sous-marin', 0),
(240, 80, 'Un porte-avions', 0),
(241, 81, 'Rouge', 1),
(242, 81, 'Orange', 0),
(243, 81, 'Vert', 0),
(244, 82, 'K', 1),
(245, 82, 'J', 0),
(246, 82, 'Q', 0),
(247, 83, 'Boulevard de Belleville', 1),
(248, 83, 'Rue de Vaugirard', 0),
(249, 83, 'Rue Lecourbe', 0),
(250, 84, '20 000 francs', 1),
(251, 84, '2 000 francs', 0),
(252, 84, '50 000 francs', 0),
(253, 85, 'Russie', 1),
(254, 85, 'Ukraine', 0),
(255, 85, 'Chine', 0),
(256, 86, '24', 1),
(257, 86, '12', 0),
(258, 86, '32', 0),
(259, 87, 'Le pool', 1),
(260, 87, 'Le roque', 0),
(261, 87, 'En passant', 0),
(262, 88, 'Violet', 1),
(263, 88, 'Olive', 0),
(264, 88, 'Orange', 0),
(265, 89, 'Les bottes', 1),
(266, 89, 'Les parades', 0),
(267, 89, 'Les attaques', 0),
(268, 90, 'HTML', 1),
(269, 90, 'JavaScript', 0),
(270, 90, 'PHP', 0),
(271, 91, 'C', 1),
(272, 91, 'PHP', 0),
(273, 91, 'Python', 0),
(274, 92, 'Elephant', 1),
(275, 92, 'Serpent', 0),
(276, 92, 'Souris', 0),
(277, 93, 'Debian', 1),
(278, 93, 'Windows', 0),
(279, 93, 'Java', 0),
(280, 94, 'Java', 1),
(281, 94, 'Python', 0),
(282, 94, 'C++', 0),
(283, 95, 'Saphir', 1),
(284, 95, 'Ruby', 0),
(285, 95, 'Perl', 0),
(286, 96, 'crontab', 1),
(287, 96, 'task', 0),
(288, 96, 'run', 0),
(289, 97, 'Carte mère', 1),
(290, 97, 'Processeur', 0),
(291, 97, 'Carte graphique', 0),
(292, 98, 'VGE', 1),
(293, 98, 'HDMI', 0),
(294, 98, 'USB', 0),
(295, 99, 'MS-DOS 95', 1),
(296, 99, 'DDOS', 0),
(297, 99, 'Bruteforce', 0),
(298, 100, 'Hyper Text Transfer Protocol', 1),
(299, 100, 'Host Type Text Protocol', 0),
(300, 100, 'Host Trame Transfer Protocol', 0),
(301, 101, 'Secure Socket Layer', 1),
(302, 101, 'Socket Same Loundge', 0),
(303, 101, 'Security Socket Law', 0),
(304, 102, 'File Transfer Protocol', 1),
(305, 102, 'Film Transfert Processus', 0),
(306, 102, 'File Trame Pratical', 0),
(307, 103, 'CSV', 1),
(308, 103, 'MySQL', 0),
(309, 103, 'MongoDB', 0),
(310, 104, 'World Wide Web', 1),
(311, 104, 'Word Wild Web', 0),
(312, 104, 'Warp World Web', 0),
(313, 105, 'Uniform Resource Identifier', 1),
(314, 105, 'Ulimit Redirection Id', 0),
(315, 105, 'Unity Range Information', 0),
(316, 106, 'Internet Protocol', 1),
(317, 106, 'Internic Procedural', 0),
(318, 106, 'Internal Processus', 0),
(319, 107, 'Une Adresse IP', 1),
(320, 107, 'Une Adresse MAC', 0),
(321, 107, 'Une Prise de contrôle', 0),
(322, 108, '128.256.0.1', 1),
(323, 108, '127.0.0.1', 0),
(324, 108, '255.255.0.0', 0),
(325, 109, 'EX:3F:7E:E6:2D:58', 1),
(326, 109, 'EA:9D:00:5B:CE:FF', 0),
(327, 109, 'AA:BB:CC:DD:EE:FF', 0);

-- --------------------------------------------------------

--
-- Structure de la table `results`
--

DROP TABLE IF EXISTS `results`;
CREATE TABLE IF NOT EXISTS `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quizz_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9FA3E414BA934BCD` (`quizz_id`),
  KEY `IDX_9FA3E414A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `results`
--

INSERT INTO `results` (`id`, `quizz_id`, `user_id`, `score`, `created_at`) VALUES
(18, 1, 59, 6, '2018-12-12 10:04:42');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL COMMENT '(DC2Type:json_array)',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D6495F37A13B` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `roles`, `token`) VALUES
(59, 'Yunshu', 'Yunshu@Yunshu.Yunshu', '$2y$13$keao.tRHoLHI7wM2OxLTuOp3E0Y4NsMzEhjUcgKLK/Ip5sjZz1uPi', '[\"ROLE_ADMIN\"]', '2298cb032521443578b2d69e5221c0653a9407fe2be6c6d0840ed477df1c94a9e1c63476b0708095b899373471a289f2f89c9d68a62e858df23d18735d09d6e83f59715394fee9f15e1e78dc044482bc35a93e2649a5d3df45069fbc544880f8f950e46c0f1c39bf16831b98d70a82f3'),
(63, 'Hello@Hello.Hello', 'Hello@Hello.Hello', '$2y$13$t6NztBUcLWtRLnJd3kyJl.QFxQRquCNI6cS14XoQCiWZ6ZiH9CBvK', '[\"ROLE_USER\"]', '7bac87ab1ab2ace2776d40b14edf16cb15cd9fb108139c79339e4a2c0b410582a0abaecfeab9afaf8184b4f4f7150e8a629a1252e7bd14c063ca0bd18ba4b064f20c615ac7929141e9751c697c98213f7835e982023d4acb08d29296507823b3cd24eee37d15e7ac4262b85840aad24f');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `FK_8ADC54D5BA934BCD` FOREIGN KEY (`quizz_id`) REFERENCES `quizz` (`id`);

--
-- Contraintes pour la table `quizz`
--
ALTER TABLE `quizz`
  ADD CONSTRAINT `FK_7C77973DBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `reponses`
--
ALTER TABLE `reponses`
  ADD CONSTRAINT `FK_1E512EC61E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Contraintes pour la table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `FK_9FA3E414A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_9FA3E414BA934BCD` FOREIGN KEY (`quizz_id`) REFERENCES `quizz` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
