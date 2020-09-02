# Exemplos de comandos SQL


## Comandos para criar tabelas

```
#CREATE TABLE Person (id text, personal text, family text);
#CREATE TABLE Site (name text, lat real, lon real);
#CREATE TABLE Survey (taken integer, person text, quant text, reading real);
#CREATE TABLE Visited (id integer, site text, dated text);

```
## Comandos para Inserir dados nas tabelas
```
INSERT INTO Person VALUES('dyer','William','Dyer');
INSERT INTO Person VALUES('pb','Frank','Pabodie');
INSERT INTO Person VALUES('lake','Anderson','Lake');
INSERT INTO Person VALUES('roe','Valentina','Roerich');
INSERT INTO Person VALUES('danforth','Frank','Danforth');

INSERT INTO Site VALUES('DR-1',-49.850000000000001419,-128.56999999999999317);
INSERT INTO Site VALUES('DR-3',-47.149999999999998578,-126.71999999999999886);
INSERT INTO Site VALUES('MSK-4',-48.869999999999997443,-123.40000000000000568);

INSERT INTO Survey VALUES(619,'dyer','rad',9.8200000000000002842);
INSERT INTO Survey VALUES(619,'dyer','sal',0.13000000000000000444);
INSERT INTO Survey VALUES(622,'dyer','rad',7.7999999999999998223);
INSERT INTO Survey VALUES(622,'dyer','sal',0.089999999999999996669);
INSERT INTO Survey VALUES(734,'pb','rad',8.4100000000000001421);
INSERT INTO Survey VALUES(734,'lake','sal',0.050000000000000002775);
INSERT INTO Survey VALUES(734,'pb','temp',-21.5);
INSERT INTO Survey VALUES(735,'pb','rad',7.2199999999999997513);
INSERT INTO Survey VALUES(735,NULL,'sal',0.059999999999999997779);
INSERT INTO Survey VALUES(735,NULL,'temp',-25.999999999999999999);
INSERT INTO Survey VALUES(751,'pb','rad',4.3499999999999996447);
INSERT INTO Survey VALUES(751,'pb','temp',-18.5);
INSERT INTO Survey VALUES(751,'lake','sal',0.10000000000000000555);
INSERT INTO Survey VALUES(752,'lake','rad',2.1899999999999999467);
INSERT INTO Survey VALUES(752,'lake','sal',0.089999999999999996669);
INSERT INTO Survey VALUES(752,'lake','temp',-16.0);
INSERT INTO Survey VALUES(752,'roe','sal',41.600000000000001421);
INSERT INTO Survey VALUES(837,'lake','rad',1.4599999999999999644);
INSERT INTO Survey VALUES(837,'lake','sal',0.20999999999999999222);
INSERT INTO Survey VALUES(837,'roe','sal',22.5);
INSERT INTO Survey VALUES(844,'roe','rad',11.25);

INSERT INTO Visited VALUES(619,'DR-1','1927-02-08');
INSERT INTO Visited VALUES(622,'DR-1','1927-02-10');
INSERT INTO Visited VALUES(734,'DR-3','1930-01-07');
INSERT INTO Visited VALUES(735,'DR-3','1930-01-12');
INSERT INTO Visited VALUES(751,'DR-3','1930-02-26');
INSERT INTO Visited VALUES(752,'DR-3',NULL);
INSERT INTO Visited VALUES(837,'MSK-4','1932-01-14');
INSERT INTO Visited VALUES(844,'DR-1','1932-03-22');
```

## Exemplos de comandos de filtro

* Selecionando todas as colunas ou um conjunto de colunas

* Verifique na coluna quant da tabela survey, apenas os valores únicos (distinct)

* Identifique os cientistas na expedição olhando para a tabela Person., mostre o resultado em ordem alfabetica (Ascendencente ou descendente) ( order by)
 
* Filtre apenas os sites com um certo nome (where)

* Filtre apenas os sites com um certo nome e visitados em um certo período (where and or)

* Filtre pessoas cujo nome esteja num certo conjunto de nomes (where and in)

* Filtre por locais visitados que comecem por  DR (where like)

* As leituras de salinidade normalizadas devem estar entre 0,0 e 1,0. Escreva uma consulta que selecione todos os registros da Pesquisa com valores de salinidade fora desse intervalo.

* Selecione os registros da coluna dated na tabela visited que sejam iguais a nulo (where NULL ,IS NULL ,IS NOT NULL)

* Selecionando a data mais antiga de visitação (min)

* Selecionando a media das leituras de salinidade

* Selecione a somatória de leituras de cada pessoa que fizeram uma leitura de salinidade menor ou igual a 1 (count(*))

* Combine as tabelas site e visited (join on)

* Combine as tabelas site e survey (join on)

* Escreva uma consulta que liste todas as leituras de radiação do site DR-1. (join on where)

## Script SQL para responder as perguntas acima
```
select * from Site ;
select * from Survey ;

select DISTINCT site from Visited 

select DISTINCT quant from Survey 

#Colocando nomes das pessoas em ordem alfabetica
select * from Person order by personal,family

#exemplos de filtro - site com certo nome
select * from Site where name = 'DR-1'

# filtre visitacoes por nome do site e periodo
select * from Visited where (site = 'DR-3' and dated > '1930-01-10')

# pessoas cujo nome esteja em um conjunto possível de nomes
select * from Person where family in ('Lake', 'Dyer', 'stanzani');

#filtrando visitacao nas quais o nome do site comeca com DR - % indica, qualquer coisa após a string
select * from Visited where site LIKE 'D%-%' ;
#
# selecionando Survey com salinidade fora do intervalo entre 0 e 1
select * from Survey where ((quant = 'sal') and ((reading < 0) or  (reading > 1)))

# selecionando registros na tabela visited nos quais a coluna dated 1) ẽ nula 2) nao ẽ nula
select dated from Visited where dated IS NULL 
select dated from Visited where dated IS NOT NULL 

# Selecionando visitacao mais antiga registrada na base visited
select min(dated) from Visited

#selecionando media da leitura de salinidade
select avg(reading) from Survey where quant = 'sal'

#filtrando quantidade de medicoes de salinidade menores ou igual a 1 agrupados por cada pessoa que realizou medicoes
select person,count(*) from Survey where ((quant = 'sal') and (reading <=1) )  group by person ; # where ((quant = 'sal') and (reading <=1) ) 

select * from Site join Visited on Site.name=Visited.site

#combinando a tabela visited com a tabela site em uma unica tabela
select * from Visited join Site on Visited.site=Site.name

# eliminado coluna repetido por conta do join
select id,site,dated,lat,lon from Visited join Site on Visited.site=Site.name

# combinando todas as tabelas em uma única tabela
select * from Survey join Person on Survey.person=Person.id join Visited on Survey.taken=Visited.id

# mostre as leituras de radiacao do site DR-1
select * from Survey join Person on Survey.person=Person.id join Visited on Survey.taken=Visited.id where (quant='rad' and site='DR-1')

```

## Acessando um Banco de Dados usando Python:

* Instalando biblioteca para acesso ao Mysql:

```
conda install mysqlclient
```

* Codigo que realiza a leitura de uma tabela

```
import MySQLdb

db = MySQLdb.connect(host="127.0.0.1",    
                     user="silvio",         
                     passwd="1234",  
                     db="db1")       

cur = db.cursor()

cur.execute("INSERT INTO Person VALUES('dyer2','William222','Dyer222');")
db.commit()

cur.execute("SELECT * FROM Person")

l=cur.fetchall()

print(type(l))

for row in l:
    print (row[0],row[1],row[2])



db.close()

```
