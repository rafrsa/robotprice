-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 21-Nov-2018 às 17:24
-- Versão do servidor: 10.1.36-MariaDB
-- versão do PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `robotprice`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `produto_id` int(11) NOT NULL,
  `produto_provedor` varchar(500) NOT NULL,
  `produto_nome` varchar(1500) NOT NULL,
  `produto_url` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`produto_id`, `produto_provedor`, `produto_nome`, `produto_url`) VALUES
(1, 'submarino', 'hot wheels garagem', 'https://www.submarino.com.br/produto/133805849/carrinho-hot-wheels-ultimate-garagem-ftb69-mattel?WT.srch=1&epar=bp_pl_00_go_g35145&gclid=CjwKCAiAodTfBRBEEiwAa1hauoekTen6T_mJsgzEgUwfFKjJ33aQVWEzp0IsYk7gK9nydd8kgfmOBBoCR8UQAvD_BwE&opn=XMLGOOGLE&sellerId=00776574000660');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_variacoes`
--

CREATE TABLE `produtos_variacoes` (
  `produto_id` int(11) NOT NULL,
  `valor_atual` decimal(10,2) NOT NULL,
  `ultima_verificacao` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos_variacoes`
--

INSERT INTO `produtos_variacoes` (`produto_id`, `valor_atual`, `ultima_verificacao`) VALUES
(1, '699.00', '2018-11-19 08:16:27'),
(1, '874.00', '2018-11-21 12:19:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`produto_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `produto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
