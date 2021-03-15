Create Database EvaluationDB;

USE EvaluationDB;

Create Table T_Client(
	Id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NomCli Varchar(30) NOT NULL,
    PrenomCli Varchar(30) NOT NULL,
    VilleCli Varchar(250),
    RueCli Varchar(250),
    CPCli INT(5) UNSIGNED,
    EmailCli Varchar(250) NOT NULL,
    TelephoneCli Varchar(10) NOT NULL
);

Create Table T_Cinema(
	Id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NomCinema Varchar(30) NOT NULL,
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
);
/* Insertions */
Insert Into T_Client(NomCli, PrenomCli, VilleCli, RueCli, CPCli, EmailCli, TelephoneCli)
Values ("Jacque", "Pierre", "Rouen", "3 Rue des Potiers", 76000, "jacque.pierre@gmail.com", "0600000000");
Insert Into T_Cinema(NomCinema, VilleCinema, RueCinema, CPCinema, NbPlaceCinema)
Values ("Gaumont", "Rouen", "1 Rue du Gros Horloge", 76000, 500);
Insert Into T_Reservation(IdCli, IdCinema, DateReservation)
Values (1, 1, "2021-01-01");

/* Selects */
Select * From T_Client;
Select * From T_Cinema;
Select * From T_Reservation;

/* DELETE */
DELETE FROM T_Client;
DELETE FROM T_Cinema;
DELETE FROM T_Reservation;

/*Update*/
Update T_Client
Set NomCli = "Jean"
Where Id = 1;

/* Jointures Reservations */
Select NomCli, NomCinema, DateReservation
From T_Reservation as Reservation
Inner Join T_Client as Client on Reservation.IdCli = Client.Id
Inner Join T_Cinema as Cinema on Reservation.IdCinema = Cinema.Id;

/* Creation d'utilisateur */
Create User Administrateur;
Create User Employé;
/* Priviliges */
Grant ALL privileges on evaluationdb To 'Administrateur';
Grant select on T_Client To 'Employé';
Grant select on T_Cinema To 'Employé';
Grant select on T_Reservation To 'Employé';
/* Drop Database */
Drop Database EvaluationDB;

