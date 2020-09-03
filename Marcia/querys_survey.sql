USE Survey_Schema;
-- QUERYS
-- Grep & Group all data in a CSV
SELECT * FROM PERSON P
INNER JOIN SURVEY S
ON P.ID_PERSON = S.PERSON_SURVEY
INNER JOIN VISITED V
ON S.TAKEN = V.ID_VISITED
INNER JOIN SITE ST
ON V.VISITED_SITE = ST.NOME_SITE;

-- 1. Listar a quantidade de visitas que cada site recebeu:
SELECT VISITED_SITE, COUNT(ID_VISITED) AS TOTAL_OF_VISITS
FROM VISITED
GROUP BY VISITED_SITE;
 
-- Listar sites que nao receberam visitas -- Inconsistência
SELECT SURVEY.PERSON_SURVEY, 
VISITED.VISITED_SITE AS SITE_SEM_VISITAS
FROM VISITED
INNER JOIN SURVEY
ON VISITED.ID_VISITED = SURVEY.TAKEN
WHERE VISITED.DATA_VISITA IS NULL;

-- Listar métricas que foram observadas na tabela survey
SELECT TAKEN, QUANT, READING FROM SURVEY;

-- Listar pessoas que fizeram mais de dois levantamentos
SELECT PERSON_SURVEY, COUNT(TAKEN) AS SURVEYS_REALIZADAS
FROM SURVEY S
WHERE PERSON_SURVEY IS NOT NULL
GROUP BY PERSON_SURVEY
HAVING COUNT(TAKEN) > 2;


-- 4. Listar pessoas que o sobrenome possua DYR no meio da palvra
SELECT * FROM PERSON
WHERE FAMILY_NAME LIKE '%DYR%';

-- 5 .Listar visitacoes a uma lista de sites passados como parâmetro
SELECT ID_VISITED AS ID_DA_VISITA, DATA_VISITA, VISITED_SITE
FROM VISITED V;

-- 6. verifique quantas linhas possuem valor nulo na coluna quant na tabela survey

SELECT COUNT(QUANT) AS QUANTIDADES_NULAS
FROM SURVEY
WHERE QUANT IS NULL;

-- retorne a media de lat lon utilizando como parametro de busca um intervalo de datas

SELECT AVG(SITE.LAT), AVG(SITE.LONGIT)
FROM SITE;

-- 7. Retorne a quantidade de medições realizadas por cada pessoa na tabela person

SELECT PERSON.ID_PERSON,
COUNT(TAKEN) AS QTDE_DE_MEDICOES
FROM PERSON
JOIN SURVEY S
ON PERSON.ID_PERSON = S.PERSON_SURVEY
GROUP BY PERSON.ID_PERSON;

-- retorne a pessoa que tem a maior quantidade de medições de temperatura entre 10 e 30 */
SELECT COUNT(S.TAKEN) FROM SURVEY S
INNER JOIN PERSON P
ON P.ID_PERSON = S.PERSON_SURVEY
WHERE S.QUANT LIKE '%temp%'
GROUP BY S.PERSON_SURVEY
HAVING S.READING > -100 AND S.READING < 30;



