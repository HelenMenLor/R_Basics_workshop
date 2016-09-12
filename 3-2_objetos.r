################################################################################
### R BASICS WORKSHOP                                                					          ###
### EJERCICIO 3-2: objetos                    					                                  ###
###                                                               						                      ###
### Unida de Servicios Bioinform�ticos    						                      ###
### Instituto Nacional de Medicina Gen�mica                                               			          ###
### Website: github.com/hachepunto/R_Basics_workshop			                                   ### 
################################################################################

## OBJETIVO:
## El objetivo de este ejercicio es familiarizarse con los diferentes tipos de
## objetos en R.


rand.1 <- rnorm(100, mean=5, sd=1.5)
# Crea un objeto con 100 valores aleatorios tomados de una distribuci�n normal 
# con un promedio de 5 y una desviaci�n est�ndar de 1,5.

## TAREA 1: �Qu� clase de objeto es este?
## TAREA 2: �Qu� tipo de datos contiene?
## TAREA 3: �Cu�l es la longitud de este objeto?

## TAREA 4: �Cu�les son la media y la desviaci�n est�ndar de "rand.1"

## TAREA 5: Re-escriba "rand.1" con otro conjunto de 100 valores aleatorios 
## tomados de una distribuci�n normal con un promedio de 5 y una desviaci�n 
## est�ndar de 1.5.

## TAREA 6: �Cu�les son la media y la desviaci�n est�ndar de esta nueva versi�n 
## de rand.1? Es la media identica a la de antes? �Por qu� s� / no?

?as.character
# Abre el archivo de ayuda para la funci�n 'as.character'

## TAREA 7: Utilice la funci�n "as.character" para crear un vector de caracteres 
## llamado 'rand.2' a partir de 'rand.1'.


class(rand.2)
mode(rand.2)
length(rand.2)
# Confirma los cambios realizados en el objeto.


rand.1
rand.2
## Al imprimir estos dos objetos en la pantalla, preste atenci�n a c�mo se ven
## o no diferentes.


identical(rand.1, rand.2)
## TAREA 8: �Qu� hace la funci�n 'identical'?, �por qu� este resultado es falso?

## TAREA 9: Utilice la funci�n 'as.numeric' para crear un nuevo objeto "rand.3"
## transformando de vuelta rand.2 a n�meros. 

class(rand.1)
class(rand.3)
identical(class(rand.1), class(rand.3))
# Esto confirma el cambio



identical(rand.1, rand.3)
## TAREA 10: �Puede entender por qu� esto todav�a es falso? Calcule la 
## diferencia (resta) entre los valores de rand.1 y rand.3. Esta es una lecci�n
## sobre precisi�n y la necesidad de tener cuidado cuando uno trabaja con valores
## muy peque�os.


seq.1 <- 1:5
seq.1
## Crea un vector con la secuencia 1, 2, 3, 4, 5.


## TAREA 11: Queremos crear un vector de longitud 10 que es una muestra 
## aleatoria de los n�meros en 'seq.1'. Para ello, se utiliza la funci�n 
## "sample". La l�nea de abajo, sin embargo, tiene un error. Solucione el 
## problema con la ayuda de la funci�n y el error que resulta de correr esta 
## l�nea de c�digo.
sample(x=seq.1, size=10)


## TAREA 12: Cree un objeto de nombre 'rand.3' (sobre-escribir el creado 
## previamente) el cual es un vector de caracteres de longitud 300 y que es una 
## muestra aleatoria de n�meros enteros de 1 a 10.

is.numeric(rand.3)
# Esto debe ser falso (FALSE). 

is.character(rand.3)
# Esto deber�a ser TRUE

class(rand.3)
mode(rand.3)
length(rand.3)
# Confirma la clase, el modo y la longitud del objeto creado.


rand.4 <- as.numeric(rand.3)
# Crea un vector de transformaci�n de los valores en 'rand.3' a n�meros.

## TAREA 13: Cree una objeto llamado "rand.5" utilizando la funci�n "as.factor" 
# para transofrmar el objeto "rand.4"
## TAREA 14: �Cu�l es la clase de "rand.5"?



plot(rand.4, col="lightgreen")
plot(rand.5, col="blue")
# Aunque en esencia ambos objetos tienen n�meros, la clase del objeto ("numeric" 
# o "factor") determina el comportamiento de la funci�n "plot" para graficar los
# datos


M.abund <- matrix(rpois(1000, 1)*rpois(1000, 10), ncol=50)
M.abund
## TAREA 15: �Qu� hace la funci�n de 'rpois'? �Qu� hace esta l�nea de c�digo?

class(M.abund)
## TAREA 16: Sin usar R, puede predecir las dimensiones de esta matriz?
## �Cu�l ser� su longitud? Confirmar sus predicciones utilizando las funciones
## "dim" y "length".


# Supongamos que la matriz 'M.abund' es una matriz de abundancias de especies
# (columnas) en varios sitios (filas). En matrices como esta es �til tener
# nombres para las filas y las columnas. La siguiente l�nea de c�digo crea 
# nombres para las columnas que representan diferentes especies.

## TAREA 17: Hay un error en la l�nea de abajo, lea el mensaje de error, 
## encuentre el error y solucionelo.
colnames(M.abund) <- paste("sp", 1:ncol("M.abund"), sep="_")
colnames(M.abund)
M.abund

## TAREA 18: �Puede predecir cu�l ser� el resultado de la siguiente l�nea de 
## c�digo?
class(colnames(M.abund))

## TAREA 19: Ahora, escriba el c�digo para dar nombres a las filas 
## (que representan sitios) en esta la matriz.


M.presence <- M.abund > 0
## Luego vamos a aprender en m�s detalle sobre operadores en R, pero por ahora, 
## lo que esta l�nea de c�digo hace es comparar cada elemento de la matriz 
## 'M.abund' al valor 0. Este c�digo produce una nueva matriz llena de valores 
## TRUE o FALSE, dependiendo de si los valores en 'M.abund' son mayores a 0 
## o no. Las dimensiones de la nueva matriz son id�nticas a la original. 

M.presence
## Confirma que el objeto se ve de la forma que deber�a. Observe que la nueva 
## matriz hereda los nombres de columnas y filas de la matriz 'M.abund'.

## TAREA 20: �Cu�l ser� la clase de "M.presence"? �Cu�l ser� su modo?


spp.abund <- colMeans(M.abund)
# La funci�n "colMeans" calcula los promedios (medias) de cada columna. Esto 
# produce un vector con la media del n�mero de individuos para cada especie.

## TAREA 21: �Cu�les son los nombres de los elementos de este vector? �De d�nde 
## vienen estos nombres?


spp.occup <- colSums(M.presence)
# Este es un truco muy �til: R maneja TRUEs como 1s y FALSEs como 0s. As�, hacer 
# una suma por columnas de M.presence (llena de TRUE o FALSE) produce un vector 
# que cuenta el n�mero de sitios en los que cada especie est� presente.

# Ahora, veamos si hay una relaci�n entre la abundancia y la ocupancia de cada 
# especie en estos datos simulados.

LM.abund.occup <- lm(spp.abund~spp.occup)
## TAREA 22: �Qu� hace la funci�n 'lm'?
## TAREA 23: �Cu�l es la clase del objeto "LM.abund.occup"?
## TAREA 24: Investige la estructura de este objeto con la funci�n 'str'.
## TAREA 25: Utilice la funci�n "summary" sobre este objeto para obtener los 
## resultados.
## TAREA 26: Haga un simple diagrama de dispersi�n que corresponde a este 
## an�lisis utilizando la funci�n "plot".

## TAREA 27: Haga un an�lisis similar que investiga la relaci�n entre
## el n�mero total de individuos en un sitio con la riqueza (n�mero de especies)
## por sitio (use "rowSums" para obtener el n�mero total de individuos por 
## sitio).


rm(M.abund)
## TAREA 28: �Qu� hace la funci�n "rm"?


sim.matrix <- matrix(rpois(50, 5), nrow=10, ncol=5)
# Crea una matriz de 5 columnas y 10 filas, llen�ndolo con valores aleatorios a 
# partir de una distribuci�n de Poisson con una media de 5.

rownames(sim.matrix) <- paste("site", 1:nrow(sim.matrix), sep="_")
colnames(sim.matrix) <- paste("sp", 1:ncol(sim.matrix), sep="_")
# Crea nombres de filas y columnas para "sim.matrix".



letters
# 'letters' es un vector pre-derminado en R que contiene el alfabeto.

L.vector <- sample(c(letters, LETTERS), 50, replace=TRUE)
## TAREA 29: �Cu�les son la clase, el modo y longitud de este vector ("L.vector")?
## TAREA 30: Cree un vector con una sequencia de n�meros enteros de 1 a la 
## longitud del vector de L.vector.
## TAREA 31: utilice el vector del paso anterior para poner nombres a los 
## elementos del vector "L.vector"

## TAREA 32: Cree una matriz denominada "L" que contiene los valores en el 
## vector "L.vector", y que tiene 5 filas (y tantas columnas como sean 
## necesarias para contener los datos).


### ** Descarge el archivo: StreblidaeOnBats.txt desde el sitio web del taller ** ###

# Usando de la siguiente l�nea de c�digo, abra el archivo "StreblidaeOnBats.txt".
# Esta linea tambi�n pone los contenidos del archivo en un objeto llamado "streb".


streb <- read.table(file.choose(), header=TRUE, sep="\t")
# Este set de datos contiene informaci�n sobre la abundancia y riqueza de tres
# especies de ectopar�sitos en murci�lagos hospederos (filas). Estos datos 
# fueron colectados en m�ltiples localidades en Ecuador.

## TAREA 33: Sin utilizar R, �sabe qu� tipo de objeto es "streb"? Confirme su 
## predicci�n en R.

dim(streb)
# Indica las dimensiones del Streb.


## TAREA 34: �Cu�ntas observaciones y cu�ntas variables existen en este set de 
## datos?
## TAREA 35: Obtenga los nombres de las variables en este set de datos.


rownames(streb)
# Obtiene los nombres de las filas/observaciones en el set de datos.

## TAREA 36: Cambie el nombre de las fila utilizando una combinaci�n caracteres 
## "obs_" con el n�mero de cada observaci�n; por ejemplo 'obs_1', 'obs_2', etc.
## TAREA 37: �Cu�l es la estructura del conjunto de datos? Utilice la funci�n 
## "str".
## TAREA 38: Haga un resumen del conjunto de datos - utilice la funci�n 
## "summary".


streb_sex <- streb$Sex
# Luego vamos a aprender m�s acerca sobre indizaci�n, pero por ahora, la l�nea 
# de arriba toma la columnas denominada "Sex" en el marco de datos "streb", y 
# pone los datos en un nuevo objeto llamado 'streb_sex'.
## TAREA 39: �Cu�l es la clase de "streb_sex"?

streb_sex.2 <- as.character(streb$Sex)
## TAREA 40: �Cu�l es la clase de "streb_sex.2"?

## TAREA 41: �Puede predecir los resultados de las siguientes l�neas de c�digo?
levels(streb_sex)
levels (streb_sex.2)


## TAREA 42: �Puede predecir los resultados de las siguientes l�neas de c�digo?
plot(streb_sex)
plot(streb_sex.2)

## N�tese c�mo estas dos l�neas imprimen los datos ligeramente diferentes
streb_sex
as.character(streb_sex)

## TAREA 43: Utilice la funci�n "identical" para comparar "streb_sex" y 
## "streb_sex.2". Los dos objetos tienen los mismos datos?

SexMatrix <- cbind(streb_sex, as.character(streb_sex))
# La funci�n "cbind" concatena vectores para hacer matrices, cada vector se 
# convierte en una columna distinta.

SexMatrix
## TAREA 44: �Qu� pas� con los datos del factor "streb_sex" cuando se usa para
## crear una matriz?

## Ejecute el siguiente c�digo, el cual crea una serie de vectores:
V1 <- rnorm(10)
class(V1)

V2 <- rpois(10,  5)
class(V2)

V3 <- sample(letters, 10)
class(V3)

V4 <- sample(c(TRUE, FALSE), 11, replace=TRUE)
class(V4)

## TAREA 45: �Puede predecir (antes de correr el c�digo) si el siguiente 
## c�digo producir� un error?
DF <- data.frame(V1, V2, V3, V4)

## TAREA 46: Cambie c�mo se cre� "V4" para que tenga solo 10 elementos. Entonces
## produzca el marco de datos otra vez utilizando los vectores "V1" a "V4."
## TAREA 47: Produzca una lista con el nombre "DF.list" que tenga los mismos 
## datos que "DF", y donde cada elemento de la lista sea uno de los vectores 
## V1 a V4.




















################################################################################
### SOLUCIONES PARA TAREAS #####################################################
################################################################################

## TAREA 1 ##
class(rand.1) # Vector num�rico


## TAREA 2 ##
mode(rand.1)


## TAREA 3 ##
length(rand.1)


## TAREA 4 ##
mean(rand.1)
sd(rand.1)


## TAREA 5 ##
rand.1 <- rand(100, mean=5, sd=1.5)


## TAREA 6 ##
mean(rand.1)
sd(rand.1)
# No, porque estas son muestras independientes


## TAREA 7 ##
rand.2 <- as.character(rand.1)


## TAREA 8 ##
help(identical)
# Comprueba si dos objetos son exactamente iguales. Es FALSE, porque se trata de 
# un vector num�rico versus un vector de caracteres


## TAREA 9 ##
rand.3 <- as.numeric(rand.2)


## TAREA 10 ##
rand.1 - rand.3
# Las diferencias est�n cerca, pero no son exactamente cero. En el cambio de 
# tipo de datos se pierde cierta precisi�n


## TAREA 11 ##
help(sample)
sample(x=seq.1, size=10, replace=TRUE)


## TAREA 12 ##
rand.3 <- as.character(sample(1:10, size=300, replace=TRUE))


## TAREA 13 ##
rand.5 <- as.factor(rand.4)


## TAREA 14 ##
class(rand.5)


## TAREA 15 ##
help(rpois)
# rpois toma valores al azar de una distribuci�n Poisson

M.abund <- matrix(rpois(1000, 1)*rpois(1000, 10), ncol=50)
                    # 1. Crear un vector de 100 valores a partir de una 
                    #    distribuci�n de Poisson con lambda = 1
                    # 2. Crear otro vector como en el paso 1.
                    # 3. Multiplica cada elemento de los vectores creados en los 
                    #    pasos 1 y 2.
                    # 4. Pone el resultado del paso 3 en una matriz de 50 
                    #    columnas y tantas filas como sean necesarias.


## TAREA 16 ##
# 50 columnas establecidas en el momento de ajustar el par�metro ncol = 50
# 20 filas porque, con 50 columnas, se necesitan 20 filas para almacenar 1000 valores
# Longitud de 1000 porque son 1000 valores en esta matriz
dim(M.abund)
length(M.abund)


## TAREA 17 ##
# Cuando se utiliza "M.abund", esperamos acceder a los valores dentro del objeto 
# (matriz).
# Debido a que est� entre comillas, le estamos diciendo que esto es pedazo de 
# texto, no el nombre de un objeto
colnames(M.abund) <- paste("sp", 1:ncol(M.abund), sep="_")


## TAREA 18 ##
# Ser� carcter porque, a pesar de que los valores dentro de "M.abund" son 
# n�meros, los nombres de "M.abund" son texto. Aqu� estamos pidiendo la clase de 
# los nombres, no la clase de la matriz
class(colnames(M.abund))


## TAREA 19 ##
rownames(M.abund) <- paste("site", 1:nrow(M.abund), sep="_")


## TAREA 20 ##
class(M.presence)
mode(M.presence)


## TAREA 21 ##
names(spp.abund)
# Estas son las sumas por columna, por lo tanto los nombres provienen de los 
# nombres de las columnas de "M.presence"


## TAREA 22 ##
help(lm)
# "lm" crea modelos lineales 


## TAREA 23 ##
class(LM.abund.occup)


## TAREA 24 ##
str(LM.abund.occup)


## TAREA 25 ##
summary(LM.abund.occup)


## TAREA 26 ##
plot(spp.occup, spp.abund, cex=1.5, pch=21, col="black", bg="grey30",
  xlab="Species Occupancy", ylab="Species Mean Abundance")


## TAREA 27 ##
site.density <- rowSums(M.abund)
site.rich <- rowSums(M.presence)

plot(site.density, site.rich, cex=1.5, pch=21, col="black", bg="grey30",
  xlab="Site Density", ylab="Site Richness")

LM.rich.dens <- lm(site.rich~site.density)
summary(LM.rich.dens)


## TAREA 28 ##
help(rm)
# "rm" remueve objetos de la sesi�n de R


## TAREA 29 ##
class(L.vector)
mode(L.vector)
length(L.vector)


## TAREA 30 ##
seq(from=1, to=length(L.vector), by=1)
# or
1:length(L.vector)


## TAREA 31 ##
names(L.vector) <- 1:length(L.vector)


## TAREA 32 ##
L <- matrix(L.vector, nrow=5)


## TAREA 33 ##
# data.frame. La funcion "read.table" siempre produce marcos de datos
class(streb)


## TAREA 34 ##
dim(streb)
# 139 observaciones
# 13 variables


## TAREA 35 ##
colnames(streb)


## TAREA 36 ##
rownames(streb) <- paste("obs", 1:nrow(streb), sep="_")


## TAREA 37 ##
str(streb)


## TAREA 38 ##
summary(streb)


## TAREA 39 ##
class(streb_sex)


## TAREA 40 ##
class(streb_sex.2)


## TAREA 41 ##
levels(streb_sex) # Reporta los niveles de la variable
levels(streb_sex.2) # Reporta nada porque este no es un factor


## TAREA 42 ##
plot(streb_sex) # Hace un plot del n�mero de observaciones por nivel
plot(streb_sex.2) # No hace nada porque este es un vector de caracteres


## TAREA 43 ##
identical(streb_sex, streb_sex.2)


## TAREA 44 ##
SexMatrix
# Debido a que las matrices pueden contener s�lo un tipo de datos, estos datos
# num�ricos se transformaron a texto


## TAREA 45 ##
# Debido a que el �ltimo vector utilizado para construir el marco de datos 
# contiene 11 valores, mientras que todos los otros contienen 10


## TAREA 46 ##
V4 <- sample(c(TRUE, FALSE), 10, replace=TRUE)
DF <- data.frame(V1, V2, V3, V4)


## TAREA 47 ##
DF.list <- list(V1, V2, V3, V4)
str(DF.list)
