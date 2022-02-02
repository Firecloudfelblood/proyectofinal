--Gyovanny Cavazos Marquez

--Cargando datos
prof = load '/home/ubuntu/environment/profeco.csv'
using PigStorage(',')
as(producto:chararray,presentacion:chararray,marca:chararray,categoria:chararray,catalogo:chararray,precio:double,
fechaRegistro:datetime,cadenaComercial:chararray,giro:chararray,nombreComercial:chararray,direccion:chararray,
estado:chararray,municipio:chararray,latitud:double,longitud:double);

--Inciso A
--Filtramos
pan = FILTER prof BY (categoria matches '.*PAN.*') AND (estado matches '.*Colima.*');

--Agrupamos
gpan = GROUP pan BY(cadenaComercial)

--Generamos la lista
lista = FOREACH gpan GENERATE group, MAX(pan.precio);

--Ordenamos
lsort = ORDER lista BY precio DESC;

--Imprimimos precio de la cadena
DUMP lsort;

-- sacamos los 5 mas caros
top5 = LIMIT lsort -5;

--Imprimimos
DUMP top5;

--Inciso B
--Filtramos
panb = FILTER prof BY (categoria matches '.*PAN.*') AND (estado matches '.*Distrito Federal.*');

--Agrupamos
gpanb = GROUP panb BY(cadenaComercial)

--Generamos la lista
listab = FOREACH gpanb GENERATE group, MAX(panb.precio);

--Ordenamos
lsortb = ORDER listab BY precio DESC;

--Imprimimos precio de la cadena
DUMP lsortb;

-- sacamos los 5 mas caros
top5b = LIMIT lsortb -5;

--Imprimimos
DUMP top5b;

--Inciso C

--Filtramos
panc = FILTER prof BY (categoria matches '.*arroz y cereales preparados.*') AND (estado matches '.*Oaxaca.*');

--Agrupamos
gpanc = GROUP panc BY(cadenaComercial)

--Generamos la lista
listac = FOREACH gpanc GENERATE group, MAX(panc.precio);

--Ordenamos
lsortc = ORDER listac BY precio DESC;

--Imprimimos precio de la cadena
DUMP lsortc;

-- sacamos los 5 mas caros
top5c = LIMIT lsortc -5;

--Imprimimos
DUMP top5c;