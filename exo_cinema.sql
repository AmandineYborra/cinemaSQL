USE cinema;

alter table joue
change artiste acteur varchar (45);

-- Contraintes d'intégrités fonctionnelles

ALTER TABLE artiste
ADD CONSTRAINT pk_artiste
  PRIMARY KEY (nom);
  
ALTER TABLE film
ADD CONSTRAINT pk_film
  PRIMARY KEY (titre);

ALTER TABLE joue
ADD CONSTRAINT pk_joue
  PRIMARY KEY (titre, acteur);
  
ALTER TABLE seance
ADD CONSTRAINT pk_seance
  PRIMARY KEY (numero, nomCine, horaire);
  
ALTER TABLE avu
ADD CONSTRAINT pk_avu
  PRIMARY KEY (spectateur, titre);

ALTER TABLE aime
ADD CONSTRAINT pk_aime
  PRIMARY KEY (spectateur, titre);
  
-- Contraintes d'intégrités référentielles

ALTER TABLE film
ADD CONSTRAINT fk_film_realise
  FOREIGN KEY (realisateur) REFERENCES artiste(nom);
  
ALTER TABLE joue
ADD CONSTRAINT fk_joue_film
  FOREIGN KEY (titre) REFERENCES film(titre);

ALTER TABLE joue
ADD CONSTRAINT fk_joue_acteur
  FOREIGN KEY (acteur) REFERENCES artiste(nom);
  
ALTER TABLE seance
ADD CONSTRAINT fk_seance_titre
  FOREIGN KEY (titre) REFERENCES film(titre);
  
ALTER TABLE avu
ADD CONSTRAINT fk_avu_film
  FOREIGN KEY (titre) REFERENCES film(titre);
  
ALTER TABLE aime
ADD CONSTRAINT fk_aime_film
  FOREIGN KEY (titre) REFERENCES film(titre);
  
-- Contraintes de domaines 

DELIMITER |
CREATE TRIGGER before_insert_nb_salles BEFORE INSERT ON seance FOR EACH ROW BEGIN IF NEW.nb_salles > 10 THEN SET NEW.nb_salles = 10; 
END IF; 
END |
DELIMITER ;

ALTER TABLE seance
ADD heure_ouverture TIME;

DELIMITER |
CREATE TRIGGER before_insert_heure_ouverture BEFORE INSERT ON seance FOR EACH ROW IF NEW.heure_ouverture > '00:00:00' AND NEW.heure_ouverture < '10:00:00' THEN SET NEW.heure_ouverture = NULL;
END IF;
END |
DELIMITER ;




