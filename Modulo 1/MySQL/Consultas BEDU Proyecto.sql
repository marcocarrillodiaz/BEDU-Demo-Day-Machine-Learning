use proyecto;
#Post work 1
#1. Listar las empresas involucradas en el presupuesto:
SELECT Empresa,  Nombre FROM Empresa;
#2. Cuántos ejercicios están involucrados en el presupuesto:
SELECT DISTINCT Ejercicio FROM Presupuesto;
#3. ¿Cuál es la Clave con el importe de asignación más grande?
SELECT  d.clavepresupuestal FROM PresupuestoD d WHERE d.Tipo='Asignacion' ORDER BY Importe DESC LIMIT 1;
#4. Cuál es el origen de los movimientos de presupuesto:
SELECT DISTINCT ifnull(OModulo, 'PPTO') Origen FROM presupuesto;
#5. Cuántos registros existen para el ejercicio presupuestal 2022:
SELECT ppto.* FROM Presupuesto ppto WHERE ppto.Ejercicio=2022;

#Post work 2
#1.Listar el importe asignado de los ejercicios 2016 a 2021:
SELECT *, 
       (SELECT sum(Importe) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Importe 
  FROM Presupuesto ppto
 WHERE ppto.Movimiento!='Operacion'
   AND ppto.Ejercicio BETWEEN 2016 AND 2021;
#2. Cuantos Registros son por Ajuste de tipo de cambio:
SELECT count(1) AjusteTC
  FROM Presupuesto ppto
 WHERE ppto.Referencia LIKE 'Ajuste TC%';
#3. Cuál es el valor promedio disponible y disponible por periodo de los Ejercicios 2016 a 2021:
SELECT s.Ejercicio, s.Periodo, avg(s.DisponibleProm) DisponibleProm, sum(s.Disponible) Disponible
  FROM (SELECT ppto.Ejercicio,
               ppto.Periodo,
               (SELECT avg(Disponible) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) DisponibleProm,
               (SELECT sum(Disponible) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Disponible
          FROM Presupuesto ppto 
         WHERE ppto.Ejercicio BETWEEN 2016 AND 2021) s
 GROUP BY s.Ejercicio, s.Periodo;
#4. De cada fase del presupuesto, cuál es el valor promedio, real y su diferencia por ejercicio de 2016 a 2021:
SELECT s.Ejercicio, 
       sum(s.Fase0) Fase0,
       avg(s.PromFase0) PromFase0,
       sum(s.Fase0)-avg(s.PromFase0) DiferenciaFase0,
       sum(s.Fase1) Fase1,
       avg(s.PromFase1) PromFase1,
       sum(s.Fase1)-avg(s.PromFase1) DiferenciaFase1,
       sum(s.Fase2) Fase2,
       avg(s.PromFase2) PromFase2,
       sum(s.Fase2)-avg(s.PromFase2) DiferenciaFase2,
       sum(s.Fase3) Fase3,
       avg(s.PromFase3) PromFase3,
       sum(s.Fase3)-avg(s.PromFase3) DiferenciaFase3,
       sum(s.Fase4) Fase4,
       avg(s.PromFase4) PromFase4,
       sum(s.Fase4)-avg(s.PromFase4) DiferenciaFase4,
       sum(s.Disponible) Disponible,
       avg(s.PromDisponible) Disponible,
       sum(s.Disponible)-avg(s.PromDisponible) DiferenciaDisponible
  FROM (SELECT ppto.Ejercicio,
               (SELECT sum(Importe) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Importe,
               (SELECT sum(Presupuesto) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Presupuesto,
               (SELECT sum(Fase0) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Fase0,
               (SELECT sum(Fase1) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Fase1,
               (SELECT sum(Fase2) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Fase2,
               (SELECT sum(Fase3) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Fase3,
               (SELECT sum(Fase4) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Fase4,
               (SELECT sum(Disponible) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Disponible,
               
               (SELECT avg(Importe) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromImporte,
               (SELECT avg(Presupuesto) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromPresupuesto,
               (SELECT avg(Fase0) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromFase0,
               (SELECT avg(Fase1) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromFase1,
               (SELECT avg(Fase2) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromFase2,
               (SELECT avg(Fase3) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromFase3,
               (SELECT avg(Fase4) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromFase4,
               (SELECT avg(Disponible) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromDisponible
               
          FROM Presupuesto ppto 
         WHERE ppto.Ejercicio BETWEEN 2016 AND 2021) s
 GROUP BY s.Ejercicio;
#5. Desplegar el estado de cada una de las fases (Importe, Valor Promedio y diferencia) por Empresa y Proyecto, incluir Disponible.
SELECT s.Empresa, s.Proyecto, 
       sum(s.Fase0) Fase0,
       avg(s.PromFase0) PromFase0,
       sum(s.Fase0)-avg(s.PromFase0) DiferenciaFase0,
       sum(s.Fase1) Fase1,
       avg(s.PromFase1) PromFase1,
       sum(s.Fase1)-avg(s.PromFase1) DiferenciaFase1,
       sum(s.Fase2) Fase2,
       avg(s.PromFase2) PromFase2,
       sum(s.Fase2)-avg(s.PromFase2) DiferenciaFase2,
       sum(s.Fase3) Fase3,
       avg(s.PromFase3) PromFase3,
       sum(s.Fase3)-avg(s.PromFase3) DiferenciaFase3,
       sum(s.Fase4) Fase4,
       avg(s.PromFase4) PromFase4,
       sum(s.Fase4)-avg(s.PromFase4) DiferenciaFase4,
       sum(s.Disponible) Disponible,
       avg(s.PromDisponible) Disponible,
       sum(s.Disponible)-avg(s.PromDisponible) DiferenciaDisponible
  FROM (SELECT ppto.Empresa, ppto.Proyecto, ppto.Ejercicio,
               (SELECT sum(Importe) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Importe,
               (SELECT sum(Presupuesto) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Presupuesto,
               (SELECT sum(Fase0) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Fase0,
               (SELECT sum(Fase1) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Fase1,
               (SELECT sum(Fase2) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Fase2,
               (SELECT sum(Fase3) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Fase3,
               (SELECT sum(Fase4) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Fase4,
               (SELECT sum(Disponible) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) Disponible,
               
               (SELECT avg(Importe) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromImporte,
               (SELECT avg(Presupuesto) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromPresupuesto,
               (SELECT avg(Fase0) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromFase0,
               (SELECT avg(Fase1) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromFase1,
               (SELECT avg(Fase2) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromFase2,
               (SELECT avg(Fase3) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromFase3,
               (SELECT avg(Fase4) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromFase4,
               (SELECT avg(Disponible) FROM PresupuestoD d WHERE d.ID=ppto.ID AND d.Clave=ppto.Clave) PromDisponible
               
          FROM Presupuesto ppto 
         WHERE ppto.Ejercicio BETWEEN 2016 AND 2021) s
 GROUP BY s.Empresa, s.Proyecto;
 
#Post work 3
#Crea al menos 5 vistas de preguntas más complejas a lo que has trabajado durante el curso.
#R:Se replantearán las consultas de la sección anterior para optimizar los tiempos de respuesta.

 #1.  Listar el importe asignado de los ejercicios 2016 a 2021: 
select ppto.ID, ppto.Empresa, ppto.Movimiento, ppto.Consecutivo, ppto.Fecha, sum(pptoD.Importe) Importe
  from Presupuesto ppto
  left join PresupuestoD pptoD on ppto.Clave=pptoD.Clave and ppto.ID=pptoD.ID
 where ppto.Movimiento!='Operacion' and ppto.Ejercicio between 2016 and 2021
 group by ppto.ID, ppto.Empresa, ppto.Movimiento, ppto.Consecutivo, ppto.Fecha;
# Se crea la vista PptoAsignado1622
create or replace view PptoAsignado1622
    as
select ppto.ID, ppto.Empresa, ppto.Movimiento, ppto.Consecutivo, ppto.Fecha, sum(pptoD.Importe) Importe
  from Presupuesto ppto
  left join PresupuestoD pptoD on ppto.Clave=pptoD.Clave and ppto.ID=pptoD.ID
 where ppto.Movimiento!='Operacion' and ppto.Ejercicio between 2016 and 2021
 group by ppto.ID, ppto.Empresa, ppto.Movimiento, ppto.Consecutivo, ppto.Fecha;
# Consultamos la vista creada
select * from pptoasignado1622;

#2. Obtener el importe Promedio y asignado por periodo del ejercicio 2021:
select ppto.Periodo, sum(pptoD.Importe) Importe, avg(pptoD.Importe) PromImporte, sum(pptoD.Importe)-avg(pptoD.Importe) Diferencia
  from Presupuesto ppto
  left join PresupuestoD pptoD on ppto.Clave=pptoD.Clave and ppto.ID=pptoD.ID
 where ppto.Movimiento!='Operacion' and ppto.Ejercicio= 2021
 group by ppto.Periodo;
# Se crea la vista PptoPromVsAsignado
create or replace view PptoPromVsAsignado
    as
select ppto.Periodo, sum(pptoD.Importe) Importe, avg(pptoD.Importe) PromImporte, sum(pptoD.Importe)-avg(pptoD.Importe) Diferencia
  from Presupuesto ppto
  left join PresupuestoD pptoD on ppto.Clave=pptoD.Clave and ppto.ID=pptoD.ID
 where ppto.Movimiento!='Operacion' and ppto.Ejercicio= 2021
 group by ppto.Periodo;
# Consultamos la vista creada
select * from PptoPromVsAsignado;

#3. Desplegar el Importe real y promedio de cada fase del presupuesto por clave presupuestal:
select d.ClavePresupuestal,
        sum(d.Fase0) Fase0, avg(d.Fase0) PromFase0, sum(d.Fase0)-avg(d.Fase0) DiferenciaFase0,
        sum(d.Fase1) Fase1, avg(d.Fase1) PromFase1, sum(d.Fase1)-avg(d.Fase1) DiferenciaFase1,
        sum(d.Fase2) Fase2, avg(d.Fase2) PromFase2, sum(d.Fase2)-avg(d.Fase2) DiferenciaFase2,
        sum(d.Fase3) Fase3, avg(d.Fase3) PromFase3, sum(d.Fase3)-avg(d.Fase3) DiferenciaFase3,
        sum(d.Fase4) Fase4, avg(d.Fase4) PromFase4, sum(d.Fase4)-avg(d.Fase4) DiferenciaFase4,
        sum(d.Disponible) Disponible, avg(d.Disponible) PromDisponible, sum(d.Disponible)-avg(d.Disponible) DiferenciaDisponible
   from presupuesto p 
   join presupuestod d on d.Clave =p.Clave and d.ID =p.ID
   group by d.ClavePresupuestal;
# Se crea la vista PptoPromVReal
create or replace view PptoPromVReal
    as
select d.ClavePresupuestal,
        sum(d.Fase0) Fase0, avg(d.Fase0) PromFase0, sum(d.Fase0)-avg(d.Fase0) DiferenciaFase0,
        sum(d.Fase1) Fase1, avg(d.Fase1) PromFase1, sum(d.Fase1)-avg(d.Fase1) DiferenciaFase1,
        sum(d.Fase2) Fase2, avg(d.Fase2) PromFase2, sum(d.Fase2)-avg(d.Fase2) DiferenciaFase2,
        sum(d.Fase3) Fase3, avg(d.Fase3) PromFase3, sum(d.Fase3)-avg(d.Fase3) DiferenciaFase3,
        sum(d.Fase4) Fase4, avg(d.Fase4) PromFase4, sum(d.Fase4)-avg(d.Fase4) DiferenciaFase4,
        sum(d.Disponible) Disponible, avg(d.Disponible) PromDisponible, sum(d.Disponible)-avg(d.Disponible) DiferenciaDisponible
   from presupuesto p 
   join presupuestod d on d.Clave =p.Clave and d.ID =p.ID
   group by d.ClavePresupuestal;
# Consultamos la vista creada
select * from PptoPromVReal;

#4. Mostrar el Estado Actual del Presupuesto por Empresa, Proyecto y ClavePresupuestal, se den incluir cada una de las fases, su promedio y diferencia:
select p.Empresa,
        p.Proyecto,
        d.ClavePresupuestal,
        sum(d.Fase0) Fase0, avg(d.Fase0) PromFase0, sum(d.Fase0)-avg(d.Fase0) DiferenciaFase0,
        sum(d.Fase1) Fase1, avg(d.Fase1) PromFase1, sum(d.Fase1)-avg(d.Fase1) DiferenciaFase1,
        sum(d.Fase2) Fase2, avg(d.Fase2) PromFase2, sum(d.Fase2)-avg(d.Fase2) DiferenciaFase2,
        sum(d.Fase3) Fase3, avg(d.Fase3) PromFase3, sum(d.Fase3)-avg(d.Fase3) DiferenciaFase3,
        sum(d.Fase4) Fase4, avg(d.Fase4) PromFase4, sum(d.Fase4)-avg(d.Fase4) DiferenciaFase4,
        sum(d.Disponible) Disponible, avg(d.Disponible) PromDisponible, sum(d.Disponible)-avg(d.Disponible) DiferenciaDisponible
   from presupuesto p 
   join presupuestod d on d.Clave =p.Clave and d.ID =p.ID
   group by p.Empresa, p.Proyecto, d.ClavePresupuestal;
# Se crea la vista EstatusPresupuesto 
create or replace view EstatusPresupuesto 
as 
select p.Empresa,
       p.Proyecto,
       d.ClavePresupuestal,
       sum(d.Fase0) Fase0, avg(d.Fase0) PromFase0, sum(d.Fase0)-avg(d.Fase0) DiferenciaFase0,
       sum(d.Fase1) Fase1, avg(d.Fase1) PromFase1, sum(d.Fase1)-avg(d.Fase1) DiferenciaFase1,
       sum(d.Fase2) Fase2, avg(d.Fase2) PromFase2, sum(d.Fase2)-avg(d.Fase2) DiferenciaFase2,
       sum(d.Fase3) Fase3, avg(d.Fase3) PromFase3, sum(d.Fase3)-avg(d.Fase3) DiferenciaFase3,
       sum(d.Fase4) Fase4, avg(d.Fase4) PromFase4, sum(d.Fase4)-avg(d.Fase4) DiferenciaFase4,
       sum(d.Disponible) Disponible, avg(d.Disponible) PromDisponible, sum(d.Disponible)-avg(d.Disponible) DiferenciaDisponible
  from presupuesto p 
  join presupuestod d on d.Clave =p.Clave and d.ID =p.ID
 group by p.Empresa, p.Proyecto, d.ClavePresupuestal;
# Consultamos la vista creada
select * from EstatusPresupuesto;