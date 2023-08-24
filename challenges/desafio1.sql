-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;

CREATE SCHEMA IF NOT EXISTS SpotifyClone ;

CREATE TABLE SpotifyClone.artista (
  artista_id INT NOT NULL AUTO_INCREMENT,
  nome_artista VARCHAR(45) NOT NULL,
  PRIMARY KEY (artista_id))
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.album (
  album_id INT NOT NULL AUTO_INCREMENT,
  nome_album VARCHAR(45) NOT NULL,
  ano_lançamento INT NULL,
  PRIMARY KEY (album_id))
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.planos_detalhes (
  plano_id INT NOT NULL AUTO_INCREMENT,
  categoria VARCHAR(45) NOT NULL,
  valor_plano DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (plano_id),
  UNIQUE INDEX categoria_UNIQUE (categoria ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.info_usuarios (
  usuario_id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(45) NOT NULL,
  idade INT NOT NULL,
  data_assinatura_plano DATE NOT NULL,
  plano_id INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT fk_info_usuarios_planos_detalhes1
    FOREIGN KEY (plano_id)
    REFERENCES SpotifyClone.planos_detalhes (plano_id))
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.info_musicas (
  musica_id INT NOT NULL AUTO_INCREMENT,
  nome_musica VARCHAR(45) NOT NULL,
  duração_seg INT NOT NULL,
  album_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (musica_id),
  CONSTRAINT fk_info_musicas_album1
    FOREIGN KEY (album_id)
    REFERENCES SpotifyClone.album (album_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_info_musicas_artista1
    FOREIGN KEY (artista_id)
    REFERENCES SpotifyClone.artista (artista_id))
ENGINE = InnoDB;

CREATE TABLE SpotifyClone.histórico_reprodução (
  reprodução_id INT NOT NULL AUTO_INCREMENT,
  data_reprodução DATETIME NOT NULL,
  musica_id INT NOT NULL,
  usuario_id INT NOT NULL,
  PRIMARY KEY (reprodução_id),
  CONSTRAINT fk_histórico_reprodução_info_musicas1
    FOREIGN KEY (musica_id)
    REFERENCES SpotifyClone.info_musicas (musica_id),
  CONSTRAINT fk_histórico_reprodução_info_usuarios1
    FOREIGN KEY (usuario_id)
    REFERENCES SpotifyClone.info_usuarios (usuario_id))
ENGINE = InnoDB;

-- CREATE TABLE SpotifyClone.artista_album (
--   artista_id INT NOT NULL,
--   album_id INT NOT NULL,
--   PRIMARY KEY (artista_id),
--   CONSTRAINT fk_artista_has_album_artista
--     FOREIGN KEY (artista_id)
--     REFERENCES SpotifyClone.artista (artista_id),
--   CONSTRAINT fk_artista_album_album1
--     FOREIGN KEY (album_id)
--     REFERENCES SpotifyClone.album (album_id))
-- ENGINE = InnoDB;

CREATE TABLE SpotifyClone.artistas_seguidos (
  artista_id INT NOT NULL,
  usuario_id INT NOT NULL,
  PRIMARY KEY (artista_id, usuario_id),
  CONSTRAINT fk_artista_has_info_usuarios_artista1
    FOREIGN KEY (artista_id)
    REFERENCES SpotifyClone.artista (artista_id),
  CONSTRAINT fk_artista_has_info_usuarios_info_usuarios1
    FOREIGN KEY (usuario_id)
    REFERENCES SpotifyClone.info_usuarios (usuario_id))
ENGINE = InnoDB;

INSERT INTO SpotifyClone.artista (artista_id, nome_artista)
  VALUES
	('1', 'Beyoncé'),
	('2', 'Queen'),
	('3', 'Elis Regina'),
	('4', 'Baco Exu do Blues'),
	('5', 'Blind Guardian'),
	('6', 'Nina Simone');
    
INSERT INTO SpotifyClone.album (album_id, nome_album, ano_lançamento) VALUES
	('1', 'Renaissance', '2022'),
	('2', 'Jazz','1978'),
	('3', 'Hot space', '1982'),
	('4', 'Falso brilhante', '1998'),
	('5', 'Vento de Maio', '2001'),
	('6', 'QVVJFA?', '2003'),
	('7', 'Somewhere far beyond', '2007'),
	('8', 'I put a spell on you', '2012');

INSERT INTO SpotifyClone.info_musicas (musica_id, nome_musica, album_id, artista_id, duração_seg) VALUES
	('1', 'Break my soul', '1', '1', '279'),
	('2', 'Virgo’s Groove', '1', '1', '369'),
	('3', 'Alien Superstar', '1', '1', '116'),
	('4', 'Don’t stop me now', '2', '2', '203'),
	('5', 'Under pressure', '3', '2', '152'),
	('6', 'Como nossos pais', '4', '3', '105'),
	('7', 'O medo de amar é o medo de ser livre', '5', '3', '207'),
	('8', 'Samba em Paris', '6', '4', '267'),
	('9', 'The Bard\'s song', '7', '5', '244'),
	('10', 'Feeling good', '7', '6', '100');

INSERT INTO SpotifyClone.planos_detalhes (plano_id, categoria, valor_plano) VALUES
	('1', 'gratuito', '0'),
	('2', 'familiar', '7.99'),
	('3', 'universitário', '5.99'),
	('4', 'pessoal', '6.99');

INSERT INTO SpotifyClone.info_usuarios (usuario_id, nome, sobrenome, idade, plano_id, data_assinatura_plano) VALUES
	('1', 'Barbara ', 'Liskov', '82', '1', '2019-10-20'),
	('2', 'Robert', 'Cecil Martin', '58', '1', '2017-01-06'),
	('3', 'Ada ', 'Lovelace', '37', '2', '2017-12-30'),
	('4', 'Martin', 'Fowler', '46', '2', '2017-01-17'),
	('5', 'Sandi', 'Metz', '58', '2', '2018-04-29'),
	('6', 'Paulo ', 'Freire', '19', '3', '2018-02-14'),
	('7', 'Bell', 'Hooks', '26', '3', '2018-01-05'),
	('8', 'Christopher ', 'Alexander', '85', '4', '2019-06-05'),
	('9', 'Judith', 'Butler', '45', '4', '2020-05-13'),
	('10', 'Jorge', 'Amado', '58', '4', '2017-02-17');
    
INSERT INTO SpotifyClone.histórico_reprodução (reprodução_id, usuario_id, musica_id, data_reprodução) VALUES
	('1', '1', '8', '2022-02-28 10:45:55'),
	('2', '1', '2', '2020-05-02 05:30:35'),
	('3', '1', '10', '2020-03-06 11:22:33'),
	('4', '2', '10', '2022-08-05 08:05:17'),
	('5', '2', '7', '2020-01-02 07:40:33'),
	('6', '3', '10', '2020-11-13 16:55:13'),
	('7', '3', '2', '2020-12-05 18:38:30'),
	('8', '4', '8', '2021-08-15 17:10:10'),
	('9', '5', '8', '2022-01-09 01:44:33'),
	('10', '5', '5', '2020-08-06 15:23:43'),
	('11', '6', '7', '2017-01-24 00:31:17'),
	('12', '6', '1', '2017-10-12 12:35:20'),
	('13', '7', '4', '2011-12-15 22:30:49'),
	('14', '8', '4', '2012-03-17 14:56:41'),
	('15', '9', '9', '2022-02-24 21:14:22'),
	('16', '10', '3', '2015-12-13 08:30:22');
    
INSERT INTO  SpotifyClone.artistas_seguidos (usuario_id, artista_id) VALUES
	('1', '1'),
	('1', '2'),
	('1', '3'),
	('2', '1'),
	('2', '3'),
	('3', '2'),
	('4', '4'),
	('5', '5'),
	('5', '6'),
	('6', '6'),
	('6', '1'),
	('7', '6'),
	('9', '3'),
	('10', '2');