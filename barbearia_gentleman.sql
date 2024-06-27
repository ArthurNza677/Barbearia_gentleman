-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Jun-2024 às 14:36
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `barbearia_gentleman`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE `agenda` (
  `cod` int(11) NOT NULL,
  `data` date NOT NULL,
  `horario` varchar(10) NOT NULL,
  `cod_barbeiro` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `cod_servico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `agenda`
--

INSERT INTO `agenda` (`cod`, `data`, `horario`, `cod_barbeiro`, `cod_usuario`, `cod_servico`) VALUES
(4, '2024-01-01', '08:00', 9, 83, 2),
(5, '2024-01-01', '12:00', 9, 79, 2),
(6, '2024-01-01', '08:00', 10, 79, 2),
(7, '2024-01-01', '08:00', 11, 79, 2),
(8, '2024-01-01', '08:00', 12, 79, 3),
(9, '2024-06-21', '08:00', 9, 79, 2),
(10, '2024-01-01', '10:00', 11, 79, 2),
(11, '2024-01-01', '09:00', 10, 79, 4),
(16, '2024-01-01', '10:00', 9, 83, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `barbeiro`
--

CREATE TABLE `barbeiro` (
  `cod` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `barbeiro`
--

INSERT INTO `barbeiro` (`cod`, `nome`) VALUES
(9, 'Edgar'),
(10, 'George'),
(11, 'Marcony'),
(12, 'Mathias');

-- --------------------------------------------------------

--
-- Estrutura da tabela `corte`
--

CREATE TABLE `corte` (
  `cod` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `valor` varchar(15) DEFAULT NULL,
  `barbeiro` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `data`
--

CREATE TABLE `data` (
  `cod` int(11) NOT NULL,
  `dia` date NOT NULL,
  `mês` date NOT NULL,
  `hora` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `desenvolvedor`
--

CREATE TABLE `desenvolvedor` (
  `rg` varchar(15) DEFAULT NULL,
  `cod` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `desenvolvedor`
--

INSERT INTO `desenvolvedor` (`rg`, `cod`, `nome`, `telefone`, `senha`, `email`, `login`, `cpf`, `endereco`) VALUES
('4', 4, '4', '4', '4', '4@nada.com', '4', '4', '4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `nome` varchar(100) DEFAULT NULL,
  `cod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`nome`, `cod`) VALUES
('Corte de CabeloㅤㅤㅤㅤㅤㅤㅤㅤR$35,00', 2),
('Barba ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ ㅤR$25,00', 3),
('Sobrancelhaㅤㅤ                                  R$10,00', 4),
('Pigmentaçãoㅤ  ㅤ                              R$80,00', 5),
('Hidratação ㅤ                                    ㅤR$40,00', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `cpf` varchar(15) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cod` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `rg` varchar(15) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`cpf`, `endereco`, `cod`, `nome`, `rg`, `telefone`, `senha`, `email`, `login`, `foto`) VALUES
('w', 'w', 75, '1', 'w', 'w', '15', 'wwww@alua', '15', 'usuario-97f2f6ae4bb186dcb6b04477457b6aa5.png'),
('1', '1', 79, '1', '1', '1', '1', '1@aseda', '1', 'usuario-634030d23f4ad39f3fc3b57b5892ecc8.jpg'),
('11', '1', 82, '8000', '1', '1', '1', '1@aseda', '1', 'usuario-d871a6112fe61aec2444fd97464bfae6.jpg'),
('3', '3', 83, '99', '3', '3', '3', '3@asdasd', '3', 'usuario-ea3770b0a77f3fee929662bce1460686.png');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `barbeiro_agenda` (`cod_barbeiro`),
  ADD KEY `servico_agenda` (`cod_servico`),
  ADD KEY `usuario_agenda` (`cod_usuario`);

--
-- Índices para tabela `barbeiro`
--
ALTER TABLE `barbeiro`
  ADD PRIMARY KEY (`cod`);

--
-- Índices para tabela `corte`
--
ALTER TABLE `corte`
  ADD PRIMARY KEY (`cod`);

--
-- Índices para tabela `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`cod`);

--
-- Índices para tabela `desenvolvedor`
--
ALTER TABLE `desenvolvedor`
  ADD PRIMARY KEY (`cod`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`cod`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cod`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `barbeiro`
--
ALTER TABLE `barbeiro`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `data`
--
ALTER TABLE `data`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `desenvolvedor`
--
ALTER TABLE `desenvolvedor`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `barbeiro_agenda` FOREIGN KEY (`cod_barbeiro`) REFERENCES `barbeiro` (`cod`),
  ADD CONSTRAINT `servico_agenda` FOREIGN KEY (`cod_servico`) REFERENCES `servico` (`cod`),
  ADD CONSTRAINT `usuario_agenda` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod`);

--
-- Limitadores para a tabela `corte`
--
ALTER TABLE `corte`
  ADD CONSTRAINT `corte_ibfk_1` FOREIGN KEY (`cod`) REFERENCES `servico` (`cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
