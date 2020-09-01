Exercício baseado em http://swcarpentry.github.io/

Crie um banco de dados com as tabelas a seguir:

Para cada tabela crie os seguinte atributos

Person: pessoa que realiza leituras

* id : identificação única	
* personal	: primeiro nome
* family : sobrenome

Site: localizações onde leituras foram realizadas

* name : nome do lugar	
* lat	 : latitude
* long : longitude


Visited: quando as leituras foram realizadas

* id : identificação única	
* site	: site visitado
* date : data da visita

Survey: leituras realizadas

* taken	: idenficação única
* person	: id da pessoa que esta realizando a coleta 
* quant	 : quantitativo e indicativo do que está sendo medido. Valores possíveis rad, sal, and temp que referem-se a ‘Radiação’, ‘salinidade’ e ‘temperatura’
* reading : leitura 

