SELECT
    inf_m.nome_musica AS cancao,
    COUNT(hr.musica_id) AS reproducoes
FROM
    SpotifyClone.histórico_reprodução AS hr
        JOIN
    SpotifyClone.info_musicas AS inf_m ON hr.musica_id = inf_m.musica_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC LIMIT 2;

