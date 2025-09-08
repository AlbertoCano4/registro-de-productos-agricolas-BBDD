# registro-de-productos-agricolas-BBDD
# 📊 Descripción del Proyecto

Este proyecto es un **trabajo final para un curso de Bases de Datos**, centrado en el diseño, implementación y migración de una base de datos para un sistema de **trazabilidad de productos alimentarios**.  

El trabajo abarca desde la planificación inicial hasta el análisis de riesgos y una propuesta de migración a un entorno en la nube (**DBaaS**).  

**Equipo de desarrollo:**  
- Sofia Azpiroz  
- Gonzalo Ruiz  
- Iván Mier  
- Paloma Belenguer  
- Gabriela Fernández  
- Alberto Cano  
- Nacho Fernández  

📅 **Fecha de finalización:** 8 de diciembre de 2023  

---

## 🚀 Fases del Proyecto

### 1. Planificación del trabajo
- Lectura y análisis del problema.  
- Reparto de tareas.  
- Organización de reuniones grupales.  

### 2. Modelo conceptual de datos
- Identificación de **entidades, relaciones y atributos**.  
- Creación de un **diagrama entidad-relación (E/R)**.  
- Elaboración de un **diccionario de datos** con entidades como:  
  - Gestor Responsable  
  - Productor  
  - Empresa  
  - Proceso de producción  
  - Alerta  

### 3. Modelo lógico de datos
- Conversión del modelo conceptual en un **modelo extendido**.  
- Revisión y ordenamiento de relaciones.  
- Creación de un nuevo **diccionario de datos**.  

### 4. Modelo físico de datos
- Traducción del modelo lógico a **código SQL para Oracle**.  
- Programación de:  
  - Sentencias `CREATE TABLE` con restricciones.  
  - Sentencias `INSERT` para poblar la base de datos.  
  - **Consultas (QUERIES)** para la extracción de información.  

---

## 🛡️ Seguridad y Migración

### Análisis de riesgos
Se identificaron riesgos potenciales en la implementación de la base de datos, tales como:  
- Violación de restricciones de integridad.  
- Exposición de datos sensibles.  
- Contraseñas débiles.  
- Inyección SQL.  
- Falta de actualizaciones.  
- Acceso no autorizado.  
- Duplicación o inconsistencia de datos.  

### Migración a DBaaS
- **Proveedor elegido:** Oracle Cloud.  
- **Justificación:**  
  - Compatibilidad con Oracle Database y APEX.  
  - Fluida integración.  
  - Disponibilidad de la base de datos autónoma de Oracle.  
- **Entrega:**  
  - Requerimientos para el servicio.  
  - Esquema de **scripts de exportación e importación de datos**.  

---

## 🔗 Enlaces

📹 [Video acreditativo del trabajo](https://youtu.be/sbFhXJZrjAQ)  
