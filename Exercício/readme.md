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


Visited: when readings were taken at specific sites.

* id : identificação única	
* site	: site visitado
* date : data da visita

Survey: the actual readings. The field quant is short for quantitative and indicates what is being measured. 
Values are rad, sal, and temp referring to ‘radiation’, ‘salinity’ and ‘temperature’, respectively.

* taken	: idenficação única
* person	: id da pessoa que esta realizando a coleta 
* quant	 : quantitativo e indicativo do que está sendo medido. Valores possíveis rad, sal, and temp que referem-se a ‘Radiação’, ‘salinidade’ e ‘temperatura’
* reading : leitura 
