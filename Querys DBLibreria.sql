
--Cuantos libros ha escrito o colaborado cierto autor

SELECT a.NombreCompleto AS Autor,
	l.Titulo AS Libro
FROM LibroAutor la
LEFT JOIN Libro l on la.IdLibro = l.IdLibro
JOIN Autor a on la.IdAutor = a.IdAutor
--WHERE la.IdAutor = 2 Si desea un autor en especifico pasar el IDAutor


-- Cuantos libros ha editado una casa editora

SELECT count(*) TotalEditado, e.Descripcion AS Editorial
FROM Libro l
LEFT JOIN Editorial e on l.IdEditorial = e.IdEditorial
--WHERE l.IdEditorial = 1 --Si desea Saber una editorial en especifico pasar el IdEditorial
GROUP BY e.Descripcion


-- Cantidad de autores por libro

SELECT l.Titulo,count(*) AS CantidadAutores
FROM LibroAutor la 
LEFT JOIN Libro l ON la.IdLibro = l.IdLibro
GROUP BY la.IdLibro,l.Titulo


-- Con cuales autores ha trabajado una casa editora

SELECT e.Descripcion as CasaEditora, count(*) as CantidadAutores
FROM AutorEditorial ae
LEFT JOIN Editorial e ON ae.IdEditorial = e.IdEditorial
GROUP BY e.Descripcion
		

-- Con cuales autores NO ha trabajado una casa editora

SELECT a.NombreCompleto AS AutoresSinEditorial
FROM Autor a
LEFT JOIN AutorEditorial  ae ON a.IdAutor = ae.IdAutor
WHERE a.IdAutor not in (SELECT IdAutor FROM AutorEditorial)







