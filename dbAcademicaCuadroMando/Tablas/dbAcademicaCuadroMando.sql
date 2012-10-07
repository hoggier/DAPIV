-- =============================================
-- Script Template
-- =============================================
create database dbAcademicaCuadroMando
go
exec sp_addtype codigo,'bigint','not null'
go
create table dpto
(
	iddpto codigo primary key,
	nombre_dpto varchar(90) not null
)
go 
create table provincia
(
	idprovincia codigo primary key,
	nombre_provincia varchar(90) not null,
	iddpto codigo references dpto(iddpto)
)
go
create table ciudad
(
	idciudad codigo primary key,
	nombre_ciudad varchar(90) not null,
	idprovincia codigo references provincia(idprovincia)
)
go
create table estudiante
(
	idestudiante codigo primary key,
	nombre_estudiante varchar(90) not null,
	app varchar(90) not null,
	apm varchar(90) not null,
	fecha_nacimiento datetime not null,
	sexo char not null check(sexo='M' or sexo ='F'),
	idciudad codigo references ciudad(idciudad)
)
go
create table etapas_vida(
	idetapa codigo primary key,
	nombre_etapa varchar(30),
	descripcion varchar(30)
)
go
create table materia
(
	idmateria codigo primary key not null,
	nombre_materia varchar(90) not null,
)
go
create table universidad
(
	iduniversidad codigo primary key not null,
	nombre_universidad varchar(90) not null,
)
go
create table facultad
(
	idfacultad codigo primary key not null,
	nombre_facultad varchar(90) not null,
	iduniversidad codigo references Universidad(iduniversidad),
)
go
create table carrera
(
	idcarrera codigo primary key not null,
	nombre_carrera varchar(90) not null,
	idfacultad codigo references Facultad(idfacultad),
)
go
create table carrera_materia
(
	idcarrera codigo references carrera(idcarrera),
	idmateria codigo references Materia(idmateria),
	nro_credito codigo not null,
)
go
create table inscripcion 
(
	idestudiante codigo references estudiante(idestudiante),
	idmateria codigo references Materia(idmateria),
	fecha_inscripcion datetime not null,
)
go
create table gestion
(
	idgestion codigo primary key not null,
	nombre_gestion varchar(90) not null,
)
go
create table semestre 
(
	idsemestre codigo primary key not null,
	nombre_semestre varchar(90) not null,
	idgestion codigo references gestion(idgestion),
)
go
create table modulo
(
	idmodulo codigo primary key not null,
	nombre_modulo varchar(90) not null,
	idsemestre codigo references semestre(idsemestre),
)
go
create table docente
(
	iddocente codigo  primary key not null,
	nombre_docente varchar(90) not null,
	app varchar(90) not null,
	apm varchar(90) not null,
)
go
create table docente_materia
(
	iddocente codigo references docente(iddocente),
	idMateria codigo references materia(idmateria),
	gestion int not null,
	semestre int not null,
	modulo int not null,
)
go
create table grado_formacion
(
	idgrado_formacion codigo primary key,
	nombregrado_formacion varchar(90)
)
go
create table formacion_docente
(
	iddocente codigo references docente(iddocente),
	idgrado_formacion codigo references grado_formacion(iddocente),
	titulo_obtenido varchar(50)
)