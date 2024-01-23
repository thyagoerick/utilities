-- Para procurar tabelas, colunas e qualquer palavra ou frase nas procedures do BD

SELECT
    A.NAME,
    A.TYPE,
    B.TEXT
FROM
    SYSOBJECTS A (nolock)
JOIN SYSCOMMENTS B (nolock) 
    ON
    A.ID = B.ID
WHERE
    B.TEXT LIKE '%XXXXXX%'    --- Informação a ser procurada no corpo da procedure, funcao ou view, ex.: '%TituloTemplate%'
  AND A.TYPE = 'P'            --- Tipo de objeto a ser localizado, no caso, P quer dizer procedure
 ORDER BY A.NAME


 /*
 No exemplo acima usamos A.TYPE = 'P' para procurar por uma procedure com determinado nome mas temos o outros tipos além desse, que são:

- 'P': Procedure
- 'FN': Function escalar (scalar function)
- 'IF': Function inline (inline table-valued function)
- 'TF': Function da tabela (table-valued function)
- 'TR': Trigger
- 'V': View
- 'U': Tabela (User Table)
- 'X': Procedure estendida

Podemos ajustar essa condição com o tipo específico que desejamos procurar no banco de dados. Todavia, verifique a documentação do sistema de gerenciamento de banco de dados que você está usando para obter uma lista completa dos tipos disponíveis e seus significados, os apresentados aqui servem para o Microsoft SQL Server.
 */