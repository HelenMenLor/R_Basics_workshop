################################################################################
### R BASICS WORKSHOP                                                                    ###
### EJERCICIO 7-2: Indexaci�n de objectos (y un poco de gr�ficos)            ###
###                                                                                                 ###
### Unida de Servicios Bioinform�ticos                                      ###
### Instituto Nacional de Medicina Gen�mica                                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                                         ### 
################################################################################

### INTRODUCCI�N ############################################## #################
# En este ejercicio, usted explorar� valores de las variables predictoras para 
# el modelo IGM2 (el modelo discutido en el ejercicio 5.1). Usted va a utilizar 
# un set de datos con los valores de precipitaci�n anual (Ran, en mm), la 
# evapotranspiraci�n potencial m�nima (PETmin, en mil�metros) y de la elevaci�n 
# (TOPOG, en metros ) para �reas a trav�s del Neotr�pico occidental.


## TAREA 1 ##
# Definir el directorio de trabajo utilizando la funci�n "setwd". Verificar el 
# cambio correcto utilizando la funci�n "getwd". Aqu� tambi�n puede usa las 
# opciones en las pesta�as de las ventanas de R o RStudio.


## TAREA 2 ##
# Use la funci�n "read.table" para crear un objeto (clase marco de datos) 
# llamado "neo_IGM2" con los datos en el archivo "data_neotropicooccidente_igm2.txt" 
# (disponible en el sitio web del taller). Este archivo tiene valores separados 
# por comas y columnas con nombres en la primera fila. El archivo contiene los 
# valores de Ran, PETmin y TOPOG para varias zonas Neotropicales. Cada �rea se 
# identifica por un n�mero (columna "Point.id") y las coordenadas ("Lat" y 
# "Lon"). Estas coordenadas se proyectan geogr�ficamente de manera que 
# corresponden al centro de celdas de una cuadr�cula de igual �rea (i.e., estas
# no son latitud y longitud en grados decimales). Cada �rea tiene a 100 km x 100 
# kil�metros. Una vez haya abierto el archibo, examine las cinco primeras filas 
# escribiendo "neo_IGM2 [1: 5,]" en la consola.


## TAREA 3 ##
# El marco de datos "neo_IGM2" tiene valores perdidos de PETmin o TOPOG en 
# varias �reas geogr�ficas. Estas �reas muestran "NA" en lugar de valores 
# num�ricos. El siguiente c�digo utiliza la funci�n "plot", junto con corchetes
# (para la indexaci�n) para visualizar todas las �reas de "neo_IGM2". Luego, 
# utiliza la funci�n "points" y corchetes de indexaci�n para diferenciar las 
# zonas con valores num�ricos de Ran, PETmin y TOPOG.  

plot(neo_IGM2[,2], neo_IGM2[,3])
points(neo_IGM2[!is.na(neo_IGM2[,4]),2], neo_IGM2[!is.na(neo_IGM2[,4]),3], pch=19)


## TAREA 4 ##
# Para representar mejor el Neotr�pico occidental,utilice el argumento "asp = 1" 
# de la funci�n "plot". Lea sobre este argumento en la p�gina de ayuda para la 
# funci�n "plot".

plot(neo_IGM2[,2], neo_IGM2[,3], asp=1)
points(neo_IGM2[!is.na(neo_IGM2[,4]),2], neo_IGM2[!is.na(neo_IGM2[,4]),3], pch=19)


## TAREA 5 ##
# Use y estudie el c�digo siguiente para examinar la relaci�n entre Ran y
# PETmin a trav�s del Neotr�pico:

plot(neo_IGM2[,4], neo_IGM2[,5], pch=19, xlab="Ran (mm)", ylab="PETmin (mm)")
#or
plot(neo_IGM2$Ran, neo_IGM2$PETmin, pch=19, xlab="Ran (mm)", ylab="PETmin (mm)")


## TAREA 6 ##
# Lleve a cabo una versi�n modificada de la tarea 5 usando argumentos "cex.axis" 
# y "cex.lab". Use y estudie este c�digo:

plot(neo_IGM2[,4], neo_IGM2[,5], pch=19, xlab="Ran (mm)", ylab="PETmin (mm)", 
  cex.axis=1.5, cex.lab=1.5)


## TAREA 7 ##
# Inspeccione la relaci�n entre Ran y el logaritmo natural de TOPOG usando la
# funci�n "plot".


## TAREA 8 ##
# Ver la relaci�n entre PETmin y el logaritmo natural de TOPOG usando la
# funci�n "plot"


## TAREA 9 ##
# Calcule el rango de los valores de Ran utilizando la funci�n "range". Consulte 
# la ayuda de esta funci�n. Estudie este c�digo:

range(neo_IGM2[!is.na(neo_IGM2[,4]),4])


## TAREA 10 ##
# Un investigador intenta obtener el rango de valores de Ran a trav�s de todo el
# Neotr�pico utilizando este c�digo:

range(neo_IGM2[,4])

# Hay un problema, lo puede ver? Describa el problema y resuelvalo. Lea la 
# p�gina de ayuda de la funci�n "range".


## TAREA 11 ##
# Calcule el rango de valores de PETmin.


## TAREA 12 ##
# Calcule el rango de valores de TOPOG


## TAREA 13 ##
# Lleve a cabo versiones modificadas de las TAREAS 3 a 12 usando el operador "$" 
# y los nombres de las columnas de "neo_IGM2". Por ejemplo, para la tarea 3, 
# utilice este c�digo:

plot(neo_IGM2$Lon, neo_IGM2$Lat)
points(neo_IGM2$Lon[!is.na(neo_IGM2$Ran)], neo_IGM2$Lat[!is.na(neo_IGM2$Ran)], pch=19)


## TAREA 14 ##
# Hay otra manera de acceder a las variables en un marco de datos: usando 
# corchetes rectangulares y el nombre de la variable entre comillas:

neo_IGM2["Lon"]

# Sin embargo, hay una diferencia entre neo_IGM2 [, 2] y neo_IGM2$Lon por un 
# lado, y neo_IGM2["Lon"] en el otro. �Cual es esta diferencia? Vea la p�gina 11 
# de "R para principiantes". Esta diferencia tambi�n puede verse mediante este 
# c�digo:

class(neo_IGM2[,2])
class(neo_IGM2$Lon)
class(neo_IGM2["Lon"])

is.vector(neo_IGM2[,2])
is.vector(neo_IGM2$Lon)
is.vector(neo_IGM2["Lon"])

attributes(neo_IGM2[,2])
attributes(neo_IGM2$Lon)
attributes(neo_IGM2["Lon"])


## TAREA 15 ##
# Utilice el siguiente c�digo para observar algunas de las consecuencias de la 
# diferencia entre neo_IGM2[,2] y neo_IGM2$Lon por un lado, y neo_IGM2["Lon"]
# por el otro. Lea cuidadosamente el mensaje de error despu�s de la tercera 
# l�nea de c�digo y explique el problema.

plot(neo_IGM2[,2], neo_IGM2[,3])
plot(neo_IGM2$Lon, neo_IGM2$Lat)
plot(neo_IGM2["Lon"], neo_IGM2["Lat"])


## TAREA 16 ##
# Use corchetes de indexaci�n para extraer de "neo_IGM2" s�lo en las zonas con
# valores num�ricos de Ran, PETmin, y TOPOG. Guarde el resultado en una marco de 
# datos denominado "Neot.occ.IGM2". Utilice y estudie este c�digo:

Neot.occ.IGM2 <- neo_IGM2[!is.na(neo_IGM2[,4]),]
Neot.occ.IGM2[1:5,]

# Ahora, el c�digo para examinar ciertas relaciones es m�s simple. Por ejemplo, 
# para la TAREA 3 use:

plot(neo_IGM2[,2], neo_IGM2[,3])
points(Neot.occ.IGM2[,2], Neot.occ.IGM2[,3], pch=19)


## TAREA 17 ##
# Utilice la funci�n "read.table" para crear un marco de datos denominado 
# "neo_COL" con los datos del archivo "neotropicooccidente_col.txt" (disponible 
# en el sitio web del taller). Tenga en cuenta que las columnas en el archivo 
# "neotropicooccidente_col.txt" tienen cabeceras y que los valores est�n 
# separados por comas. En la columna "especimenes" de este marco de 
# se encuentra el n�mero de espec�menes de herbario que se han recogido en
# varias zonas neotropicales. Un investigador quiere utilizar estas muestras 
# para calcular la riqueza de especies en cada �reas para poner a prueba 
# predicciones derivadas del IGM2. Cada �rea se identifica con un n�mero en la 
# columna "Point.id" y coordenadas ("Latitud" y "Lon"). Como antes,  las 
# coordenadas est�n proyectadas. Despu�s de crear el marco de datos, examine las cinco 
# primeras filas usando:
neo_COL[1:5,]


## TAREA 18 ##
# El marco Datos "neo_COL" tiene �reas geogr�ficas para las cuales no hay 
# informaci�n en el n�mero de ejemplares disponibles. Estas �reas tienen "NA" en 
# lugar de un valor num�rico en la columna "especimenes". Use corchetes de 
# indexaci�n para extraer del marco de datos "neo_COL" s�lo valores num�ricos 
# para "especimenes". Almacene los resultados en un nuevo marco de datos llamado 
# "Neot.occ.COL". Examine el resultado mirando las primeras cinco filas:
Neot.occ.COL[1:5,]


## TAREA 19 ##
# �Cu�les son las dimensiones de "Neot.occ.IGM2" y de "Neot.occ.COL"? Utilice la 
# funci�n "dim". Tienen el mismo n�mero de filas?


## TAREA 20 ##
# Use la funci�n "identical" en combinaci�n con corchetes de indexaci�n para 
# determinar si las tres primeras columnas de "Neot.occ.IGM2" son id�nticas a
# las respectivas columnas de "Neot.occ.COL".


## TAREA 21 ##
# Si las tres primeras columnas de "Neot.occ.IGM2" son id�nticas a las de
# "Neot.occ.COL", proceda a la consolidaci�n de los datos en un solo marco de 
# datos. Si no son identicas, examine su c�digo para descubrir la causa de las 
# diferencias. Consolide los datos en un marco de datos llamado "Neot.occ". 
# Utilice la funci�n "data.frame" para unir todas las columnas de "Neot.occ.IGM2" 
# con la cuarta columna de "Neot.occ.COL".

Neot.occ <- cbind(Neot.occ.IGM2, Neot.occ.COL[,4])

# Examine las primeras cinco filas de su resultado:

Neot.occ[1:5,]

# Cambie el nombre de la �ltima columna de "Neot.occ" usando la funci�n 
# "colnames". Primero, use este c�digo para ver los nombres de las columnas de 
# "Neot.occ":

colnames(Neot.occ)

# Utilice corchetes de indexaci�n para ver el nombre que va a cambiar:

colnames(Neot.occ)[7]

# Ahora, cambie el nombre usando el operador "<-" de asignar:

colnames(Neot.occ)[7] <- "Especimenes"

# Vea el resultado:

Neot.occ[1:5,]

# Examine Los atributos de "Neot.occ", y aseg�rese de que se trata de un marco 
# de datos:

attributes(Neot.occ)


## TAREA 22 ##
# Examine la distribuci�n del n�mero de ejemplares en las zonas incluidas en
# "Neot.occ" usando la funci�n "summary".


## TAREA 23 ##
# �Cu�ntas �reas hay en "Neot.occ" con menos de 500 espec�menes de herbario?
# �Cu�l es la proporci�n de las �reas de "Neot.occ" con menos de 500 herbario
espec�menes #?


## TAREA 24 ##
# �Cu�ntas �reas hay en "Neot.occ" con menos de 1000 espec�menes de herbario?
# �Cu�l es la proporci�n de �reas de "Neot.occ" con menos de 1000 
# espec�menes de herbario?
# �Cu�ntas �reas hay en "Neot.occ" con menos de 2.000 espec�menes de herbario?
# �Cu�l es la proporci�n de �reas de "Neot.occ" con menos de 2000 
# espec�menes de herbario?
# �Cu�ntas �reas hay en "Neot.occ" con menos de 3000 espec�menes de herbario?
# �Cu�l es la proporci�n de �reas de "Neot.occ" con menos de 3000
# espec�menes de herbario?


## TAREA 25 ##
# Cree un mapa de las �reas incluidas en "Neot.occ" usando el siguiente c�digo:

plot(Neot.occ[,2], Neot.occ[,3], asp=1, xlab="Longitude (m)", 
  ylab="Latitude (m)", cex.axis=1.5, cex.lab=1.5)


## TAREA 26 ##
# Use la funci�n "points" para distinguir (en el mapa que ha creado) las zonas 
# con al menos 3000 espec�menes de herbario. Un investigador tiene previsto 
# utilizar estas �reas para probar predicciones derivadas del IGM2 dado que 
# est�n relativamente bien muestreadas. OK, 3000 espec�menes no es mucho para 
# �reas de 100 km x 100 km (que es el tama�o de las zonas de "Neot.occ"), pero 
# es relativamente alto para el Neotr�pico.


## TAREA 27 ##
# Examine la relaci�n entre Ran y PETmin a trav�s de las �reas en las "Neot.occ"
# usando "plot" en combinaci�n con corchetes de indexaci�n.


## TAREA 28 ##
# Use la funci�n "points" para distinguir �reas con al menos 3.000 espec�menes 
# de herbario (en la figura que ha creado en la tarea 27). Si el investigador 
# fuera a enfocarse en estas �reas, �se perder�a una porci�n significativa de la 
# variaci�n ambiental definida por Ran y PETmin?


## TAREA 29 ##
# Examine la relaci�n entre Ran y el logaritmo natural de TOPOG a trav�s de las 
# zonas de "Neot.occ" usando la funci�n "plot" y corchetes para indexaci�n. 
# Utilice la funci�n "points" para diferenciar las zonas con al menos 3000
# espec�menes de herbario. Si el investigador fuera a enfocarse en estas �reas, 
# �se perder�a una porci�n significativa de la variaci�n ambiental definida por 
# Ran y TOPOG?


## TAREA 30 ##
# Examine la relaci�n entre PETmin y el logaritmo natural de TOPOG a trav�s de 
# las zonas de "Neot.occ" utilizando la funci�n "plot" y corchetes. Utilice
# la funci�n de "points" para distinguir �reas con al menos 3.000 espec�menes de 
# herbario.


## TAREA 31 ##
# Calcula el rango de Ran, PETmin y TOPOG en las zonas de "Neot.occ" que tienen
# al menos 3.000 espec�menes de herbario.




















################################################################################
### SOLUCIONES PARA TAREAS #####################################################
################################################################################

## TAREA 1 ##
setwd("C:/_transfer/R_Basics_Workshop/St_Louis_May_2015/Drafts/Day2") 
# Este es directorio de trabajo en la computadora de Iv�n

getwd()


## TAREA 2 ##
neo_IGM2 <- read.table("data_neotropicooccidente_igm2.txt", header=T, sep=",")
neo_IGM2[1:5,]
#or
head(neo_IGM2)

## TAREA 3 ##
# Ya tiene todas las respuestas


## TAREA 4 ##
# Ya tiene todas las respuestas


## TAREA 5 ##
# Ya tiene todas las respuestas


## TAREA 6 ##
# Ya tiene todas las respuestas


## TAREA 7 ##
plot(neo_IGM2[,4], log(neo_IGM2[,6]), pch=19, xlab="Ran (mm)", 
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5) 


## TAREA 8 ##
plot(neo_IGM2[,5], log(neo_IGM2[,6]), pch=19, xlab="PETmin (mm)", 
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5)


## TAREA 9 ##
# Ya tiene todas las respuestas


## TAREA 10 ##
range(neo_IGM2[!is.na(neo_IGM2[,4]),4])
#or
range(neo_IGM2[,4], na.rm=T)


## TAREA 11 ##
range(neo_IGM2[!is.na(neo_IGM2[,5]),5])
#or
range(neo_IGM2[,5], na.rm=T)


## TAREA 12 ##
range(neo_IGM2[!is.na(neo_IGM2[,6]),6])
#or
range(neo_IGM2[,6], na.rm=T)


## TAREA 13 ##

plot(neo_IGM2$Lon, neo_IGM2$Lat, asp=1)
points(neo_IGM2$Lon[!is.na(neo_IGM2$Ran)], neo_IGM2$Lat[!is.na(neo_IGM2$Ran)], 
  pch=19)

plot(neo_IGM2$Ran, neo_IGM2$PETmin, pch=19, xlab="Ran (mm)", ylab="PETmin (mm)")

plot(neo_IGM2$Ran, neo_IGM2$PETmin, pch=19, xlab="Ran (mm)", ylab="PETmin (mm)", 
  cex.axis=1.5, cex.lab=1.5)

plot(neo_IGM2$Ran, log(neo_IGM2$TOPOG), pch=19, xlab="Ran (mm)", 
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5) 

plot(neo_IGM2$PETmin, log(neo_IGM2$TOPOG), pch=19, xlab="PETmin (mm)", 
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5) 

range(neo_IGM2$Ran[!is.na(neo_IGM2$Ran)])
#o
range(neo_IGM2$Ran, na.rm=T)

range(neo_IGM2$PETmin[!is.na(neo_IGM2$PETmin)])
#o
range(neo_IGM2$PETmin, na.rm=T)

range(neo_IGM2$TOPOG[!is.na(neo_IGM2$TOPOG)])
#o
range(neo_IGM2$TOPOG, na.rm=T)


## TAREA 14 ##
#Los atributos del objeto original se mantienen cuando los elementos de un 
# objeto se accede utilizando nombres, un procedimiento mejor definido como 
# "subsetting". En contraste, los atributos del objeto original no se mantienen 
# cuando se usan corchetes rectangulares o el operador "$" para la indexaci�n, 
# por lo tanto esto se puede pensar mejor como una "extracci�n".

## TAREA 15 ##
# Ya tiene todas las respuestas


## TAREA 16 ##
# Ya tiene todas las respuestas


## TAREA 17 ##
neo_COL <- read.table("data_neotropicooccidente_col.txt", header=T, sep=",")
neo_COL[1:5,]
#or
head(neo_COL) 


## TAREA 18 ##
Neot.occ.COL <- neo_COL[!is.na(neo_COL$Especimenes),]
Neot.occ.COL[1:5,]
head(Neot.occ.COL)


## TAREA 19 ##
dim(Neot.occ.IGM2)
dim(Neot.occ.COL)
#Si, "Neot.occ.IGM2" y "Neot.occ.COL" tienen el mismo n�mero de filas.


## TAREA 20 ##
identical(Neot.occ.IGM2[,1:3], Neot.occ.COL[,1:3])

## TAREA 21 ##
# Ya tiene todas las respuestas


## TAREA 22 ##
summary(Neot.occ$Especimenes)


## TAREA 23 ##
# N�mero de �reas con menos de 500 espec�menes:
sum(Neot.occ$Especimenes<500)
# Proporci�n de �reas con menos de 500 espec�menes:
sum(Neot.occ$Especimenes<500)/length(Neot.occ$Especimenes)


## TAREA 24 ##
# N�mero de �reas con menos de 1000 espec�menes:
sum(Neot.occ$Especimenes<1000)
# Proporci�n de �reas con menos de 1000 espec�menes:
sum(Neot.occ$Especimenes<1000)/length(Neot.occ$Especimenes)

# N�mero de �reas con menos de 2000 espec�menes:
sum(Neot.occ$Especimenes<2000)
# Proporci�n de �reas con menos de 2000 espec�menes:
sum(Neot.occ$Especimenes<2000)/length(Neot.occ$Especimenes)

# N�mero de �reas con menos de 3000 espec�menes:
sum(Neot.occ$Especimenes<3000)
# Proporci�n de �reas con menos de 3000 espec�menes:
sum(Neot.occ$Especimenes<3000)/length(Neot.occ$Especimenes)


## TAREA 25 ##
# Ya tiene todas las respuestas


## TAREA 26 ##
points(Neot.occ[Neot.occ$Especimenes>=3000,2], 
  Neot.occ[Neot.occ$Especimenes>=3000,3], pch=19, col="red")


## TAREA 27 ##
plot(Neot.occ[,4], Neot.occ[,5], xlab="Annual mean precipitation (mm)", 
  ylab="Min. monthly potential evapotranspiration (mm)", cex.axis=1.5, 
  cex.lab=1.5)


## TAREA 28 ##
points(Neot.occ[Neot.occ$Especimenes>=3000,4], 
  Neot.occ[Neot.occ$Especimenes>=3000,5], pch=19, col="red")


## TAREA 29 ##
plot(Neot.occ[,4], log(Neot.occ[,6]), xlab="Annual mean precipitation (mm)", 
  ylab="Log(TOPOG (m))", cex.axis=1.5, cex.lab=1.5)
points(Neot.occ[Neot.occ$Especimenes>=3000,4], 
  log(Neot.occ[Neot.occ$Especimenes>=3000,6]), pch=19, col="red")


## TAREA 30 ##
plot(Neot.occ[,5], log(Neot.occ[,6]), 
  xlab="Min. monthly potential evapotranspiration (mm)", ylab="Log(TOPOG (m))", 
  cex.axis=1.5, cex.lab=1.5)
points(Neot.occ[Neot.occ$Especimenes>=3000,5], 
  log(Neot.occ[Neot.occ$Especimenes>=3000,6]), pch=19, col="red")


## TAREA 31 ##
range(Neot.occ[Neot.occ$Especimenes>=3000,4])
range(Neot.occ[Neot.occ$Especimenes>=3000,5])
range(Neot.occ[Neot.occ$Especimenes>=3000,6])


