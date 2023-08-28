SELECT
    ROUND(MIN(p.valor_plano), 2) AS faturamento_minimo,
    ROUND(MAX(p.valor_plano), 2) AS faturamento_maximo,
    ROUND(AVG(p.valor_plano), 2) AS faturamento_medio,
    ROUND(SUM(p.valor_plano), 2) AS faturamento_total
FROM
    SpotifyClone.planos_detalhes AS p
JOIN
    SpotifyClone.info_usuarios AS u ON p.plano_id = u.plano_id;
