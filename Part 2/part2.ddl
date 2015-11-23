CREATE TABLE Player
  (
    p_id         INTEGER NOT NULL ,
    name         VARCHAR2 (255) ,
    position     VARCHAR2 (255) ,
    Team_Team_id INTEGER
  ) ;
ALTER TABLE Player ADD CONSTRAINT Player_PK PRIMARY KEY ( p_id ) ;


CREATE TABLE Team
  (
    Team_id INTEGER NOT NULL ,
    loc     VARCHAR2 (255) ,
    won     INTEGER
  ) ;
ALTER TABLE Team ADD CONSTRAINT Team_PK PRIMARY KEY ( Team_id ) ;


ALTER TABLE Player ADD CONSTRAINT Player_Team_FK FOREIGN KEY ( Team_Team_id ) REFERENCES Team ( Team_id ) ;
