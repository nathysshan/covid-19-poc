DROP TABLE IF EXISTS confirmedByDay;
DROP TABLE IF EXISTS recoveredByDay;
DROP TABLE IF EXISTS deathsByDay;
DROP TABLE IF EXISTS statistics;
DROP TABLE IF EXISTS statistic;
 
 --https://corona-stats.online/?format=json
 
CREATE TABLE statistic (
  statisticId BIGINT NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
  country VARCHAR(50) DEFAULT NULL,
  province VARCHAR(50) DEFAULT NULL,
  countryCode VARCHAR(2) DEFAULT NULL,
  confirmed VARCHAR(20) DEFAULT NULL,
  recovered VARCHAR(20) DEFAULT NULL,
  deaths VARCHAR(20) DEFAULT NULL,
  confirmedByDay INT,
  recoveredByDay INT,
  deathsByDay INT,
  lastUpdated VARCHAR(50) DEFAULT NULL,
  active VARCHAR(20) DEFAULT NULL,
  mortalityPer VARCHAR(20) DEFAULT NULL,
  recoveredPer VARCHAR(20) DEFAULT NULL,
  CONSTRAINT statistic_pk PRIMARY KEY (statisticId)
);

CREATE TABLE confirmedByDay (
  confirmedByDayId BIGINT NOT NULL AUTO_INCREMENT,
  statisticId BIGINT NOT NULL,
  confirmedByDay BIGINT,
  CONSTRAINT confirmedByDay_pk PRIMARY KEY (confirmedByDayId),
  FOREIGN KEY (statisticId)
        REFERENCES statistic(statisticId)
        ON DELETE CASCADE
);
  
CREATE TABLE recoveredByDay (
  recoveredByDayId BIGINT NOT NULL AUTO_INCREMENT,
  statisticId BIGINT NOT NULL,
  recoveredByDay INT,
  CONSTRAINT recoveredByDay_pk PRIMARY KEY (recoveredByDayId)
  FOREIGN KEY (statisticId)
        REFERENCES statistic(statisticId)
        ON DELETE CASCADE
);

CREATE TABLE deathsByDay (
  deathsByDayId BIGINT NOT NULL AUTO_INCREMENT,
  statisticId BIGINT NOT NULL,
  deathsByDay INT,
  CONSTRAINT deathsByDay_pk PRIMARY KEY (deathsByDayId)
  FOREIGN KEY (statisticId)
        REFERENCES statistic(statisticId)
        ON DELETE CASCADE
);
   
INSERT INTO statistic (country, province, countryCode, confirmed, recovered, deaths, confirmedByDay, recoveredByDay, deathsByDay, lastUpdated, active, mortalityPer, recoveredPer) VALUES
  ('Canada', 'Québec', 'CA', '345','124','34',0,0,0,'2020-03-21','4','5','6');

INSERT INTO statistic (country, province, country_code, confirmed, recovered, deaths, last_updated, active, mortality_per, recovered_per) VALUES
  ('Canada', 'Québec', 'CA', '345','124','34','2020-03-21','4','5','6');
  
INSERT INTO statistic (country, province, country_code, confirmed, recovered, deaths, last_updated, active, mortality_per, recovered_per) VALUES
  ('Canada', 'Manitoba', 'CA', '345','124','34','2020-03-21','4','5','6');
  
INSERT INTO statistic (country, province, country_code, confirmed, recovered, deaths, last_updated, active, mortality_per, recovered_per) VALUES
  ('Canada', 'Ontario', 'CA', '345','124','34','2020-03-21','4','5','6');
