#Gyovanny Cavazos Marquez
#!/bin/bash

awk -F ',' 'NF  ==  15 {print}' profeco.csv | sed '1d' > profeco_w_header.csv 