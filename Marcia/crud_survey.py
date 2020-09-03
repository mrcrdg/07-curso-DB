#!/usr/bin python3

#COMUNICAÇÃO COM DB
import MySQLdb

db = MySQLdb.connect(host="127.0.0.1",    
                     user="marcia",         
                     password="password",  
                     db="Survey_Schema")       

cur = db.cursor()
'''
#Insertion 01
cur.execute("INSERT INTO PERSON VALUES('Teste01','Teste01','Teste01');")
db.commit()

#Selection
cur.execute("SELECT * FROM PERSON")

#Show insertions on DataBase:
for row in cur.fetchall():
    print(row[0],row[1],row[2])
'''



#QUERYS: 
''' Testar essa solução depois:
#0. Listar TODOS os dados:
cur.execute("SELECT * FROM PERSON P INNER JOIN SURVEY S ON P.ID_PERSON = S.PERSON_SURVEY INNER JOIN VISITED V ON S.TAKEN = V.ID_VISITED INNER JOIN SITE ST ON V.VISITED_SITE = ST.NOME_SITE")
db.commit()
for column, row in enumerate(cur.fetchall()):
    print(row[column]) '''

#1. 
print("\nListar quantidade de visitas que cada site recebeu:")
cur.execute("SELECT SURVEY.PERSON_SURVEY, VISITED.VISITED_SITE AS SITE_SEM_VISITAS FROM VISITED INNER JOIN SURVEY ON VISITED.ID_VISITED = SURVEY.TAKEN WHERE VISITED.DATA_VISITA IS NULL;")
db.commit()
for row in cur.fetchall():
    print(row[0],row[1])

#2. 
print("\nListar métricas que foram observadas na tabela survey:")
cur.execute("SELECT TAKEN, QUANT, READING FROM SURVEY;")
db.commit()
for row in cur.fetchall():
    print(row[0],row[1], row[2])

#3.
print("\nListar pessoas que fizeram mais de dois levantamentos:")
cur.execute("SELECT PERSON_SURVEY, COUNT(TAKEN) AS SURVEYS_REALIZADAS FROM SURVEY S WHERE PERSON_SURVEY IS NOT NULL GROUP BY PERSON_SURVEY HAVING COUNT(TAKEN) > 2;")
db.commit()
for row in cur.fetchall():
    print(row[0],row[1])

#4
print("\nListar pessoas que o sobrenome possua 'DYR' no meio da palvra:")
cur.execute("SELECT * FROM PERSON WHERE FAMILY_NAME LIKE '%DYR%';")
db.commit()
for row in cur.fetchall():
    print(row[0],row[1], row[2])

#5 TESTAR PARÂMETRO
print("\nListar visitacoes a uma lista de sites passados como parâmetro :")
cur.execute("SELECT ID_VISITED AS ID_DA_VISITA, DATA_VISITA, VISITED_SITE FROM VISITED WHERE VISITED_SITE = '{}'".format("DR-3"))
db.commit()
for row in cur.fetchall():
    print(row[0],row[1],row[2])

#6
print("\nVerifique quantas linhas possuem valor nulo na coluna quant na tabela survey: ")
cur.execute("SELECT COUNT(QUANT) AS QUANTIDADES_NULAS FROM SURVEY WHERE QUANT IS NULL;")
db.commit()
for row in cur.fetchall():
    print(row[0])

#7
print("\nRetorne a quantidade de medições realizadas por cada pessoa na tabela person: ")
cur.execute("SELECT PERSON.ID_PERSON, COUNT(TAKEN) AS QTDE_DE_MEDICOES FROM PERSON JOIN SURVEY S ON PERSON.ID_PERSON = S.PERSON_SURVEY GROUP BY PERSON.ID_PERSON;")
db.commit()
for row in cur.fetchall():
    print(row[0],row[1])

#8
print("\n retorne a pessoa que tem a maior quantidade de medições de temperatura entre 10 e 30 : ")
cur.execute("SELECT S.PERSON_SURVEY, COUNT(S.TAKEN) FROM SURVEY S INNER JOIN PERSON P ON P.ID_PERSON = S.PERSON_SURVEY WHERE S.QUANT LIKE '%temp%' AND S.READING > -100 AND S.READING < 30 GROUP BY S. PERSON_SURVEY;")
db.commit()
for row in cur.fetchall():
    print(row[0],row[1])


#TESTAR COM 'with open(db)'
db.close()

