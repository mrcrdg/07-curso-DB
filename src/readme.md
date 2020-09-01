# Exemplos de comandos SQL

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

# Acessando um Banco de Dados usando Python:

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
                     db="dbVendas")       

cur = db.cursor()

cur.execute("SELECT * FROM cliente")

for row in cur.fetchall():
    print (row[0])

db.close()
```
