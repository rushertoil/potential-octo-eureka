------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------



------------------------------------------------------------
-- Table: Type_de_client
------------------------------------------------------------
CREATE TABLE public.Type_de_client(
	id_type_de_client   INT  NOT NULL ,
	libelle             VARCHAR (100) NOT NULL  ,
	CONSTRAINT Type_de_client_PK PRIMARY KEY (id_type_de_client)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Client
------------------------------------------------------------
CREATE TABLE public.Client(
	id_client           INT  NOT NULL ,
	nom                 VARCHAR (50) NOT NULL ,
	prenom              VARCHAR (50) NOT NULL ,
	adresse             VARCHAR (100) NOT NULL ,
	id_type_de_client   INT  NOT NULL  ,
	CONSTRAINT Client_PK PRIMARY KEY (id_client)

	,CONSTRAINT Client_Type_de_client_FK FOREIGN KEY (id_type_de_client) REFERENCES public.Type_de_client(id_type_de_client)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Option
------------------------------------------------------------
CREATE TABLE public.Option(
	id_option   INT  NOT NULL ,
	libelle     VARCHAR (100) NOT NULL ,
	prix        DECIMAL (-1,-1)  NOT NULL  ,
	CONSTRAINT Option_PK PRIMARY KEY (id_option)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Categorie
------------------------------------------------------------
CREATE TABLE public.Categorie(
	id_categorie   VARCHAR (1) NOT NULL ,
	libelle        VARCHAR (50) NOT NULL ,
	prix           INT  NOT NULL  ,
	CONSTRAINT Categorie_PK PRIMARY KEY (id_categorie)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Marque
------------------------------------------------------------
CREATE TABLE public.Marque(
	id_marque   INT  NOT NULL ,
	libelle     VARCHAR (50) NOT NULL  ,
	CONSTRAINT Marque_PK PRIMARY KEY (id_marque)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Modele
------------------------------------------------------------
CREATE TABLE public.Modele(
	id_modele      INT  NOT NULL ,
	libelle        VARCHAR (50) NOT NULL ,
	image          VARCHAR (50) NOT NULL ,
	id_categorie   VARCHAR (1) NOT NULL ,
	id_marque      INT  NOT NULL  ,
	CONSTRAINT Modele_PK PRIMARY KEY (id_modele)

	,CONSTRAINT Modele_Categorie_FK FOREIGN KEY (id_categorie) REFERENCES public.Categorie(id_categorie)
	,CONSTRAINT Modele_Marque0_FK FOREIGN KEY (id_marque) REFERENCES public.Marque(id_marque)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Voiture
------------------------------------------------------------
CREATE TABLE public.Voiture(
	id_voiture        INT  NOT NULL ,
	immatriculation   VARCHAR (50) NOT NULL ,
	compteur          INT  NOT NULL ,
	id_modele         INT  NOT NULL  ,
	CONSTRAINT Voiture_PK PRIMARY KEY (id_voiture)

	,CONSTRAINT Voiture_Modele_FK FOREIGN KEY (id_modele) REFERENCES public.Modele(id_modele)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Location
------------------------------------------------------------
CREATE TABLE public.Location(
	id_location      INT  NOT NULL ,
	date_debut       DATE  NOT NULL ,
	date_fin         DATE  NOT NULL ,
	compteur_debut   INT  NOT NULL ,
	compteur_fin     INT  NOT NULL ,
	id_client        INT  NOT NULL ,
	id_voiture       INT  NOT NULL  ,
	CONSTRAINT Location_PK PRIMARY KEY (id_location)

	,CONSTRAINT Location_Client_FK FOREIGN KEY (id_client) REFERENCES public.Client(id_client)
	,CONSTRAINT Location_Voiture0_FK FOREIGN KEY (id_voiture) REFERENCES public.Voiture(id_voiture)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: choix
------------------------------------------------------------
CREATE TABLE public.choix(
	id_option     INT  NOT NULL ,
	id_location   INT  NOT NULL  ,
	CONSTRAINT choix_PK PRIMARY KEY (id_option,id_location)

	,CONSTRAINT choix_Option_FK FOREIGN KEY (id_option) REFERENCES public.Option(id_option)
	,CONSTRAINT choix_Location0_FK FOREIGN KEY (id_location) REFERENCES public.Location(id_location)
)WITHOUT OIDS;



