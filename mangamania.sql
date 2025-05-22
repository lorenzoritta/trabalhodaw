-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/05/2025 às 18:34
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mangamania`
--
CREATE DATABASE IF NOT EXISTS `mangamania` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mangamania`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome`) VALUES
(1, 'aventura');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `endereco` varchar(30) NOT NULL,
  `email` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `usuario`, `endereco`, `email`, `senha`) VALUES
(3, 'nome', '', '', 'email@email.com', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagem`
--

CREATE TABLE `imagem` (
  `id_imagem` int(11) NOT NULL,
  `id_manga` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `imagem`
--

INSERT INTO `imagem` (`id_imagem`, `id_manga`, `nome`) VALUES
(1, 14, '4.jpg'),
(2, 17, '4.jpg'),
(3, 19, '4.jpg'),
(4, 20, '4.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mangas`
--

CREATE TABLE `mangas` (
  `id_manga` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `editora` varchar(30) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `autor` varchar(20) NOT NULL,
  `preco` varchar(20) NOT NULL,
  `data_lancamento` varchar(20) NOT NULL,
  `pais_origem` varchar(20) NOT NULL,
  `num_volumes` varchar(20) NOT NULL,
  `ofertar` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mangas`
--

INSERT INTO `mangas` (`id_manga`, `nome`, `editora`, `descricao`, `autor`, `preco`, `data_lancamento`, `pais_origem`, `num_volumes`, `ofertar`) VALUES
(20, 'attack on titan', 'Kodansha', 'a', 'Hajime Isayama', '99.99', '2007-04-07', 'japao', '10', '0');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mangas_has_vendas`
--

CREATE TABLE `mangas_has_vendas` (
  `id_mangas_has_venda` int(11) NOT NULL,
  `preco` varchar(30) NOT NULL,
  `quantidade` varchar(30) NOT NULL,
  `id_vendas` int(11) NOT NULL,
  `id_manga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id_vendas` int(11) NOT NULL,
  `status_venda` varchar(30) NOT NULL,
  `data_venda` varchar(30) NOT NULL,
  `forma_pagamento` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `imagem`
--
ALTER TABLE `imagem`
  ADD PRIMARY KEY (`id_imagem`);

--
-- Índices de tabela `mangas`
--
ALTER TABLE `mangas`
  ADD PRIMARY KEY (`id_manga`);

--
-- Índices de tabela `mangas_has_vendas`
--
ALTER TABLE `mangas_has_vendas`
  ADD PRIMARY KEY (`id_mangas_has_venda`),
  ADD KEY `id_vendas` (`id_vendas`),
  ADD KEY `id_manga` (`id_manga`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id_vendas`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `imagem`
--
ALTER TABLE `imagem`
  MODIFY `id_imagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `mangas`
--
ALTER TABLE `mangas`
  MODIFY `id_manga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `mangas_has_vendas`
--
ALTER TABLE `mangas_has_vendas`
  MODIFY `id_mangas_has_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id_vendas` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `mangas_has_vendas`
--
ALTER TABLE `mangas_has_vendas`
  ADD CONSTRAINT `mangas_has_vendas_ibfk_1` FOREIGN KEY (`id_vendas`) REFERENCES `vendas` (`id_vendas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mangas_has_vendas_ibfk_2` FOREIGN KEY (`id_manga`) REFERENCES `mangas` (`id_manga`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
