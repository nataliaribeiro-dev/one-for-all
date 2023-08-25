SELECT 
    CONCAT(TRIM(u.nome), " ", TRIM(u.sobrenome)) AS pessoa_usuaria,
    COUNT(hr.musica_id) AS musicas_ouvidas,
    ROUND(SUM(im.duração_seg) / 60, 2) AS total_minutos
FROM
    SpotifyClone.histórico_reprodução hr
        JOIN
    SpotifyClone.info_usuarios u ON hr.usuario_id = u.usuario_id
        JOIN
    SpotifyClone.info_musicas im ON hr.musica_id = im.musica_id
GROUP BY u.nome , u.sobrenome
ORDER BY pessoa_usuaria;