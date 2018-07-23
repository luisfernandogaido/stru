/*
SQLyog Community
MySQL - 5.7.18-log : Database - unidade_negocio
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/unidade_negocio /*!40100 DEFAULT CHARACTER SET utf8 */;

USE unidade_negocio;

/* Procedure structure for procedure funcionarios_seleciona */

/*!50003 DROP PROCEDURE IF EXISTS  funcionarios_seleciona */;

DELIMITER $$

/*!50003 CREATE PROCEDURE funcionarios_seleciona(
  vtexto text
)
  BEGIN
    SELECT
      id_funcionario,
      cargo_extinto,
      compensacao_diaria,
      data_cadastramento_cargo,
      cargo_hora_base,
      cargo_horas_semanais,
      id_especializacao,
      jornada_diaria,
      nivel,
      cargo_nome,
      nome_abreviado,
      nome_especializacao,
      resumo_cargo,
      situacao_cargo,
      tipo_pessoa,
      funcao_codigo,
      funcao_nome,
      tipo_funcao,
      lotacao_codigo,
      lotacao_codigo_dr,
      lotacao_nome,
      lotacao_nome_dr,
      lotacao_sigla,
      lotacao_sigla_dr,
      lotacao_fisica_codigo,
      lotacao_fisica_nome,
      lotacao_fisica_nome_dr,
      lotacao_fisica_sigla,
      lotacao_fisica_sigla_dr,
      ano_imigracao,
      ativo_inativo,
      deficiente_fisico,
      estado_civil,
      id_instrucao,
      id_pessoa,
      id_raca,
      naturalizado,
      nome_guerra,
      nome_pessoa,
      permite_readmissao,
      sexo,
      registro,
      data_admissao,
      demitido,
      hora_base,
      horas_semanais,
      atualizacao,
      indice
    FROM
      funcionario
    where match (indice) against (vtexto in boolean mode)
    order by (MATCH (indice) AGAINST (vtexto IN BOOLEAN MODE)) desc;
  END */$$
DELIMITER ;

/* Procedure structure for procedure orgaos_seleciona */

/*!50003 DROP PROCEDURE IF EXISTS  orgaos_seleciona */;

DELIMITER $$

/*!50003 CREATE PROCEDURE orgaos_seleciona(
  vtxt TEXT
)
  BEGIN
    SELECT mcu, nome, tipo, cidade, sigla_dr dr, uf, cep
    FROM orgao
    WHERE MATCH(texto) AGAINST(vtxt IN BOOLEAN MODE) AND
          nome_dr IS NOT NULL AND
          sigla_dr IS NOT NULL;
  END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
