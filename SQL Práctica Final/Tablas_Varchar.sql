CREATE TABLE Entidad_Reguladora (
  CodEntidadReguladora VARCHAR2(12),
  CONSTRAINT PK_Entidad_Reguladora PRIMARY KEY (CodEntidadReguladora)
);

CREATE TABLE Proceso_producción (
  CodProc VARCHAR2(20),
  Nombre VARCHAR2(30) NOT NULL,
  TipoProceso VARCHAR2(20) NOT NULL,
  Supervisor VARCHAR2(30) NOT NULL,
  Herramientas VARCHAR2(200) NOT NULL,
  CodEntidadReguladora VARCHAR2(12) NOT NULL,
  CONSTRAINT PK_Proceso_producción PRIMARY KEY (CodProc),
  CONSTRAINT Proceso_producción_FK_Entidad_Reguladora FOREIGN KEY (CodEntidadReguladora) REFERENCES Entidad_Reguladora(CodEntidadReguladora)
);

CREATE TABLE Producto (
  codProducto VARCHAR2(12),
  codRegistro_sanitario VARCHAR2(15) NOT NULL UNIQUE,
  FechaValidacion DATE NOT NULL,
  Descripción VARCHAR2(2000) NOT NULL,
  Descripción_Composicion VARCHAR2(2000) NOT NULL,
  Calle VARCHAR2(100) NOT NULL,
  Número NUMBER(4) NOT NULL,
  CodProc VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_Producto PRIMARY KEY (codProducto),
  CONSTRAINT Producto_FK_Proceso_producción FOREIGN KEY (CodProc) REFERENCES Proceso_producción(CodProc),
  CONSTRAINT CHK_FechaValidacion CHECK (FechaValidacion <= Sysdate),
  CONSTRAINT CHK_Numero CHECK(Número > 0)
);

CREATE TABLE aceite_de_oliva_ (
  acidez NUMBER(3),
  cordGPS VARCHAR2(20) NOT NULL UNIQUE,
  Riego VARCHAR2(20) NOT NULL,
  composición_química_suelo VARCHAR2(30) NOT NULL,
  codProducto VARCHAR2(12) NOT NULL,
  CONSTRAINT PK_aceite_de_oliva_ PRIMARY KEY (codProducto),
  CONSTRAINT aceite_de_oliva_FK_Producto FOREIGN KEY (codProducto) REFERENCES Producto(codProducto),
  CONSTRAINT CHK_Acidez CHECK(Acidez >= 0)
  
);

CREATE TABLE vino (
  codProducto VARCHAR2(12),
  graduación NUMBER(3) NOT NULL, 
  Tipo VARCHAR2(20) NOT NULL,
  cordGPS VARCHAR2(20) NOT NULL UNIQUE,
  Riego VARCHAR2(20) NOT NULL,
  composición_química_suelo VARCHAR2(30) NOT NULL,
  CONSTRAINT PK_vino PRIMARY KEY (codProducto),
  CONSTRAINT vino_FK_Producto FOREIGN KEY (codProducto) REFERENCES Producto(codProducto),
  CONSTRAINT CHK_Vino CHECK (Tipo = 'blanco' OR Tipo = 'tinto' OR Tipo = 'espumoso' OR Tipo = 'rosado')

);

CREATE TABLE Lácteos (
  temperatura_Minima NUMBER(4,2) NOT NULL,
  caducidad DATE NOT NULL,
  tipo VARCHAR2(200)NOT NULL,
  codProducto VARCHAR2(12) NOT NULL,
  CONSTRAINT PK_Lácteos PRIMARY KEY (codProducto),
  CONSTRAINT Lácteos_FK_Producto FOREIGN KEY (codProducto) REFERENCES Producto(codProducto),
  CONSTRAINT CHK_Lacteos CHECK (Tipo = 'yogur' OR Tipo = 'leche'),
  CONSTRAINT CHK_caducidad CHECK (caducidad >= Sysdate)
);

CREATE TABLE Fertilizantes_y_agroquímicos_ (
  CodProducto VARCHAR2(20) NOT NULL,
  Denominación VARCHAR2(50) NOT NULL,
  Fabricante VARCHAR2(40) NOT NULL,
  Diaria NUMBER(2) NOT NULL,
  Mensual NUMBER(2) NOT NULL,
  Semanal NUMBER(4) NOT NULL,
  NIF_Persona_Responsable VARCHAR2(15) NOT NULL,
  CONSTRAINT PK_Fertilizantes_y_agroquímicos_ PRIMARY KEY (CodProducto),
  CONSTRAINT CHK_diario CHECK(diario >= 0),
  CONSTRAINT CHK_semanal CHECK(semanal >= 0),
  CONSTRAINT CHK_mensual CHECK(mensual >= 0)
);

CREATE TABLE Granja (
  cordGPS VARCHAR2(20) NOT NULL,
  NIF_titular VARCHAR2(30) NOT NULL,
  CONSTRAINT PK_Granja PRIMARY KEY (cordGPS),
  CONSTRAINT Granja_FK_NIF_titular UNIQUE (NIF_titular)
);

CREATE TABLE Tratamiento (
  CodMedicamento VARCHAR2(30),
  CodFabricante VARCHAR2(20) NOT NULL,
  FechaAplicacion DATE NOT NULL,
  FechaCaducidad DATE NOT NULL,
  NIF_responsable VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_Tratamiento PRIMARY KEY (CodMedicamento),
  CONSTRAINT CHK_FechaCaducidad CHECK (FechaCaducidad>=Sysdate),
  CONSTRAINT CHK_FechaAplicacion CHECK (FechaAplicacion<= FechaCaducidad)


);

CREATE TABLE Alimentos (
  codAlimento NUMBER,
  CONSTRAINT PK_Alimentos PRIMARY KEY (codAlimento)
);

CREATE TABLE Pienso (
  codLote VARCHAR2(20),
  CodFabricante VARCHAR2(20) NOT NULL,
  codAlimento NUMBER NOT NULL,
  CONSTRAINT PK_Pienso PRIMARY KEY (codLote),
  CONSTRAINT Pienso_FK_Alimentos FOREIGN KEY (codAlimento) REFERENCES Alimentos(codAlimento)
);

CREATE TABLE Pasto (
  codAlimento NUMBER,
  CONSTRAINT PK_Pasto PRIMARY KEY (codAlimento),
  CONSTRAINT Pasto_FK_Alimentos FOREIGN KEY (codAlimento) REFERENCES Alimentos(codAlimento)
);

CREATE TABLE Cereales (
  codAlimento NUMBER,
  CONSTRAINT PK_Cereales PRIMARY KEY (codAlimento),
  CONSTRAINT Cereales_FK_Alimentos FOREIGN KEY (codAlimento) REFERENCES Alimentos(codAlimento)
);

CREATE TABLE Veterinario (
  CodMedicamento VARCHAR2(30),
  CONSTRAINT PK_Veterinario PRIMARY KEY (CodMedicamento),
  CONSTRAINT Veterinario_FK_Tratamiento FOREIGN KEY (CodMedicamento) REFERENCES Tratamiento(CodMedicamento)
);

CREATE TABLE Vacuna (
  CodMedicamento VARCHAR2(30),
  CONSTRAINT PK_Vacuna PRIMARY KEY (CodMedicamento),
  CONSTRAINT FK_Vacuna_Tratamiento FOREIGN KEY (CodMedicamento) REFERENCES Tratamiento(CodMedicamento)
);

CREATE TABLE Fabrica (
  LocalizacionGPS VARCHAR2(20),
  NIF_empresa_persona VARCHAR2(10) NOT NULL,
  Mail VARCHAR2(40) NOT NULL,
  codRegistro_sanitario VARCHAR2(30) NOT NULL,
  FechaValidez DATE NOT NULL,
  dia NUMBER(2) NOT NULL,
  mes NUMBER(2) NOT NULL,
  año NUMBER(4) NOT NULL,
  Calle VARCHAR2(100) NOT NULL,
  Numero VARCHAR2 (3) NOT NULL,
  CP NUMERIC (5) NOT NULL,
  CONSTRAINT PK_Fabrica PRIMARY KEY (LocalizacionGPS),
  CONSTRAINT CHK_FechaValidez CHECK (FechaValidez>=Sysdate)

);

CREATE TABLE Mayorista_intermediario (
  NIF VARCHAR2(10) NOT NULL,
  web VARCHAR2(50) NOT NULL,
  correo VARCHAR2(40) NOT NULL,
  denominación VARCHAR2(100) NOT NULL,
  ubicación VARCHAR2(50) NOT NULL,
  transporte_mercancias VARCHAR2(15) NOT NULL,
  transporte_alimentos VARCHAR2(15) NOT NULL,
  mercancia VARCHAR2(15) NOT NULL,
  alimentos VARCHAR2(15) NOT NULL,
  NIF_responsable NUMBER(10) NOT NULL,
  NIF_EmpresaLogistica NUMBER(10) NOT NULL,
  Calle VARCHAR2(100) NOT NULL,
  Numero VARCHAR2 (3) NOT NULL,
  CP NUMERIC (5) NOT NULL,
  CONSTRAINT PK_Mayorista_intermediario PRIMARY KEY (NIF)
);

CREATE TABLE Ingrediente_Quimico (
  CodQuimico NUMERIC (50),
  FechaSalida DATE NOT NULL,
  Destinatario VARCHAR2(200) NOT NULL,
  Empresa_Logistica VARCHAR2(100) NOT NULL,
  CONSTRAINT PK_Ingrediente_Quimico PRIMARY KEY (CodQuimico),
  CONSTRAINT CHK_Ingrediente_Quimico CHECK (FechaSalida >= Sysdate)
);

CREATE TABLE Envases (
  CodEnvase VARCHAR2(30),
  NIFFabricante VARCHAR2(30) NOT NULL,
  Factor_Resistencia VARCHAR2(20) NOT NULL,
  Opacidad NUMBER(3) NOT NULL,
  LocalizacionGPS VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_Envases PRIMARY KEY (CodEnvase),
  CONSTRAINT Envases_FK_Fabrica FOREIGN KEY (LocalizacionGPS) REFERENCES Fabrica(LocalizacionGPS)
);

CREATE TABLE Comunicación (
  CodComunicacion VARCHAR2(20),
  CodEntidadReguladora NUMBER NOT NULL,
  CONSTRAINT PK_Comunicación PRIMARY KEY (CodComunicacion),
  CONSTRAINT Comunicación_FK_Entidad_Reguladora FOREIGN KEY (CodEntidadReguladora) REFERENCES Entidad_Reguladora(CodEntidadReguladora)
);

CREATE TABLE Venta (
  CodVenta VARCHAR2(15),
  codProducto VARCHAR2(12) NOT NULL,
  NIF VARCHAR2(10) NOT NULL,
  CONSTRAINT PK_Venta PRIMARY KEY (CodVenta),
  CONSTRAINT Venta_FK_Producto FOREIGN KEY (codProducto) REFERENCES Producto(codProducto),
  CONSTRAINT Venta_FK_Mayorista_intermediario FOREIGN KEY (NIF) REFERENCES Mayorista/intermediario(NIF)
);

CREATE TABLE Alerta (
  codAlerta VARCHAR2(20),
  Tipo VARCHAR2(200) NOT NULL,
  FechaDeteccion DATE NOT NULL,
  Intervencion VARCHAR2(100) NOT NULL,
  CodEntidadReguladora NUMBER NOT NULL,
  CONSTRAINT PK_Alerta PRIMARY KEY (codAlerta),
  CONSTRAINT Alerta_FK_Entidad_Reguladora FOREIGN KEY (CodEntidadReguladora) REFERENCES Entidad_Reguladora(CodEntidadReguladora),
  CONSTRAINT CHK_Alerta CHECK (Tipo = 'A' OR Tipo = 'B' OR Tipo = 'E' OR Tipo = 'F'),
  CONSTRAINT CHK_Alerta CHECK (FechaDeteccion >= Sysdate)
);

CREATE TABLE contener (
  CodProducto VARCHAR2(20),
  codProductoFertilizante VARCHAR2(12) NOT NULL,
  CONSTRAINT PK_contener PRIMARY KEY (CodProducto, codProducto),
  CONSTRAINT contener_FK_Fertilizantes_agroquímicos FOREIGN KEY (codProductoFertilizante) REFERENCES Fertilizantes_y_agroquímicos_(CodProducto),
  CONSTRAINT contener_FK_Producto FOREIGN KEY (codProducto) REFERENCES Producto(codProducto)
);

CREATE TABLE Elaborar (
  codProducto VARCHAR2(12),
  LocalizacionGPS VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_Elaborar PRIMARY KEY (codProducto, LocalizacionGPS),
  CONSTRAINT Elaborar_FK_Producto FOREIGN KEY (codProducto) REFERENCES Producto(codProducto),
  CONSTRAINT Elaborar_FK_Fabrica FOREIGN KEY (LocalizacionGPS) REFERENCES Fabrica(LocalizacionGPS)
);

CREATE TABLE Incorpora (
  CodProc VARCHAR2(20),
  CodQuimico NUMBER NOT NULL,
  CONSTRAINT PK_Incorpora PRIMARY KEY (CodProc, CodQuimico),
  CONSTRAINT Incorpora_FK_Proceso_producción FOREIGN KEY (CodProc) REFERENCES Proceso_producción(CodProc),
  CONSTRAINT Incorpora_FK_Ingrediente_Quimico FOREIGN KEY (CodQuimico) REFERENCES Ingrediente/Quimico(CodQuimico)
);

CREATE TABLE Mayorista/intermediario_telefono (
  telefono VARCHAR2(15) NOT NULL,
  NIF VARCHAR2(10) NOT NULL,
  CONSTRAINT PK_Mayorista_intermediario_telefono PRIMARY KEY (telefono, NIF),
  CONSTRAINT Mayorista_intermediario_FK_telefono FOREIGN KEY (NIF) REFERENCES Mayorista/intermediario(NIF)
);

CREATE TABLE Productores (
  NIF VARCHAR2(9),
  Denominación VARCHAR2(50) NOT NULL,
  web VARCHAR2(50) NOT NULL,
  Tipo VARCHAR2(200) NOT NULL, 
  Telefono VARCHAR2(20) NOT NULL,
  semanal NUMBER(9) NOT NULL,
  diaria NUMBER(9) NOT NULL,
  anual NUMBER(9) NOT NULL,
  empresas VARCHAR2(50) NOT NULL,
  actividades_alimentarias VARCHAR2(100) NOT NULL,
  Inicio_autorización DATE NOT NULL,
  Fin_autorización DATE NOT NULL,
  CodEntidadReguladora NUMBER NOT NULL,
  CodComunicacion VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_Productores PRIMARY KEY (NIF),
  CONSTRAINT Productores_FK_Entidad_Reguladora FOREIGN KEY (CodEntidadReguladora) REFERENCES Entidad_Reguladora(CodEntidadReguladora),
  CONSTRAINT Productores_FK_Comunicación FOREIGN KEY (CodComunicacion) REFERENCES Comunicación(CodComunicacion),
  CONSTRAINT CHK_Productores (Tipo = 'SA' OR Tipo = 'SL' OR Tipo = 'autonomo' ),
  CONSTRAINT CHK_Fechas(Inicio_autorización<= Fin_autorización)
);

CREATE TABLE Empresa (
  NIF VARCHAR2(9),
  CONSTRAINT PK_Empresa PRIMARY KEY (NIF),
  CONSTRAINT Empresa_FK_Productores FOREIGN KEY (NIF) REFERENCES Productores(NIF)
);

CREATE TABLE Autonomo (
  NIF VARCHAR2(9) ,
  CONSTRAINT PK_Autonomo PRIMARY KEY (NIF),
  CONSTRAINT Autonomo_FK_Productores FOREIGN KEY (NIF) REFERENCES Productores(NIF)
);

CREATE TABLE Gestor_Responsable (
  NIF VARCHAR2(9) ,
  Nombre VARCHAR2(15) NOT NULL,
  Apellidos VARCHAR2(20) NOT NULL,
  FechaNacimiento DATE NOT NULL,
  Fecha_Inicio_Responsabilidad DATE NOT NULL,
  Edad NUMBER(3) NOT NULL,
  titulación VARCHAR2(40) NOT NULL,
  correo_electrónico VARCHAR2(30) NOT NULL,
  telefono_urgencia VARCHAR2(15) NOT NULL,
  NIF_Persona VARCHAR2(9) NOT NULL,
  CONSTRAINT PK_Gestor_Responsable PRIMARY KEY (NIF),
  CONSTRAINT Gestor_Responsable_FK_Productores FOREIGN KEY (NIF) REFERENCES Productores(NIF)

);

CREATE TABLE Animales (
  CodigoTrazabilidad VARCHAR2(20),
  Complementos_suministrados VARCHAR2(20) NOT NULL,
  cordGPS VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_Animales PRIMARY KEY (CodigoTrazabilidad),
  CONSTRAINT Animales_FK_Granja FOREIGN KEY (cordGPS) REFERENCES Granja(cordGPS)
);

CREATE TABLE Producir (
  codProducto VARCHAR2(12) ,
  CodigoTrazabilidad VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_Producir PRIMARY KEY (codProducto, CodigoTrazabilidad),
  CONSTRAINT Producir_FK_Lácteos FOREIGN KEY (codProducto) REFERENCES Lácteos_(codProducto),
  CONSTRAINT Producir_FK_Animales FOREIGN KEY (CodigoTrazabilidad) REFERENCES Animales(CodigoTrazabilidad)
);

CREATE TABLE Suministrar (
  CodMedicamento VARCHAR2(30),
  CodigoTrazabilidad VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_Suministrar PRIMARY KEY (CodMedicamento, CodigoTrazabilidad),
  CONSTRAINT Suministrar_FK_Tratamiento FOREIGN KEY (CodMedicamento) REFERENCES Tratamiento(CodMedicamento),
  CONSTRAINT Suministrar_FK_Animales FOREIGN KEY (CodigoTrazabilidad) REFERENCES Animales(CodigoTrazabilidad)
);

CREATE TABLE Consumir (
  CodigoTrazabilidad VARCHAR2(20),
  codAlimento NUMBER NOT NULL,
  CONSTRAINT PK_Consumir PRIMARY KEY (CodigoTrazabilidad, codAlimento),
  CONSTRAINT Consumir_FK_Animales FOREIGN KEY (CodigoTrazabilidad) REFERENCES Animales(CodigoTrazabilidad),
  CONSTRAINT Consumir_FK_Alimentos FOREIGN KEY (codAlimento) REFERENCES Alimentos(codAlimento)
);

CREATE TABLE Productores_correo_electrónico (
  correo_electrónico VARCHAR2 (40),
  NIF VARCHAR2(9) NOT NULL,
  CONSTRAINT PK_Productores_correo_electrónico PRIMARY KEY (correo_electrónico, NIF),
  CONSTRAINT Productores_correo_electrónico_FK_Productores FOREIGN KEY (NIF) REFERENCES Productores(NIF)
);
