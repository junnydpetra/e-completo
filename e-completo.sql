-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Jun-2022 às 22:33
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `e-completo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` text DEFAULT NULL,
  `cpf_cnpj` varchar(50) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `tipo_pessoa` text DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `id_loja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `cpf_cnpj`, `email`, `tipo_pessoa`, `data_nasc`, `id_loja`) VALUES
(1830, 'Thales André Pereira', '13440817709', 'samuel.castro@ecompleto.com.br', 'F', '1995-04-07', 90),
(2280, 'Heloisa Valentina Fabiana Moura', '99386767660', 'heloisavalentina@ecompleto.com.br', 'F', '1984-12-12', 92),
(4802, 'Fernando Julio Ramos', '20499776461', 'fernando_julio99@ecompleto.com.br', 'F', '1999-09-11', 97),
(5789, 'Renato Ryan Lopes', '78891957615', 'renato_ryan@ecompleto.com.br', 'F', '1947-02-08', 92),
(6716, 'Raquel Nicole Moura', '36118844720', 'raquelnicole_moura@ecompleto.com.br', 'F', '1990-02-20', 98),
(6748, 'Kauê Bryan Souza', '55782338806', 'kauesouza@ecompleto.com.br', 'F', '1945-06-27', 90),
(6872, 'Samuel Emanuel Castro', '85673855800', 'samuel.castro@ecompleto.com.br', 'F', '1988-11-05', 115),
(8796, 'Emanuelly Alice Alessandra de Paula', '96446953722', 'emanuellyalice@ecompleto.com.br', 'F', '1988-01-18', 90),
(9484, 'Kevin Yuri Pedro Lopes', '95829123088', 'kevinpedro@ecompleto.com.br', 'F', '1996-06-03', 94);

-- --------------------------------------------------------

--
-- Estrutura da tabela `formas_pagamento`
--

CREATE TABLE `formas_pagamento` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descricao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `formas_pagamento`
--

INSERT INTO `formas_pagamento` (`id`, `descricao`) VALUES
(1, 'Boleto Bancário'),
(2, 'Depósito Bancário'),
(3, 'Cartão de Crédito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descricao` text DEFAULT NULL,
  `endpoint` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `gateways`
--

INSERT INTO `gateways` (`id`, `descricao`, `endpoint`) VALUES
(1, 'PAGCOMPLETO', 'https://api11.ecompleto.com.br/'),
(2, 'CIELO', 'https://api.cielo.com.br/v1/transactions/'),
(3, 'PAGSEGURO', 'https://api.pagseguro.com.br/transactions/');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lojas_gateway`
--

CREATE TABLE `lojas_gateway` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_loja` int(11) DEFAULT NULL,
  `id_gateway` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `lojas_gateway`
--

INSERT INTO `lojas_gateway` (`id`, `id_loja`, `id_gateway`) VALUES
(1, 90, 1),
(2, 92, 2),
(3, 115, 1),
(4, 98, 1),
(5, 97, 1),
(6, 94, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `valor_total` decimal(12,2) DEFAULT NULL,
  `valor_frete` decimal(12,2) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_cliente` int(11) DEFAULT NULL,
  `id_loja` int(11) DEFAULT NULL,
  `id_situacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `valor_total`, `valor_frete`, `data`, `id_cliente`, `id_loja`, `id_situacao`) VALUES
(98302, '250.74', '33.40', '2021-08-20 03:00:00', 8796, 90, 1),
(98303, '583.92', '57.85', '2021-08-23 03:00:00', 5789, 92, 1),
(98304, '97.25', '17.50', '2021-08-23 03:00:00', 6748, 90, 2),
(98305, '66.89', '22.55', '2021-08-25 03:00:00', 6872, 115, 2),
(98306, '115.90', '19.50', '2021-08-25 03:00:00', 6716, 98, 1),
(98307, '153.72', '25.50', '2021-08-25 03:00:00', 4802, 97, 1),
(98308, '87.90', '13.50', '2021-08-26 03:00:00', 9484, 94, 1),
(98309, '223.90', '28.75', '2021-08-27 03:00:00', 1830, 90, 2),
(98310, '58.90', '19.85', '2021-08-27 03:00:00', 2280, 92, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_pagamentos`
--

CREATE TABLE `pedidos_pagamentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_formapagto` int(11) DEFAULT NULL,
  `qtd_parcelas` int(11) DEFAULT NULL,
  `retorno_intermediador` text DEFAULT NULL,
  `data_processamento` text DEFAULT NULL,
  `num_cartao` varchar(50) DEFAULT NULL,
  `nome_portador` varchar(50) DEFAULT NULL,
  `codigo_verificacao` int(11) DEFAULT NULL,
  `vencimento` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidos_pagamentos`
--

INSERT INTO `pedidos_pagamentos` (`id`, `id_pedido`, `id_formapagto`, `qtd_parcelas`, `retorno_intermediador`, `data_processamento`, `num_cartao`, `nome_portador`, `codigo_verificacao`, `vencimento`) VALUES
(103013, 98302, 3, 4, NULL, NULL, '5236387041984690', 'Elisa Adriana Barbosa', 319, '2022-08'),
(103014, 98303, 3, 2, NULL, NULL, '5372472213342610', 'Renato Ryan', 848, '2022-03'),
(103015, 98304, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(103016, 98305, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(103017, 98306, 3, 1, NULL, NULL, '4929521310619600', 'Raquel Moura', 721, '2023-03'),
(103018, 98307, 3, 1, NULL, NULL, '4275824466404380', 'Fernando Julio', 482, '2022-05'),
(103019, 98308, 3, 5, NULL, NULL, '5167913943407160', 'Kevin Pedro', 441, '2022-10'),
(103020, 98309, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(103021, 98310, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_situacao`
--

CREATE TABLE `pedido_situacao` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descricao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido_situacao`
--

INSERT INTO `pedido_situacao` (`id`, `descricao`) VALUES
(1, 'Aguardando Pagamento'),
(2, 'Pagamento Identificado'),
(3, 'Pedido Cancelado');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `formas_pagamento`
--
ALTER TABLE `formas_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `lojas_gateway`
--
ALTER TABLE `lojas_gateway`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pedidos_pagamentos`
--
ALTER TABLE `pedidos_pagamentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pedido_situacao`
--
ALTER TABLE `pedido_situacao`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9485;

--
-- AUTO_INCREMENT de tabela `formas_pagamento`
--
ALTER TABLE `formas_pagamento`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `lojas_gateway`
--
ALTER TABLE `lojas_gateway`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98311;

--
-- AUTO_INCREMENT de tabela `pedidos_pagamentos`
--
ALTER TABLE `pedidos_pagamentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103022;

--
-- AUTO_INCREMENT de tabela `pedido_situacao`
--
ALTER TABLE `pedido_situacao`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
