SELECT CONCAT( usr_nombre, ' ', usr_primer_apellido, ' ', usr_segundo_apellido ) AS nombre_completo FROM dbo.usuario 

SELECT sys_usr_insert, * FROM dbo.dshgo_documento;

SELECT sys_usr_insert, * FROM dbo.operativo_docto;

SELECT sys_usr_insert, * FROM dbo.documento;

SELECT sys_usr_insert, * FROM dbo.calif_documento;



SELECT sys_usr_insert, CONCAT( usr_nombre, ' ', usr_primer_apellido, ' ', usr_segundo_apellido ) AS nombre_completo  
FROM dbo.usuario as a, dbo.calif_documento as b 
WHERE sys_usr_insert LIKE usr_nombre 
AND sys_usr_insert != 'Alberto' 
AND sys_usr_insert != 'Mar�a del Carmen' 
AND sys_usr_insert != 'Luz Mar�a'
AND sys_usr_insert != 'Alejandro '
AND sys_usr_insert != 'Eduardo '
AND sys_usr_insert != 'Gabriela '
AND sys_usr_insert != 'Israel '
AND sys_usr_insert != 'Javier '
AND sys_usr_insert != 'Jorge Alberto '
AND sys_usr_insert != 'Jorge Luis'
AND sys_usr_insert != 'Juan Carlos '
AND sys_usr_insert != 'Luis '
AND sys_usr_insert != 'Mar�a de la Luz '
AND sys_usr_insert != 'Marisela '
AND sys_usr_insert != 'Miguel �ngel '
AND sys_usr_insert != 'N�stor Iv�n '
AND sys_usr_insert != 'Ram�n'
AND sys_usr_insert != 'Ra�l'
AND sys_usr_insert != 'Roc�o '
AND sys_usr_insert != 'Sayra '
AND sys_usr_insert != 'Juan Francisco'
AND sys_usr_insert != 'Mar�a Teresa'
AND sys_usr_insert != 'Rene'
order by sys_usr_insert;

----------------------- dbo.dshgo_documento ----------------------------------

UPDATE dbo.dshgo_documento 
SET 
sys_usr_insert = CONCAT( usr_nombre, ' ', usr_primer_apellido, ' ', usr_segundo_apellido ) 
FROM dbo.usuario as a, dbo.dshgo_documento as b  
WHERE sys_usr_insert LIKE usr_nombre 
AND sys_usr_insert != 'Alberto' 
AND sys_usr_insert != 'Mar�a del Carmen' 
AND sys_usr_insert != 'Luz Mar�a'
AND sys_usr_insert != 'Alejandro '
AND sys_usr_insert != 'Eduardo '
AND sys_usr_insert != 'Gabriela '
AND sys_usr_insert != 'Israel '
AND sys_usr_insert != 'Javier '
AND sys_usr_insert != 'Jorge Alberto '
AND sys_usr_insert != 'Jorge Luis'
AND sys_usr_insert != 'Juan Carlos '
AND sys_usr_insert != 'Luis '
AND sys_usr_insert != 'Mar�a de la Luz '
AND sys_usr_insert != 'Marisela '
AND sys_usr_insert != 'Miguel �ngel '
AND sys_usr_insert != 'N�stor Iv�n '
AND sys_usr_insert != 'Ram�n'
AND sys_usr_insert != 'Ra�l'
AND sys_usr_insert != 'Roc�o '
AND sys_usr_insert != 'Sayra '
AND sys_usr_insert != 'Juan Francisco'
AND sys_usr_insert != 'Mar�a Teresa'
AND sys_usr_insert != 'Rene';


----------------------- dbo.operativo_docto ----------------------------------

UPDATE dbo.dshgo_documento 
SET 
sys_usr_insert = CONCAT( usr_nombre, ' ', usr_primer_apellido, ' ', usr_segundo_apellido ) 
FROM dbo.usuario as a, dbo.operativo_docto as b  
WHERE b.sys_usr_insert LIKE usr_nombre 
AND b.sys_usr_insert != 'Alberto' 
AND b.sys_usr_insert != 'Mar�a del Carmen' 
AND b.sys_usr_insert != 'Luz Mar�a'
AND b.sys_usr_insert != 'Alejandro '
AND b.sys_usr_insert != 'Eduardo '
AND b.sys_usr_insert != 'Gabriela '
AND b.sys_usr_insert != 'Israel '
AND b.sys_usr_insert != 'Javier '
AND b.sys_usr_insert != 'Jorge Alberto '
AND b.sys_usr_insert != 'Jorge Luis'
AND b.sys_usr_insert != 'Juan Carlos '
AND b.sys_usr_insert != 'Luis '
AND b.sys_usr_insert != 'Mar�a de la Luz '
AND b.sys_usr_insert != 'Marisela '
AND b.sys_usr_insert != 'Miguel �ngel '
AND b.sys_usr_insert != 'N�stor Iv�n '
AND b.sys_usr_insert != 'Ram�n'
AND b.sys_usr_insert != 'Ra�l'
AND b.sys_usr_insert != 'Roc�o '
AND b.sys_usr_insert != 'Sayra '
AND b.sys_usr_insert != 'Juan Francisco'
AND b.sys_usr_insert != 'Mar�a Teresa'
AND b.sys_usr_insert != 'Rene';



----------------------- dbo.documento ----------------------------------

UPDATE dbo.dshgo_documento 
SET 
sys_usr_insert = CONCAT( usr_nombre, ' ', usr_primer_apellido, ' ', usr_segundo_apellido ) 
FROM dbo.usuario as a, dbo.documento as b  
WHERE b.sys_usr_insert LIKE usr_nombre 
AND b.sys_usr_insert != 'Alberto' 
AND b.sys_usr_insert != 'Mar�a del Carmen' 
AND b.sys_usr_insert != 'Luz Mar�a'
AND b.sys_usr_insert != 'Alejandro '
AND b.sys_usr_insert != 'Eduardo '
AND b.sys_usr_insert != 'Gabriela '
AND b.sys_usr_insert != 'Israel '
AND b.sys_usr_insert != 'Javier '
AND b.sys_usr_insert != 'Jorge Alberto '
AND b.sys_usr_insert != 'Jorge Luis'
AND b.sys_usr_insert != 'Juan Carlos '
AND b.sys_usr_insert != 'Luis '
AND b.sys_usr_insert != 'Mar�a de la Luz '
AND b.sys_usr_insert != 'Marisela '
AND b.sys_usr_insert != 'Miguel �ngel '
AND b.sys_usr_insert != 'N�stor Iv�n '
AND b.sys_usr_insert != 'Ram�n'
AND b.sys_usr_insert != 'Ra�l'
AND b.sys_usr_insert != 'Roc�o '
AND b.sys_usr_insert != 'Sayra '
AND b.sys_usr_insert != 'Juan Francisco'
AND b.sys_usr_insert != 'Mar�a Teresa'
AND b.sys_usr_insert != 'Rene';


----------------------- dbo.calif_documento ----------------------------------

UPDATE dbo.dshgo_documento 
SET 
sys_usr_insert = CONCAT( usr_nombre, ' ', usr_primer_apellido, ' ', usr_segundo_apellido ) 
FROM dbo.usuario as a, dbo.calif_documento as b  
WHERE b.sys_usr_insert LIKE usr_nombre 
AND b.sys_usr_insert != 'Alberto' 
AND b.sys_usr_insert != 'Mar�a del Carmen' 
AND b.sys_usr_insert != 'Luz Mar�a'
AND b.sys_usr_insert != 'Alejandro '
AND b.sys_usr_insert != 'Eduardo '
AND b.sys_usr_insert != 'Gabriela '
AND b.sys_usr_insert != 'Israel '
AND b.sys_usr_insert != 'Javier '
AND b.sys_usr_insert != 'Jorge Alberto '
AND b.sys_usr_insert != 'Jorge Luis'
AND b.sys_usr_insert != 'Juan Carlos '
AND b.sys_usr_insert != 'Luis '
AND b.sys_usr_insert != 'Mar�a de la Luz '
AND b.sys_usr_insert != 'Marisela '
AND b.sys_usr_insert != 'Miguel �ngel '
AND b.sys_usr_insert != 'N�stor Iv�n '
AND b.sys_usr_insert != 'Ram�n'
AND b.sys_usr_insert != 'Ra�l'
AND b.sys_usr_insert != 'Roc�o '
AND b.sys_usr_insert != 'Sayra '
AND b.sys_usr_insert != 'Juan Francisco'
AND b.sys_usr_insert != 'Mar�a Teresa'
AND b.sys_usr_insert != 'Rene';
