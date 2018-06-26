CREATE TABLE `messages` (
  `id_msg` int(11) NOT NULL,
  `message` text NOT NULL,
  `expediteur` varchar(155) NOT NULL,
  `destinataire` varchar(155) NOT NULL,
  `type` varchar(55) NOT NULL,
  `date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id_msg`, `message`, `expediteur`, `destinataire`, `type`, `date`) VALUES
(1, 'test', 'ich', 'de', 'Contact Tutor', '2018-06-25');