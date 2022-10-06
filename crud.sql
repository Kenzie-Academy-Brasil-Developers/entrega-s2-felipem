-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO
    clientes(nome, lealdade)
VALUES
    ('Geogia', 0)

-- 2)

INSERT INTO
    pedidos(status, cliente_id)
VALUES
    ('Recebido', 6)

-- 3)

INSERT INTO
    produtos_pedidos(pedido_id, produto_id)
VALUES
    (6, 1),
    (6, 2),
    (6, 6),
    (6, 8),
    (6, 8);

-- Leitura

-- 1)

SELECT
    *
FROM
    clientes cl
INNER JOIN
    pedidos pd ON pd.cliente_id = cl.id 
INNER JOIN
    produtos_pedidos pp ON pp.pedido_id = pd.id
INNER JOIN
    produtos pdt ON pp.produto_id = pdt.id
WHERE
    cl.nome = 'Georgia';

-- Atualização

-- 1)

UPDATE clientes cl
SET lealdade = (SELECT
                    SUM(pdt.pts_de_lealdade)
                FROM
                    clientes clt
                INNER JOIN
                    pedidos pdd ON pdd.cliente_id = clt.id 
                INNER JOIN
                    produtos_pedidos pp ON pp.pedido_id = pdd.id
                INNER JOIN
                    produtos pdt ON pp.produto_id = pdt.id
                WHERE
                    clt.nome LIKE 'Ge%')
WHERE
    cl.nome LIKE 'Ge%';

-- Deleção

-- 1)


