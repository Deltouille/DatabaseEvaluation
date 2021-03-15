Create Database EvaluationDB;
USE EvaluationDB;
Create Table T_Client(
	Id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NomCli Varchar(30) NOT NULL,
    PrenomCli Varchar(30) NOT NULL,
    AdresseCli Varchar(250),
    VilleCli Varchar(250),
    RueCli Varchar(250),
    CPCli INT(5) UNSIGNED,
    EmailCli Varchar(250) NOT NULL,
    TelephoneCli Varchar(250) NOT NULL
);

Create Table T_Cinema(
	Id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NomCinema Varchar(30) NOT NULL,
    AdresseCinema Varchar(250),
    VilleCinema Varchar(250),
    RueCinema Varchar(250),
    CPCinema INT(5) UNSIGNED,
    NbPlaceCinema Int(5) UNSIGNED
);

Create Table T_Reservation(
	Id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    IdCli INT(6) UNSIGNED NOT NULL,
    IdCinema INT(6) UNSIGNED NOT NULL,
    DateReservation Date NOT NULL,
    FOREIGN KEY(IdCli) REFERENCES T_Client(Id),
    FOREIGN KEY(IdCinema) REFERENCES T_Cinema(Id)
)