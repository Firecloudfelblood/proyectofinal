--Gyovanny Cavazos Marquez

--Cargando datos
prof = load '/home/ubuntu/environment/profeco.csv'
using PigStorage(',')
as(producto:chararray,presentacion:chararray,marca:chararray,categoria:chararray,catalogo:chararray,precio:double,
fechaRegistro:datetime,cadenaComercial:chararray,giro:chararray,nombreComercial:chararray,direccion:chararray,
estado:chararray,municipio:chararray,latitud:double,longitud:double);

--Inciso A
--Agrupamos
categorias = GROUP prof BY categoria;

--Contamos
sumaA = FOREACH categorias GENERATE group, COUNT(prof) AS Conteo;

--Ordenamos
ordenadosA = ORDER sumaA BY Conteo;

--Imprimimos
DUMP ordenadosA;

--Inciso B
--Filtramos
edulce = FILTER prof BY (categoria matches '.*AZUCAR.*');

--Agrupamos
grupoazucar = GROUP edulce BY estado;

--Contamos
sumaazucar = FOREACH grupoazucar GENERATE group, COUNT(edulce) as ConteoB;

--Ordenamos
ordenadosB1 = ORDER sumaazucar BY ConteoB ASC;

--Contamos
sumacategoria = FOREACH categoria GENERATE group, COUNT(prefeco) as ConteoB2;

--Ordenamos
gruposordenados = ORDER sumacategoria BY ConteoB2 DESC;

--Imprimimos
DUMP gruposordenados;

--Inciso C
--Filtramos
conhuevos = FILTER profeco BY (categoria matches '.*HUEVO.*');

--Agrupamos
grupoconhuevos = GROUP conhuevos BY marca;

--Contamos
contamoshuevos = FOREACH grupoconhuevos GENERATE group, COUNT(conhuevos) AS ConteoC;

--Ordenamos
huevosordenados = ORDER contamoshuevos BY ConteoC DESC;

--Tomamos los primeros 10
top10 = LIMIT huevosordenados 10;

--Imprimimos
DUMP top10;

