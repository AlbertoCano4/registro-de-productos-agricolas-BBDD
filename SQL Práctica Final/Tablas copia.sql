CREATE TABLE Entidad_Reguladora
(
  CodEntidadReguladora INT NOT NULL,
  PRIMARY KEY (CodEntidadReguladora)
);

CREATE TABLE Proceso_producción
(
  CodProc VARCHAR(20) NOT NULL,
  Nombre VARCHAR(30) NOT NULL,
  TipoProceso VARCHAR(20) NOT NULL,
  Supervisor VARCHAR(30) NOT NULL,
  Herramientas VARCHAR(200) NOT NULL,
  CodEntidadReguladora INT NOT NULL,
  PRIMARY KEY (CodProc),
  FOREIGN KEY (CodEntidadReguladora) REFERENCES Entidad_Reguladora(CodEntidadReguladora)
);

CREATE TABLE Producto
(
  codProducto VARCHAR(12) NOT NULL,
  codRegistro_sanitario VARCHAR(15) NOT NULL,
  FechaValidacion DATE NOT NULL,
  Descripción VARCHAR(200) NOT NULL,
  Descripción_Composicion VARCHAR(200) NOT NULL,
  Calle VARCHAR(20) NOT NULL,
  Número NUMERIC(3) NOT NULL,
  CodProc VARCHAR(20) NOT NULL,
  PRIMARY KEY (codProducto),
  FOREIGN KEY (CodProc) REFERENCES Proceso_producción(CodProc)
);

CREATE TABLE aceite_de_oliva_
(
  acidez_ NUMERIC(3) NOT NULL,
  cordGPS VARCHAR(20) NOT NULL,
  diario NUMERIC(2) NOT NULL,
  semanal NUMERIC(2) NOT NULL,
  mensual VARCHAR(2) NOT NULL,
  composición_química_suelo VARCHAR(30) NOT NULL,
  codProducto VARCHAR(12) NOT NULL,
  PRIMARY KEY (codProducto),
  FOREIGN KEY (codProducto) REFERENCES Producto(codProducto)
);

CREATE TABLE vino
(
  graduación NUMERIC(3) NOT NULL,
  blanco VARCHAR(20) NOT NULL,
  espumoso VARCHAR(20) NOT NULL,
  blanco VARCHAR(20) NOT NULL,
  tinto VARCHAR(20) NOT NULL,
  cordGPS VARCHAR(20) NOT NULL,
  diario_ NUMERIC(2) NOT NULL,
  semanal NUMERIC(2) NOT NULL,
  mensual NUMERIC(2) NOT NULL,
  composición_química_suelo VARCHAR(30) NOT NULL,
  codProducto VARCHAR(12) NOT NULL,
  PRIMARY KEY (codProducto),
  FOREIGN KEY (codProducto) REFERENCES Producto(codProducto)
);

CREATE TABLE Lácteos_
(
  temperatura_Minima NUMERIC(2,2) NOT NULL,
  caducidad_ DATE NOT NULL,
  yogur VARCHAR(20) NOT NULL,
  queso VARCHAR(20) NOT NULL,
  codProducto VARCHAR(12) NOT NULL,
  PRIMARY KEY (codProducto),
  FOREIGN KEY (codProducto) REFERENCES Producto(codProducto)
);

CREATE TABLE Fertilizantes_y_agroquímicos_
(
  CodProducto VARCHAR(20) NOT NULL,
  Denominación VARCHAR(50) NOT NULL,
  Fabricante VARCHAR(40) NOT NULL,
  Diaria NUMERIC(2) NOT NULL,
  Mensual NUMERIC(2) NOT NULL,
  Semanal NUMERIC(4) NOT NULL,
  NIF_Persona_Responsable VARCHAR(15) NOT NULL,
  PRIMARY KEY (CodProducto)
);

CREATE TABLE Granja
(
  cordGPS VARCHAR(20) NOT NULL,
  NIF_titular VARCHAR(30) NOT NULL,
  PRIMARY KEY (cordGPS),
  UNIQUE (NIF_titular)
);

CREATE TABLE Tratamiento
(
  CodMedicamento VARCHAR(30) NOT NULL,
  CodFabricante VARCHAR(20) NOT NULL,
  FechaAplicacion_ DATE NOT NULL,
  FechaCaducidad DATE NOT NULL,
  NIF_responsable VARCHAR(20) NOT NULL,
  PRIMARY KEY (CodMedicamento)
);

CREATE TABLE Alimentos
(
  codAlimento INT NOT NULL,
  PRIMARY KEY (codAlimento)
);

CREATE TABLE Pienso
(
  codLote VARCHAR(20) NOT NULL,
  CodFabricante VARCHAR(20) NOT NULL,
  codAlimento INT NOT NULL,
  PRIMARY KEY (codAlimento),
  FOREIGN KEY (codAlimento) REFERENCES Alimentos(codAlimento)
);

CREATE TABLE Pasto
(
  codAlimento INT NOT NULL,
  PRIMARY KEY (codAlimento),
  FOREIGN KEY (codAlimento) REFERENCES Alimentos(codAlimento)
);

CREATE TABLE Cereales
(
  codAlimento INT NOT NULL,
  PRIMARY KEY (codAlimento),
  FOREIGN KEY (codAlimento) REFERENCES Alimentos(codAlimento)
);

CREATE TABLE Veterinario
(
  CodMedicamento VARCHAR(30) NOT NULL,
  PRIMARY KEY (CodMedicamento),
  FOREIGN KEY (CodMedicamento) REFERENCES Tratamiento(CodMedicamento)
);

CREATE TABLE Vacuna
(
  CodMedicamento VARCHAR(30) NOT NULL,
  PRIMARY KEY (CodMedicamento),
  FOREIGN KEY (CodMedicamento) REFERENCES Tratamiento(CodMedicamento)
);

CREATE TABLE Fabrica
(
  LocalizacionGPS VARCHAR(20) NOT NULL,
  NIF_empresa/persona VARCHAR(10) NOT NULL,
  Mail VARCHAR(40) NOT NULL,
  codRegistro_sanitario VARCHAR(30) NOT NULL,
  FechaValidez DATE NOT NULL,
  dia NUMERIC(2) NOT NULL,
  mes NUMERIC(2) NOT NULL,
  año NUMERIC(4) NOT NULL,
  PRIMARY KEY (LocalizacionGPS)
);

CREATE TABLE Mayorista/intermediario
(
  NIF VARCHAR(10) NOT NULL,
  web VARCHAR(50) NOT NULL,
  correo VARCHAR(40) NOT NULL,
  denominación VARCHAR(100) NOT NULL,
  ubicación VARCHAR(50) NOT NULL,
  transporte_mercancias VARCHAR(15) NOT NULL,
  transporte_alimentos VARCHAR(15) NOT NULL,
  mercancia VARCHAR(15) NOT NULL,
  alimentos VARCHAR(15) NOT NULL,
  NIF_responsable INT NOT NULL,
  NIF_EmpresaLogistica INT NOT NULL,
  PRIMARY KEY (NIF)
);

CREATE TABLE Ingrediente/Quimico
(
  CodQuimico INT NOT NULL,
  FechaSalida DATE NOT NULL,
  Destinatario VARCHAR(200) NOT NULL,
  Empresa_Logistica VARCHAR(100) NOT NULL,
  PRIMARY KEY (CodQuimico)
);

CREATE TABLE Envases
(
  CodEnvase VARCHAR(30) NOT NULL,
  NIFFabricante VARCHAR(30) NOT NULL,
  Factor_Resistencia VARCHAR(20) NOT NULL,
  Opacidad NUMERIC(3) NOT NULL,
  LocalizacionGPS VARCHAR(20) NOT NULL,
  PRIMARY KEY (CodEnvase),
  FOREIGN KEY (LocalizacionGPS) REFERENCES Fabrica(LocalizacionGPS)
);

CREATE TABLE Comunicación
(
  CodComunicacion VARCHAR(20) NOT NULL,
  CodEntidadReguladora INT NOT NULL,
  PRIMARY KEY (CodComunicacion),
  FOREIGN KEY (CodEntidadReguladora) REFERENCES Entidad_Reguladora(CodEntidadReguladora)
);

CREATE TABLE Venta
(
  CodVenta VARCHAR(15) NOT NULL,
  codProducto VARCHAR(12) NOT NULL,
  NIF VARCHAR(10) NOT NULL,
  PRIMARY KEY (CodVenta),
  FOREIGN KEY (codProducto) REFERENCES Producto(codProducto),
  FOREIGN KEY (NIF) REFERENCES Mayorista/intermediario(NIF)
);

CREATE TABLE Alerta
(
  codAlerta VARCHAR(20) NOT NULL,
  Tipo VARCHAR(200) NOT NULL,
  FechaDeteccion DATE NOT NULL,
  Intervencion VARCHAR(100) NOT NULL,
  CodEntidadReguladora INT NOT NULL,
  PRIMARY KEY (codAlerta),
  FOREIGN KEY (CodEntidadReguladora) REFERENCES Entidad_Reguladora(CodEntidadReguladora)
);

CREATE TABLE contener
(
  CodProducto VARCHAR(20) NOT NULL,
  codProducto VARCHAR(12) NOT NULL,
  PRIMARY KEY (CodProducto, codProducto),
  FOREIGN KEY (CodProducto) REFERENCES Fertilizantes_y_agroquímicos_(CodProducto),
  FOREIGN KEY (codProducto) REFERENCES Producto(codProducto)
);

CREATE TABLE Elaborar
(
  codProducto VARCHAR(12) NOT NULL,
  LocalizacionGPS VARCHAR(20) NOT NULL,
  PRIMARY KEY (codProducto, LocalizacionGPS),
  FOREIGN KEY (codProducto) REFERENCES Producto(codProducto),
  FOREIGN KEY (LocalizacionGPS) REFERENCES Fabrica(LocalizacionGPS)
);

CREATE TABLE Incorpora
(
  CodProc VARCHAR(20) NOT NULL,
  CodQuimico INT NOT NULL,
  PRIMARY KEY (CodProc, CodQuimico),
  FOREIGN KEY (CodProc) REFERENCES Proceso_producción(CodProc),
  FOREIGN KEY (CodQuimico) REFERENCES Ingrediente/Quimico(CodQuimico)
);

CREATE TABLE Mayorista/intermediario_telefono
(
  telefono VARCHAR(15) NOT NULL,
  NIF VARCHAR(10) NOT NULL,
  PRIMARY KEY (telefono, NIF),
  FOREIGN KEY (NIF) REFERENCES Mayorista/intermediario(NIF)
);

CREATE TABLE Productores
(
  NIF VARCHAR(9) NOT NULL,
  Denominación VARCHAR(50) NOT NULL,
  web VARCHAR(50) NOT NULL,
  Sociedad_Anonima VARCHAR(20) NOT NULL,
  Sociedad_Limitada VARCHAR(20) NOT NULL,
  Autonomo VARCHAR(20) NOT NULL,
  urgencia VARCHAR(15) NOT NULL,
  normal VARCHAR(15) NOT NULL,
  semanal NUMERIC(9) NOT NULL,
  diaria NUMERIC(9) NOT NULL,
  anual NUMERIC(9) NOT NULL,
  empresas VARCHAR(50) NOT NULL,
  actividades_alimentarias VARCHAR(100) NOT NULL,
  Inicio_autorización DATE NOT NULL,
  Fin_autorización DATE NOT NULL,
  CodEntidadReguladora INT NOT NULL,
  CodComunicacion VARCHAR(20) NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (CodEntidadReguladora) REFERENCES Entidad_Reguladora(CodEntidadReguladora),
  FOREIGN KEY (CodComunicacion) REFERENCES Comunicación(CodComunicacion)
);

CREATE TABLE Empresa
(
  NIF VARCHAR(9) NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Productores(NIF)
);

CREATE TABLE Autonomo
(
  NIF VARCHAR(9) NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Productores(NIF)
);

CREATE TABLE Gestor_Responsable
(
  NIF VARCHAR(9) NOT NULL,
  Nombre VARCHAR(15) NOT NULL,
  Apellidos VARCHAR(20) NOT NULL,
  FechaNacimiento DATE NOT NULL,
  Fecha_Inicio_Responsabilidad DATE NOT NULL,
  Edad NUMERIC(3) NOT NULL,
  titulación VARCHAR(40) NOT NULL,
  correo_electrónico VARCHAR(30) NOT NULL,
  telefono_urgencia VARCHAR(15) NOT NULL,
  NIF VARCHAR(9) NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (NIF) REFERENCES Productores(NIF)
);

CREATE TABLE Animales
(
  CodigoTrazabilidad VARCHAR(20) NOT NULL,
  Complementos_suministrados VARCHAR(20) NOT NULL,
  cordGPS VARCHAR(20) NOT NULL,
  PRIMARY KEY (CodigoTrazabilidad),
  FOREIGN KEY (cordGPS) REFERENCES Granja(cordGPS)
);

CREATE TABLE Producir
(
  codProducto VARCHAR(12) NOT NULL,
  CodigoTrazabilidad VARCHAR(20) NOT NULL,
  PRIMARY KEY (codProducto, CodigoTrazabilidad),
  FOREIGN KEY (codProducto) REFERENCES Lácteos_(codProducto),
  FOREIGN KEY (CodigoTrazabilidad) REFERENCES Animales(CodigoTrazabilidad)
);

CREATE TABLE Suministrar
(
  CodMedicamento VARCHAR(30) NOT NULL,
  CodigoTrazabilidad VARCHAR(20) NOT NULL,
  PRIMARY KEY (CodMedicamento, CodigoTrazabilidad),
  FOREIGN KEY (CodMedicamento) REFERENCES Tratamiento(CodMedicamento),
  FOREIGN KEY (CodigoTrazabilidad) REFERENCES Animales(CodigoTrazabilidad)
);

CREATE TABLE Consumir
(
  CodigoTrazabilidad VARCHAR(20) NOT NULL,
  codAlimento INT NOT NULL,
  PRIMARY KEY (CodigoTrazabilidad, codAlimento),
  FOREIGN KEY (CodigoTrazabilidad) REFERENCES Animales(CodigoTrazabilidad),
  FOREIGN KEY (codAlimento) REFERENCES Alimentos(codAlimento)
);

CREATE TABLE Productores_correo_electrónico
(
  correo_electrónico INT NOT NULL,
  NIF VARCHAR(9) NOT NULL,
  PRIMARY KEY (correo_electrónico, NIF),
  FOREIGN KEY (NIF) REFERENCES Productores(NIF)
);