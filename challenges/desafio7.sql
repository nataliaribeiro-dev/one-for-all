SELECT
    art.nome_artista AS artista,
    alb.nome_album AS album,
    COUNT(seg.usuario_id) AS pessoas_seguidoras
FROM
    SpotifyClone.artista AS art
inner JOIN
   SpotifyClone.album AS alb ON art.artista_id = alb.artista_id
inner join SpotifyClone.artistas_seguidos AS seg ON seg.artista_id = alb.artista_id
GROUP BY art.nome_artista, alb.nome_album 
ORDER BY
    pessoas_seguidoras DESC,
    artista ASC,
    album ASC;
