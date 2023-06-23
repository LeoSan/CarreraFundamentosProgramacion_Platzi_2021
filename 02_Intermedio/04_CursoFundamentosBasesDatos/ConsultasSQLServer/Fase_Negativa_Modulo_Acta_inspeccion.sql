--Nota: No tiene tablas relacionadas por lo que es UN UPDATE sobre la tabla principal de desahogo 
-- PA: PA_Desahogo_AgregarActualizar

-- Consulta de la tabla de 
SELECT dshgo_motivo_negativa, dshgo_tipo_desahogo FROM dbo.desahogo  WHERE desahogo_id = 871289 -- -> NULL 

-- UPDATE SET 
--  dshgo_motivo_negativa = NULL --//Se valido antes de guardar información y se detecta que NULL ES SU VALOR DEFAULT 
-- dshgo_tipo_desahogo = 1 //Se valido antes de guardar información y se detecta que  1 es su valor default 
UPDATE dbo.desahogo SET dshgo_motivo_negativa = NULL, dshgo_tipo_desahogo = 1 WHERE desahogo_id = 871289


