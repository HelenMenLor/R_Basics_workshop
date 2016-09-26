################################################################################
### R BASICS WORKSHOP                                       				                     ###
### EJERCICIO 7-3: Gr�ficos                                                  ###
###                                                               						                      ###
### Unida de Servicios Bioinform�ticos    						                      ###
### Instituto Nacional de Medicina Gen�mica                                               			          ###
### Website: github.com/hachepunto/R_Basics_workshop			                                   ### 
################################################################################

## TAREA 1 ##
# Abra los datos en el archivo "Data_GlobalWoodDensity.txt" y as�gnelos a un 
# objeto denominado wood.density. Este archivo contiene datos sobre la densidad 
# de la madera para muchas especies en diversas regiones del planeta y para 
# muchas familias de plantas le�osas.

## TAREA 2 ##
## Haga un gr�fico circular ("pie chart") que muestra el n�mero de mediciones que 
## hay para cada familia de plantas. Antes de utilizar el la funci�n "pie", es 
## necesario calcular las frecuencias por familia usando la funcione "table":

fam.freq <- table(wood.density$Family)


## TAREA 3 ##
## Repita el gr�fico circular, pero s�lo para las 5 familias con la mayor�a de 
## registros. En esta y en todas las otras figuras en este ejercicio, haga un 
## esfuerzo para crearlos tan bien como sea posible: escoger buenos colores, 
## buenos tama�o de letra, cree nombres de ejes y t�tulos, etc.


## TAREA 4 ##
## Haga un histograma de los valores de densidad de madera para todas las 
## especies. A�ada a este histograma otros dos histogramas encima (con el 
## argumento * add = TRUE *) pero donde s�lo se utilizan los valores de densidad 
## de madera para (1) Am�rica del Norte y (2) para Australia. 


## TAREA 5 ##
## Elija 3 familias de inter�s, y haga un diagrama de cajas ("boxplot") 
## comparando los valores de densidad de la madera entre las familias.


## TAREA 6 ##
# Guarde la �ltima figurea en un archivo PDF de alta resoluci�n




