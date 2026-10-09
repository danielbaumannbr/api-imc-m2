-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/10/2026 às 14:54
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
-- Banco de dados: `consultorio_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `idade` int(11) NOT NULL,
  `altura` decimal(4,2) NOT NULL,
  `peso` decimal(5,2) NOT NULL,
  `imc` decimal(4,2) NOT NULL,
  `status` varchar(50) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pacientes`
--

INSERT INTO `pacientes` (`id`, `nome`, `idade`, `altura`, `peso`, `imc`, `status`, `criado_em`) VALUES
(1, 'Ana Silva de Souza', 22, 1.65, 45.00, 16.53, 'Abaixo do peso normal', '2026-10-09 10:44:53'),
(2, 'Carlos Eduardo', 30, 1.75, 52.00, 16.98, 'Abaixo do peso normal', '2026-10-09 10:44:53'),
(3, 'Maria Santos', 28, 1.60, 58.00, 22.66, 'Peso normal', '2026-10-09 10:44:53'),
(4, 'João Pereira', 45, 1.80, 72.00, 22.22, 'Peso normal', '2026-10-09 10:44:53'),
(5, 'Juliana Costa', 35, 1.68, 65.00, 23.03, 'Peso normal', '2026-10-09 10:44:53'),
(6, 'Roberto Alves', 50, 1.70, 68.00, 23.53, 'Peso normal', '2026-10-09 10:44:53'),
(7, 'Beatriz Lima', 29, 1.62, 73.00, 27.82, 'Excesso de Peso', '2026-10-09 10:44:53'),
(8, 'Lucas Martins', 40, 1.78, 90.00, 28.40, 'Excesso de Peso', '2026-10-09 10:44:53'),
(10, 'Gabriel Oliveira', 52, 1.72, 105.00, 35.49, 'Obesidade', '2026-10-09 10:44:53'),
(11, 'Jeison da Silva', 30, 1.70, 90.00, 31.14, 'Obesidade', '2026-10-09 11:13:14'),
(12, 'Rodolfo Pereira', 75, 1.70, 80.00, 27.68, 'Excesso de Peso', '2026-10-09 12:34:57'),
(13, 'Gertrudes Wolf', 95, 1.40, 40.00, 20.41, 'Peso normal', '2026-10-09 12:36:14');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
