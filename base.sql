drop database nba;
create database nba;
\c nba;

create table joueur (
    idJoueur serial not null primary key,
    nomJouer varchar(100),
    prenom varchar(100)
);

create table equipe(
    idEquipe serial not null primary key,
    nomEquipe varchar(100)
);

create table joueurParEquipe(
    idJoueurParEquipe serial not null primary key,
    idEquipe int not null,
    idJoueur int not null,
    foreign key(idEquipe) references equipe(idEquipe),
    foreign key(idJoueur) references joueur(idJoueur)
);

create table match(
    idMatch serial not null primary key,
    nomMatch int not null,
    lieu varchar(100),
    heureDebut timestamp,
    heureFin timestamp
);

create table equipeMatch(
    idEquipeMatch serial not null primary key,
    idMatch int not null,
    idEquipe int not null,
    foreign key(idEquipe) references equipe(idEquipe),
    foreign key(idMatch) references match(idMatch)
);

create table tire(
    idTire serial not null primary key,
    nomTire varchar(100)
);

create table tireMatch(
    idTireMatch serial not null primary key,
    idMatch int not null,
    minutes double precision,
    idJoueur int not null,
    idTire int not null,
    points double precision,
    foreign key(idMatch) references match(idMatch),
    foreign key(idJoueur) references joueur(idJoueur),
    foreign key(idTire) references tire(idTire)
);

create table possessionBallon(
    idPossessionBallon serial not null primary key,
    idMatch int not null,
    idJoueur int not null,
    minutes double precision,
    duree double precision,
    foreign key(idMatch) references match(idMatch),
    foreign key(idJoueur) references joueur(idJoueur)
);

create table passe(
    idPasse serial not null primary key,
    nomPasse varchar(100)
);

create table passeMatch(
    idPasseMatch serial not null primary key,
    idJoueurMiPasse int not null,
    idJoueurPassena int not null,
    idPasse int not null,
    minutes double precision,
    foreign key(idJoueurMiPasse) references joueur(idJoueur),
    foreign key(idJoueurPassena) references joueur(idJoueur),
    foreign key(idPasse) references passe(idPasse)
);

create table changementJoueur(
    idChangementJoueur serial not null primary key,
    idMatch int not null,
    idJoueur int not null,
    minutesEntree double precision,
    minutesSortie double precision,
    foreign key(idMatch) references match(idMatch),
    foreign key(idJoueur) references joueur(idJoueur)
);