DROP TABLE IF EXISTS muzeu;
CREATE TABLE muzeu(
 idmuz INT NOT NULL AUTO_INCREMENT,
  denmuz VARCHAR(100) NOT NULL,
  adresa VARCHAR(100) NOT NULL,
  tip VARCHAR(100) NOT NULL,
  descriere VARCHAR(100),
  PRIMARY KEY (idmuz)
);

DROP TABLE IF EXISTS sectie;
CREATE TABLE sectie(
 idsect INT NOT NULL AUTO_INCREMENT,
  densect VARCHAR(100) NOT NULL,
  descriere VARCHAR(100),
  idmuz INT NOT NULL,
  PRIMARY KEY (idsect),
  FOREIGN KEY (idmuz) REFERENCES muzeu(idmuz)
);

DROP TABLE IF EXISTS sala;
CREATE TABLE sala(
 idsala INT NOT NULL AUTO_INCREMENT,
  densala VARCHAR(100) NOT NULL,
  nrexp INT,
  idsect INT NOT NULL,
  PRIMARY KEY (idsala),
  FOREIGN KEY (idsect) REFERENCES sectie(idsect)
);

DROP TABLE IF EXISTS exponat;
CREATE TABLE exponat(
 idexp INT NOT NULL AUTO_INCREMENT,
  descriere VARCHAR(100) NOT NULL,
  images VARCHAR(100),
  idsala INT NOT NULL,
  PRIMARY KEY (idsala),
  FOREIGN KEY (idsect) REFERENCES sectie(idsect)
);