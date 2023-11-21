drop database commercial
CREATE DATABASE commercial;
USE commercial;

CREATE TABLE typeUtilisateur (
    idTypeUtilisateur int not null primary key auto_increment,
    nom VARCHAR(100)
);

insert into typeUtilisateur values(null , 'Achat'); 
insert into typeUtilisateur values(null , 'Ficance'); 
insert into typeUtilisateur values(null , 'RH');

CREATE TABLE utilisateur (
    idUtilisateur int not null primary key auto_increment,
    nom VARCHAR(100),
    mail VARCHAR(100),
    mdp VARCHAR(255),
    idtypeUtilisateur int not null,
    FOREIGN key (idtypeUtilisateur) REFERENCES typeUtilisateur(idtypeUtilisateur)
);
insert into utilisateur values(null , 'achat' , 'achat@gmail.com' , '0000' , 1);
insert into utilisateur values(null , 'finance' , 'finance@gmail.com' , '0000' , 2);
insert into utilisateur values(null , 'rh' , 'rh@gmail.com' , '0000' , 3);


CREATE TABLE fournisseur (
    idFournisseur int not null primary key auto_increment,
    nom VARCHAR(100),
    adresse VARCHAR(50),
    mail VARCHAR(100),
    contact VARCHAR(100),
    responsable VARCHAR(100)
);
insert into fournisseur values(null , 'Shop Liantso' , 'antaninandro' , 'shopLi@gmail.com' , '034 17 778 99' , 'Rampanjato Solondraibe Fehizoro');
insert into fournisseur values(null , 'Shopprite' , 'antaninandro' , 'shopLi@gmail.com' , '034 17 778 99' , 'Rampanjato Solondraibe Fehizoro');
insert into fournisseur values(null , 'Leader Price' , 'antaninandro' , 'shopLi@gmail.com' , '034 17 778 99' , 'Rampanjato Solondraibe Fehizoro');

CREATE TABLE article (
    idArticle int not null primary key auto_increment,
    nom VARCHAR(100),
    verifTVA int DEFAULT 1 
);

insert into article values(null , 'cahier 50page' , 1);
insert into article values(null , 'stylos blue' , 1);
insert into article values(null , 'stylos rouge' , 1);
insert into article values(null , 'papier' , 1);
insert into article values(null , 'cahier 100page' , 1);


CREATE TABLE articleParFournisseur(
    idArticleParFournisseur int not null primary key auto_increment,
    idArticle int not null,
    idFournisseur int not null,
    FOREIGN key(idArticle) REFERENCES article(idArticle),
    FOREIGN key(idFournisseur) REFERENCES fournisseur(idFournisseur)
);
insert into articleParFournisseur values(null , 1  ,1);
insert into articleParFournisseur values(null , 2  ,1);
insert into articleParFournisseur values(null , 3  ,1);
insert into articleParFournisseur values(null , 4  ,1);
insert into articleParFournisseur values(null , 5  ,1);


insert into articleParFournisseur values(null , 1  ,2);
insert into articleParFournisseur values(null , 2  ,2);
insert into articleParFournisseur values(null , 3  ,2);
insert into articleParFournisseur values(null , 4  ,2);
insert into articleParFournisseur values(null , 5  ,2);


insert into articleParFournisseur values(null , 1  ,3);
insert into articleParFournisseur values(null , 2  ,3);
insert into articleParFournisseur values(null , 3  ,3);
insert into articleParFournisseur values(null , 4  ,3);
insert into articleParFournisseur values(null , 5  ,3);

CREATE TABLE prixArticlParFournisseur (
    idPrixArticlParFournisseur int not null primary key auto_increment,
    idArticleParFournisseur int not null,
    datePrixArticlParFournisseur date,
    prix double precision ,
    quantite double precision,
    FOREIGN key(idArticleParFournisseur) REFERENCES articleParFournisseur(idArticleParFournisseur)
);
insert into prixArticlParFournisseur values(null , 1 , '2023-10-10' , 1000 , 100 );
insert into prixArticlParFournisseur values(null , 2 , '2023-10-10' , 1800 , 100 );
insert into prixArticlParFournisseur values(null , 3 , '2023-10-10' , 300 , 100 );
insert into prixArticlParFournisseur values(null , 4 , '2023-10-10' , 1900 , 100 );
insert into prixArticlParFournisseur values(null , 5, '2023-10-10' , 2000 , 100 );

insert into prixArticlParFournisseur values(null , 6, '2023-10-10' , 1000 , 100 );
insert into prixArticlParFournisseur values(null , 7 , '2023-10-10' , 1500 , 100 );
insert into prixArticlParFournisseur values(null , 8 , '2023-10-10' , 300 , 100 );
insert into prixArticlParFournisseur values(null , 9 , '2023-10-10' , 1800 , 100 );
insert into prixArticlParFournisseur values(null , 10 , '2023-10-10' , 1900 , 100 );

insert into prixArticlParFournisseur values(null , 11 , '2023-10-10' , 1100 , 100 );
insert into prixArticlParFournisseur values(null , 12 , '2023-10-10' , 1400 , 100 );
insert into prixArticlParFournisseur values(null , 13 , '2023-10-10' , 500 , 100 );
insert into prixArticlParFournisseur values(null , 14 , '2023-10-10' , 1700 , 100 );
insert into prixArticlParFournisseur values(null , 15 , '2023-10-10' , 2300 , 100 );



CREATE TABLE service(
    idService int not null primary key auto_increment,
    nomService VARCHAR(100),
    nomChef VARCHAR(100)
);

insert into service(nomService,nomChef) values('Service Informatique','Naivo');
insert into service(nomService,nomChef) values('Service Bureautique','Koto');

CREATE TABLE besoinService(
    idBesoinService int not null primary key auto_increment,
    dateDelai date,
    validite int DEFAULT 0,
    idService int not null,
    FOREIGN key(idService) REFERENCES service(idService)
);

CREATE TABLE detailsBesoin(
    idDetaisBesoin int not null primary key auto_increment,
    idArticle int not null,
    idBesoinService int not null,
    quantite double precision,
    validite int DEFAULT 0,
    FOREIGN key(idArticle) REFERENCES article (idArticle),
    FOREIGN key(idBesoinService) REFERENCES besoinService (idBesoinService)
);

create table proformat(
    idProformat int not null auto_increment primary key , 
    dateDebut date , 
    dateFin date 
);

create table detailProformat(
    idDetailProformat int not null auto_increment primary key ,
    idProformat int not null , 
    idArticle int not null , 
    quantite double , 
    foreign key(idProformat) references proformat(idProformat) , 
    foreign key(idArticle) references article(idArticle) 
);

create table proformatPourFournisseur(
    idProformatPourFournisseur int not null auto_increment primary key ,
    idFournisseur int not null , 
    idProformat int not null ,
    foreign key(idProformat) references proformat(idProformat) , 
    foreign key(idFournisseur) references fournisseur(idFournisseur) 
);



----------------------- View --------------------------
create or replace view utilisateurAvecType as
select utilisateur.idUtilisateur,utilisateur.nom as nomUtilisateur, mdp , mail , utilisateur.idtypeUtilisateur , typeUtilisateur.nom as nomType from utilisateur 
join typeUtilisateur
on utilisateur.idtypeUtilisateur = typeUtilisateur.idTypeUtilisateur;

create or replace view articleAvecPrixParFournisseur as
select * from articleParFournisseur
join prixArticlParFournisseur
on prixArticlParFournisseur.idArticleParFournisseur = articleParFournisseur.idArticleParFournisseur;

-- Ireo aarticle envoyena any amin'ny service d'achat
CREATE or replace view ArticleEnvoyerAchat as(
    select idBesoinService , idArticle , sum(quantite) as quantite 
    from detailsBesoin 
    where validite = 1 
    group by idBesoinService,idArticle 
);


