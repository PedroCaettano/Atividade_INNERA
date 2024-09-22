-- Inserção dos dados fornecidos
--  instrução SQL para inserir dados em uma tabelano banco de dados.

INSERT INTO respostas (
    bedtime, fall_asleep_time, wake_time, sleep_duration,
    q5a, q5b, q5c, q5d, q5e, q5f, q5g, q5h, q5i, q5j_text,
    q6, q7, q8, q9, bed_partner,
    q10a, q10b, q10c, q10d, q10e, q10e_text
) VALUES (
    '22:30', 15, '06:30', 6,
    1, 2, 0, 1, 3, 1, 2, 0, 3, 'Nenhum outro motivo',
    2, 1, 0, 1, 'nao',
    1, 0, 2, 3, 0, 'Sem inquietação'
);