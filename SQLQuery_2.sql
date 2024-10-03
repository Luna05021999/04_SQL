UPDATE [dbo].[alumno]SET [apellido2] = CASE 
WHEN [id] = 3 THEN 'Leost'
WHEN [id] = 4 THEN 'Martin'END WHERE [id] IN
(3, 4);