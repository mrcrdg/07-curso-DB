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
