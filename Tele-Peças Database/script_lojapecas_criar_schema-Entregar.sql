-- -----------------------------------------------------
-- CRIANDO O BANCO: telepecas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `telepecas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;

USE `telepecas` ;

-- -----------------------------------------------------
-- Table `telepecas`.`pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`pessoas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `fone` VARCHAR(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL UNIQUE,
  `complemento` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telepecas`.`pessoaFisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`pessoaFisica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(14) NOT NULL,
  `rg` VARCHAR(14) NULL,
  `nascimento` DATE NOT NULL,
  `nacionalidade` VARCHAR(20) NOT NULL,
  `sexo` VARCHAR(9) NOT NULL,
  `profissao` VARCHAR(20) NOT NULL,
  `pessoas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pessoaFisica_pessoas` FOREIGN KEY (`pessoas_id`) REFERENCES `telepecas`.`pessoas` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `telepecas`.`pessoaJuridica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`pessoaJuridica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(18) NOT NULL,
  `ie` VARCHAR(15) NULL,
  `dataFundacao` DATE NOT NULL,
  `fantasia` VARCHAR(45) NOT NULL,
  `ramoAtividade` VARCHAR(20) NOT NULL,
  `pessoas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pessoaJuridica_pessoas1` FOREIGN KEY (`pessoas_id`) REFERENCES `telepecas`.`pessoas` (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telepecas`.`funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`funcionarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `matricula` INT NOT NULL UNIQUE,
  `funcao` VARCHAR(20) NOT NULL,
  `setor` VARCHAR(20) NOT NULL,
  `salario` DECIMAL(10,2) NOT NULL,
  `desde` DATE NOT NULL,
  `saida` DATE NULL,
  `pessoasfisica_id` INT NOT NULL,
  PRIMARY KEY (`id`),
CONSTRAINT `fk_funcionarios_pessoaFisica` FOREIGN KEY (`pessoasfisica_id`) REFERENCES `telepecas`.`pessoaFisica` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `telepecas`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `canal` VARCHAR(50) NOT NULL,
  `desde` DATE NOT NULL,
  `ultimaCompra` DATE NULL,
  `pessoaJuridica_id` INT NULL,
  `pessoaFisica_id` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pessoaFisica_clientes` FOREIGN KEY (`pessoaFisica_id`) REFERENCES `telepecas`.`pessoaFisica` (`id`),
  CONSTRAINT `fk_pessoaJuridica_clientes` FOREIGN KEY (`pessoaJuridica_id`) REFERENCES `telepecas`.`pessoaJuridica` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `telepecas`.`minhaEmpresas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`minhaEmpresas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inicioAtividades` DATE NOT NULL,
  `pessoaJuridica_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_minhaEmpresas_pessoaJuridica1` FOREIGN KEY (`pessoaJuridica_id`) REFERENCES `telepecas`.`pessoaJuridica` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `telepecas`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `partNumber` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(50) NOT NULL,
  `ncm` INT NOT NULL,
  `valorCompra` DECIMAL(10,2) NOT NULL,
  `valorVenda` DECIMAL(10,2) NOT NULL,
  `classificacaoDesconto` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `telepecas`.`orcamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`orcamentos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numControle` BIGINT(10) NOT NULL,
  `emissao` DATETIME NOT NULL,
  `canal` VARCHAR(50) NOT NULL,
  `vendedor` VARCHAR(50) NOT NULL,
  `quant` INT NOT NULL,
  `observacoes` VARCHAR(256) NULL,
  `produtos_id` INT NOT NULL,
  `funcionarios_id` INT NOT NULL,
  `clientes_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_orcamentos_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `telepecas`.`produtos` (`id`),
  CONSTRAINT `fk_orcamentos_funcionarios1` FOREIGN KEY (`funcionarios_id`) REFERENCES `telepecas`.`funcionarios` (`id`),
  CONSTRAINT `fk_orcamentos_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `telepecas`.`clientes` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `telepecas`.`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`fornecedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NULL,
  `pessoaJuridica_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_fornecedores_pessoaJuridica1` FOREIGN KEY (`pessoaJuridica_id`) REFERENCES `telepecas`.`pessoaJuridica` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `telepecas`.`impostos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`impostos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT NOT NULL,
  `tipo` VARCHAR(50) NOT NULL,
  `percentual` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `telepecas`.`notasFiscais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`notasFiscais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numNota` BIGINT(8) NOT NULL,
  `serieNota` BIGINT(8) NOT NULL,
  `chaveAcesso` BIGINT(16) NOT NULL,
  `tipoNota` VARCHAR(50) NOT NULL,
  `natureza` VARCHAR(50) NOT NULL,
  `protocolo` DATETIME NOT NULL,
  `formaPagamento` VARCHAR(50) NOT NULL,
  `dadosAdicionais` VARCHAR(100) NULL,
  `impostos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_notasFiscais_impostos1` FOREIGN KEY (`impostos_id`) REFERENCES `telepecas`.`impostos` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `telepecas`.`enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`enderecos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `logradouro` VARCHAR(50) NOT NULL,
  `numero` INT NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `estado` VARCHAR(50) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `cep` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `telepecas`.`compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`compras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(50) NOT NULL,
  `observacoes` VARCHAR(100) NOT NULL,
  `produtos_id` INT NOT NULL,
  `notasFiscais_id` INT NOT NULL,
  `fornecedores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_compras_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `telepecas`.`produtos` (`id`),
  CONSTRAINT `fk_compras_notasFiscais1` FOREIGN KEY (`notasFiscais_id`) REFERENCES `telepecas`.`notasFiscais` (`id`),
  CONSTRAINT `fk_compras_fornecedores1` FOREIGN KEY (`fornecedores_id`) REFERENCES `telepecas`.`fornecedores` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `telepecas`.`vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`vendas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(50) NOT NULL,
  `observacoes` VARCHAR(100) NOT NULL,
  `clientes_id` INT NOT NULL,
  `produtos_id` INT NOT NULL,
  `notasFiscais_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_vendas_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `telepecas`.`clientes` (`id`),
  CONSTRAINT `fk_vendas_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `telepecas`.`produtos` (`id`),
  CONSTRAINT `fk_vendas_notasFiscais1` FOREIGN KEY (`notasFiscais_id`) REFERENCES `telepecas`.`notasFiscais` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `telepecas`.`pessoas_has_enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`pessoas_has_enderecos` (
  `pessoas_id` INT NOT NULL,
  `endereceos_id` INT NOT NULL,
  PRIMARY KEY (`pessoas_id`, `endereceos_id`),
  CONSTRAINT `fk_pessoas_has_endereceos_pessoas1` FOREIGN KEY (`pessoas_id`) REFERENCES `telepecas`.`pessoas` (`id`),
  CONSTRAINT `fk_pessoas_has_endereceos_endereceos1` FOREIGN KEY (`endereceos_id`) REFERENCES `telepecas`.`enderecos` (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `telepecas`.`vendas_has_funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telepecas`.`vendas_has_funcionarios` (
  `vendas_id` INT NOT NULL,
  `funcionarios_id` INT NOT NULL,
  PRIMARY KEY (`vendas_id`, `funcionarios_id`), 
  CONSTRAINT `fk_vendas_has_funcionarios_vendas1` FOREIGN KEY (`vendas_id`) REFERENCES `telepecas`.`vendas` (`id`),
  CONSTRAINT `fk_vendas_has_funcionarios_funcionarios1` FOREIGN KEY (`funcionarios_id`) REFERENCES `telepecas`.`funcionarios` (`id`))
ENGINE = InnoDB;