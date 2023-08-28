SELECT 
    CONCAT(user.nome, " ", user.sobrenome) AS pessoa_usuaria,
    CASE
        WHEN MAX(hr.data_reprodução) >= '2021-01-01' THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM
    SpotifyClone.histórico_reprodução hr
        INNER JOIN
    SpotifyClone.info_usuarios AS user ON hr.usuario_id = user.usuario_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;