--Gyovanny Cavazos Marquez

--Cargando datos
prof = load '/home/ubuntu/environment/profeco.csv'
using PigStorage(',')
as(producto:chararray,presentacion:chararray,marca:chararray,categoria:chararray,catalogo:chararray,precio:double,
fechaRegistro:datetime,cadenaComercial:chararray,giro:chararray,nombreComercial:chararray,direccion:chararray,
estado:chararray,municipio:chararray,latitud:double,longitud:double);

--Filtramos
tortillas = FILTER prof by(categoria matches '.*TORTILLA.*');

--Inciso A
--Agrupamos
mascaras =  GROUP tortillas BY estado;

--Mas caras
tortillascaras = FOREACH mascaras GENERATE group.estado, MAX(tortillas.precio);

--Imprimimos
DUMP tortillascaras;

--Inciso B
--Agrupamos
baratas =  GROUP tortillas BY estado;

--Mas caras
tortillasbaratas = FOREACH baratas GENERATE group.estado, MIN(tortillas.precio);

--Imprimimos
DUMP tortillasbaratas;

--Inciso C
--Agrupamos
promedio =  GROUP tortillas BY estado;

--Mas caras
preciopromedio = FOREACH promedio GENERATE group.estado, MIN(tortillas.precio);

--Imprimimos
DUMP tortillasbaratas;


