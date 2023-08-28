SELECT
    art.nome_artista AS artista,
    alb.nome_album AS album
FROM
    SpotifyClone.artista AS art 
JOIN
    SpotifyClone.album AS alb ON art.artista_id = alb.artista_id
WHERE
    art.nome_artista = 'Elis Regina'
ORDER BY
    album ASC;
