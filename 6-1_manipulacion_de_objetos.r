################################################################################
### R BASICS WORKSHOP                                                                                                            ###
### PRESENTATION 7-1: MANIPULACI�N DE OBJETOS - INDEXACI�N                                   ### 
###                                                                                                                                                     ###
### Unida de Servicios Bioinform�ticos                                                                                            ###
### Instituto Nacional de Medicina Gen�mica                                                                                  ###
### Website: github.com/hachepunto/R_Basics_workshop                                                             ### 
################################################################################


## INTRODUCCI�N ################################################################
# El sistema de indexaci�n es una manera eficiente y flexible de acceder 
# selectivamente a elementos de un objeto. La indexaci�n puede ser num�rica, 
# l�gica o por nombres. Para indexar se utilizan los corchetes o par�ntesis 
# cuadrados *[ ]* y el s�mbolo *$*. Adem�s, en esta secci�n aprenderemos el uso 
# de algunas otras funciones �tiles como *which*, *unique*, y *str*. 

# Esta parte del taller esta dividida en las siguientes secciones:

## Tipos de indexaci�n ##
# A. Indexaci�n num�rica
# B. Indexaci�n l�gica
# C. Indexaci�n utilizando *which*
# D. Indexaci�n por nombres

# E. Reemplazar elementos de un objeto

## Indexaci�n por clases de objetos ##
# F. Indexaci�n de vectores
# G. Indexaci�n de matrices
# H. Indexaci�n de marcos de datos
# I. Indexaci�n de listas
# J. Indexaci�n de otros objetos - ejemplo con objeto "lm"



### A. INDEXACI�N NUM�RICA #####################################################

# Supongamos que tenemos un vector con 20 individuos de arboles de 4 especies
spp <- rep(paste("sp", c("a", "b", "c", "d"), sep="_"), each=5)
spp

class(spp)
length(spp)

# Supongamos ahora que tenemos un vector con medidas de densidad de madera para
# cada individuo
wood.density <- c(8.0766242,  9.8493313,  2.9028278, 10.0433943,  0.1470901, 
  12.5288041, 10.6120501, 14.6478501,  8.2003356, 17.9935623, 12.4214381, 
  18.3749778, 24.0950527, 19.3236943, 15.5498672, 22.0520207, 28.9908186, 
  17.5659344, 26.0387389, 14.1152262)
wood.density
class(wood.density)
length(wood.density)



# Se utiliza el numero del elemento que se quiere extraer entre corchetes *[ ]*. 
spp[2]
spp[10]

wood.density[2]
wood.density[10]

# Tambi�n se puede extraer m�s que un solo numero
spp[c(7,7,7)]
wood.density[c(2,5,7)]


## IMPORTANTE: en la indexaci�n num�rica se puede utilizar el signo de resta *-*
## para extraer todos los elementos excepto aquellos que se indican entre corchetes

spp[2] # Esto extrae el segundo elemento
spp[-2] # Esto extrae todos los elementos excepto el segundo!

wood.density[c(2,5,7)] # Esto extrae los elementos 2, 5 y 7
wood.density[-c(2,5,7)] # Esto extrae todo, excepto los elementos  2, 5 y 7



### B. INDEXACI�N L�GICA #######################################################
# Se utiliza valores TRUE y FALSE entre corchetes *[]* para extraer elementos. 
# Esto extrae los elementos que corresponden a TRUE.

wood.density
wood.density < 15 # Esto genera un vector l�gico donde TRUE son valores de 
                  # *wood.density* < 15

wood.density[wood.density<15] # Esto extrae los elementos de *wood.density* que 
                              # son menores que 15

spp[wood.density<15] 

spp=="sp_b"            
wood.density[spp=="sp_b"] 


# Tambi�n se pueden utilizar condiciones m�s complejas
wood.density[spp=="sp_b" | spp=="sp_c"] 

wood.density[spp=="sp_b" & spp=="sp_c"] 

wood.density[spp=="sp_b" & wood.density>15] 


                  
wood.density[wood.density<15 & wood.density>25]

wood.density[wood.density>15 & wood.density<25]

wood.density[wood.density<15 | wood.density>25]



### C. INDEXACI�N UTILIZANDO *which* ###########################################
# Esta funci�n da la posicion de los elementos que cumplen una cierta condici�n

# En que elementos de *wood.density* el valor es mayor que 15?
which(wood.density>15) # IMPORTANTE: Estos no son los elementos de wood.density 
                       # pero sus posiciones!

# Que elementos de *wood.density* son mayores que 15?
wood.density[which(wood.density>15)] # Esto, en cambio, extrae los valores de 
                                     # *wood.density*

spp[which(wood.density>15)] 

which(spp=="sp_b") 
wood.density[which(spp=="sp_b")]


                  
### D. INDEXACI�N POR NOMBRES ##################################################
# Se utiliza nombres de elementos entre corchetes *[]* para extraerlos                  

# Para este tipo de indexaci�n, los elementos deben tener nombres:     
wood.density
names(wood.density) <- length(wood.density):1
wood.density

spp
names(spp) <- length(spp):1 # Aqu� es mejor no utilizar nombres repetidos
spp


wood.density["3"] # Extrae el valor en *wood.density* que tiene el nombre "3"

wood.density[spp=="sp_c"] # Esto, en cambio, extrae el valor en *wood.density* 
                          # que corresponde a "spp_c" en *spp*
       
spp["15"] 
spp[15] 


# Tambi�n se pueden extraer varios elementos por nombre
wood.density[c("4", "8", "20")]
wood.density[c(4, 8, 20)] # Estas dos l�neas NO son equivalentes

spp[c("4", "8", "20")]
spp[c(4, 8, 20)] # Estas dos l�neas NO son equivalentes




### E. REEMPLAZAR VALORES EN UN OBJETO #########################################
# El sistema de indexaci�n nos permite reemplazar o re-escribir los valores de
# elementos particulares dentro de un objeto

spp
spp[c(1,4,18)]


spp[c(1,4,18)] <- "spp_x"

spp <- c(spp, "sp_aslj")

spp




### F. INDEXACI�N DE VECTORES ##################################################
# La indexaci�n de vectores la practicamos ya en tipos de indexaci�n. Los valores
# que quieren extraerse van entre corchetes.




### G. INDEXACI�N DE MATRICES ##################################################

# Abramos un archivo de datos (data_carbondioxideyearlyemissions.txt) para 
# practicar indexaci�n de matrices. Esto contiene datos de emisiones de CO2
# por pa�s (columnas) por a�o (filas).
CO2 <- read.table(file=file.choose(), header=TRUE, row.names=1, sep="\t")

dim(CO2)
class(CO2) # La funci�n *read.table* siempre produce un marco de datos

# Transformemos el marco de datos a una matriz
CO2 <- as.matrix(CO2)
class(CO2)
head(CO2)

# La manera m�s com�n de indexar matrices es por fila y por columna.
CO2[150, 30] # Esto extrae el valor en la fila 150 y la columna 30 de la matriz

rownames(CO2)[150]
colnames(CO2)[30]

## IMPORTANTE: siempre las filas se especifican primero, seguido de una coma, y 
## finalmente las columnas
CO2[200, 45]
CO2[45, 200]
CO2[240, 155]


# Tambi�n se pueden extraer varias columnas y/o filas al mismo tiempo
CO2[c(200, 45, 240), c(45, 200, 155)]


## IMPORTANTE: Cuando queremos todos los elementos de una fila o una columna,
## simplemente no especificamos nada. Por ejemplo:

CO2[,100] # Esto extrae todos los elementos de la columna numero 100
CO2[240, ] 
CO2[10, ] 

CO2[-10, ] # Esto extrae todos los elementos excepto la fila numero 10
CO2[, -100] 
              

# Las matrices tambi�n se pueden indexar por los nombres de las filas o las 
# columnas

CO2[2010, ] # Esto genera un error porque no hay 2010 filas
CO2["2010", ] # Esto NO genera un error porque estamos haciendo una 
              # indexaci�n de la fila llamada "2010" 
                 
CO2["2010", "Mexico"] 
                      

# Como han cambiado las emisiones de CO2 en M�xico?
years <- as.numeric(rownames(CO2))

plot(CO2[, "Mexico"] ~ years, col="forestgreen")


# Como cambiaron las emisiones de CO2 en M�xico en el siglo 21?
plot(CO2[years>2000, "Mexico"] ~ years[years>2000], 
  col="forestgreen", type="b")

  
# Como se comparan las emisiones en M�xico con las de EEUU y Ecuador
plot(CO2[, "United.States"]~years, col="navy", type="l", lwd=4, ylab="Emisiones")

points(CO2[, "Mexico"]~years, col="forestgreen", type="l", lwd=4)
points(CO2[, "Ecuador"]~years, col="gold", type="l", lwd=4)


# Podemos arruinar los datos cambiando algunos valores a 0
CO2[years>1950, "Mexico"] <- 0

plot(CO2[, "Mexico"] ~ years, col="forestgreen", type="b")


## IMPORTANTE: las matrices tambi�n pueden indexarse por numero de elemento, no
## solamente por fila y columna

M <- matrix(letters[-26], ncol=5)
colnames(M) <- paste("var", 1:ncol(M), sep="_")

M
class(M)
dim(M)

# Estos pares comandos extraen el mismo elemento
M[2, 2] 
M[7]

M[5,5]
M[25]




### H. INDEXACI�N DE MARCOS DE DATOS ###########################################
# La indexaci�n de marcos de datos es muy parecida a la de matrices excepto por
# estos dos aspectos:

# 1. Los marcos de datos no pueden indexarse por numero de elemento, solo 
# por filas y columnas

M.df <- as.data.frame(M)

class(M)
M[2,2]
M[7]

class(M.df)
M.df[2,2]
M.df[7]


# 2. Las columnas (variables) en un marco de datos tambien se pueden indexar
# por nombre utilizando el s�mbolo *$* despu�s del nombre del objeto. Esto no 
# se puede hacer en las matrices:

colnames(M)

M.df[,"var_2"]
M.df$var_2

M[,"var_2"]
M$var_2



# Esto abre la base de datos "iris" que esta en el paquete "datasets". 
# (http://en.wikipedia.org/wiki/Iris_flower_data_set).
data(iris)
help(iris)

class(iris)
dim(iris)

str(iris) # La funci�n *str* reporta un resumen de la estructura de un objeto

iris[,1:4] # Estas primeras columnas son variables morfol�gicas
iris[,5] # Esta ultima columna  tiene nombres de especies


morpho <- iris[,1:4]

species <- iris$Species

class(species)
levels(species)

species <- as.vector(species)
class(species)
unique(species) # Crea una lista de valores �nicos


# Grafico de la longitud del s�palo y longitud del p�talo de I. setosa y 
# I. virginica
plot(morpho$Sepal.Length ~ morpho$Sepal.Width, type="n")

points(morpho$Sepal.Length[species=="setosa"] ~ 
    morpho$Sepal.Width[species=="setosa"], col="gold")
    
points(morpho$Sepal.Length[species=="versicolor"] ~ 
    morpho$Sepal.Width[species=="versicolor"], col="navy")

points(morpho$Sepal.Length[species=="virginica"] ~ 
    morpho$Sepal.Width[species=="virginica"], col="red")



### I. INDEXACI�N DE LISTAS ####################################################

L1 <- list(c(0.01, 3.1), c(0.02, 4.0, 0.1), c("a"), c(0.01, 2.9), c(0.03), 
    c(0.04, 3.4, 8.2, 1.6)) 
    
class(L1)
L1

length(L1)
str(L1)

names(L1) <- paste("elem", 1:length(L1), sep="_")
L1

L1.1 <- L1[1] # *[]* extrae el primer elemento de la lista como una lista
L1.1
class(L1.1)

L1.1 <- L1[[1]] # *[[]]* Extrae el primer elemento de la lista como el vector
                # que contiene
L1.1
class(L1.1)


L1[-1]
L1[1:3]

L1["elem_1"] # En listas, tambi�n se puede hacer indexaci�n por nombres
class(L1["elem_1"])

L1[["elem_1"]]
class(L1[["elem_1"]])
 
L1$elem_1 
class(L1$elem_1)

# Otras manipulaciones:
L1[2:4][1]
L1[1:3][-1]

L1[[1]]
L1[[1]][2]

L1[[1]]
L1[[1]][1]

L1[[1]]<-3
L1

L1[[2]]
L1[[2]] > 2

L1[[2]] [L1[[2]]<1]



### J. INDEXACI�N DE UN OBJETO 'LM' ############################################

# Abramos un archivo de datos (Data_BatsEnviroAmerica.txt) para crear un modelo 
# lineal y practicar indexaci�n. Este archivo contiene datos de riqueza de 
# especies de murci�lagos en el Nuevo Mundo as� como de varias variables 
# ambientales en celdas de 100 x 100 km.

bat.data <- read.table(file=file.choose(), header=TRUE, sep="\t")
dim(bat.data)
class(bat.data) 

colnames(bat.data)

length(which(bat.data$richness == 0)) # Haciendo indexaci�n podemos saber 
                                      # cuantos 0s hay en los datos
length(which(bat.data$richness > 0))


# Para el resto de an�lisis vamos a eliminar todas las celdas que tienen 
# riqueza 0 (no tienen murci�lagos)
dim(bat.data)
bat.data <- bat.data[-which(bat.data$richness==0), ]
dim(bat.data)

hist(bat.data$richness) # Haciendo indexaci�n de la columna "richness" podemos
                        # crear un histograma de los valores de riqueza 

plot(bat.data$richness ~ bat.data$temp_AVG)                   

par(mfrow=c(1,2))
plot(log(bat.data$richness) ~ bat.data$temp_AVG)                   
plot(log(bat.data$richness) ~ bat.data$ele_RANGE)                   

model.1 <- lm(log(bat.data$richness) ~ scale(bat.data$temp_AVG) + 
  scale(bat.data$ele_RANGE))
  
summary(model.1)

class(model.1)
str(model.1) # A pesar de que este es un objeto lm tiene la estructura de lista

model.1[[1]] # Indexaci�n num�rica para extraer coeficientes
model.1$coefficients # Indexaci�n por nombres para extraer coeficientes

model.1$coefficients[1] # Indexaci�n por nombres y num�rica para el intercepto
model.1$coefficients["(Intercept)"] # Indexaci�n por nombres para el intercepto

model.1$coefficients[2]
model.1$coefficients[3]

model.1$residuals[1:10]

model.1$fitted.values[1:10]

plot(log(bat.data$richness) ~ bat.data$temp_AVG )                   
points(model.1$fitted.values ~ bat.data$temp_AVG, col="red")                   


library(car) # Abre el paquete *car*
avPlots(model=model.1) # Esto produce un grafico de "variables a�adidas" o de 
                       # "residuos parciales" mostrando el efecto de cada variable

?avPlots

