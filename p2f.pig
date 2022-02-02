--Gyovanny Cavazos Marquez

--Cargando datos
prof = load '/home/ubuntu/environment/profeco_w_header.csv '
using PigStorage(',')
as(producto:chararray,presentacion:chararray,marca:chararray,categoria:chararray,catalogo:chararray,precio:double,
fechaRegistro:datetime,cadenaComercial:chararray,giro:chararray,nombreComercial:chararray,direccion:chararray,
estado:chararray,municipio:chararray,latitud:double,longitud:double);

---pregunta 2 inciso A
--agrupamos por giro
giros = GROUP prof BY giro;

--sumamos por estado
sumaA = FOREACH giros GENERATE(group, COUNT(prof.giro));

--imprimimos
DUMP sumaA;

-- Inciso B

estados = GROUP prof BY estado;

sumaB = FOREACH estados GENERATE(group, COUNT(prof.estado));

DUMP sumaB;

--- Inciso C
-- SI 10 estados, Baja California, Baja California Sur,
-- Campeche, Chiapas, Chihuahua, Guerrero, Morelos, Nayarit,
-- San Luis Potosí, Tamaulipas