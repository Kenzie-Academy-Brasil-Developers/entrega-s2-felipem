-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)

SELECT
    pd.id,
    pd.status,
    pd.cliente_id,
    pdt.id,
    pdt.nome,
    pdt.tipo,
    pdt.preço,
    pdt.pts_de_lealdade
FROM
    pedidos pd
INNER JOIN
    produtos_pedidos pp ON pd.id = pp.pedido_id 
INNER JOIN 
    produtos pdt ON pp.produto_id = pdt.id;

-- 2)

SELECT 
  pd.id
FROM 
  pedidos pd
JOIN 
  produtos_pedidos pp ON pd.id = pp.pedido_id
WHERE 
  pp.produto_id = 6;
  
-- 3)

SELECT 
  cl.nome gostam_de_fritas
FROM 
  pedidos pd
INNER JOIN 
  produtos_pedidos pp ON pd.id = pp.pedido_id
INNER JOIN 
  clientes cl ON pd.id = cl.id
WHERE 
  pp.produto_id = 6;
  
-- 4)

SELECT 
  SUM(pdt."preço")
FROM 
  pedidos pd
INNER JOIN 
  produtos_pedidos pp ON pd.id = pp.pedido_id
INNER JOIN 
  clientes cl ON pd.id = cl.id
INNER JOIN 
  produtos pdt ON pp.produto_id = pdt.id
WHERE 
  cl.nome = 'Laura'
  
-- 5)

SELECT 
  pdt.nome,
  COUNT(pdt.id)
FROM 
  produtos pdt
INNER JOIN
  produtos_pedidos pp ON pdt.id = pp.produto_id
INNER JOIN 
  pedidos pd ON pp.pedido_id = pd.id
GROUP BY
  pdt.nome
ORDER BY 
  pdt.nome
