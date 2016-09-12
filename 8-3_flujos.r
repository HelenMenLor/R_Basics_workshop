################################################################################
### R BASICS WORKSHOP                                                                    ###
### EJERCICIO 9-3: Control de flujo                                          ###
###                                                                                                 ###
### Unida de Servicios Bioinform�ticos                                      ###
### Instituto Nacional de Medicina Gen�mica                                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                                         ### 
################################################################################

## OBJETIVO:
## PracticaR el uso de de bucles ("loops")

# El an�lisis de componentes principales (PCA) es un procedimiento estad�stico 
# que utiliza una transformaci�n ortogonal para convertir un conjunto de 
# observaciones de variables posiblemente correlacionadas en un conjunto de 
# variables linealmente ortogonales llamadas componentes principales. El n�mero 
# de componentes principales es menor o igual que al n�mero de variables 
# originales. Esta transformaci�n se define de tal manera que el primer 
# componente principal tiene la mayor varianza posible (es decir, representa 
# tanta variabilidad en los datos como sea posible), y cada componente 
# subsiguiente a su vez tiene la mayor varianza posible bajo la restricci�n de 
# ser ortogonal a los componentes anteriores (Wikipedia).

# El c�digo en este ejercicio examina la significancia estad�stica de un PCA 
# hecho sobre los datos morfol�gicos de los Iris de Edgar Anderson (ver 
# help(Iris)"). Para esto, utilizamos un m�todo basado en la randomizaci�n de 
# datos descrito en el apartado 2.1.2. de Peres-Neto et al. 2005 (How many 
# principal components? stopping rules for determining the number of non-trivial 
# axes revisited. Computational Statistics & Data Analysis 49:974-997.). Este 
# m�todo pone a prueba la significancia estad�stica de los "eigenvalues" del 
# PCA, y por lo tanto la significancia de cada componente principal. 

data(iris) # Carga el set de datos Iris del paquete "datasets"

iris[1:5, ] # Imprime las primeras 5 filas del marco de datos


## TAREA 1 ##
## Cree un objeto llamado morfo que contiene s�lo las primeras 4 columnas
## del marco de datos "iris"


pca.iris <- prcomp(morpho, scale=TRUE) 
# Esto corre un PCA usando la funci�n "prcomp" sobre los datos morfol�gicos

summary(pca.iris) 
# Hace un resumen de los resultados del PCA

str(pca.iris)
# Muestra la estructura de "pca.iris" que contienen los resultados del PCA

pca.iris$sdev 
# Este es un vector que contiene la ra�z cuadrada de los "eigenvalues" 

empirical.ev <- pca.iris$sdev
names(empirical.ev) <- paste("PC", 1:length(empirical.ev), sep=" ")
# Esto pone "eigenvalues" emp�ricos (de los datos reales) en un objeto. 
# Estos valores se compararan con "eigenvalues" generados al azar. 

# Para cada componente principal existe un "eigenvalue" o valores propio. Estos
# valores pueden interpretarse como proporcionales a la variaci�n de todas las
# variables originales (e.g. las variables morfol�gicas) que puede ser capturada
# por cada componente principal. 


## TAREA 2 ##
## Haga una "barplot" que muestre los "eigenvalues" emp�ricos


k <- 999
# Esto crea un objeto que va a definir el n�mero de iteraciones que la 
# prueba de aleatorizaci�n utilizar�


rand.ev <- matrix(data=NA, nrow=k, ncol=length(empirical.ev))
rownames(rand.ev) <- paste("rand", 1:k, sep="_")
# Esto crea una matriz "vac�a" (llena de NAs) que ser� llenada en cada iteraci�n 
# del bucle con "eigenvalues" aleatorios


for (i in 1:k)
{
  
  rand.morpho <- morpho
  # Esto copia los datos morfol�gicos emp�ricos que luego ser�n randomizados
  
  rand.morpho[,1] <- sample(rand.morpho[,1])
  # Esto aleatoriza la posici�n de los valores en la primera variable (columna) 
  # en "rand.morpho". 

  ## TAREA 3 ##
  ## Esta prueba se basa en la comparaci�n de los "eigenvalues" emp�ricos en 
  ## una PCA con "eigenvalues" del PCA donde las relaciones entre las variables 
  ## han sido randomizadas (donde las correlaciones entre las variables son 
  ## destruidas). Esto implica que los valores dentro de cada variable sean
  ## randomizados de manera independiente a como los valores son randomizados en 
  ## otras variables. Por esto:
  ## Repita el paso anterior de forma independiente para cada una de las otras
  ## columnas del marco de datos morfol�gico 
  

  ## TAREA 4 ##
  ## Despues de randomizar todas las variables, ejecute un nuevo an�lisis de 
  ## componentes principales pero esta vez utilizando los datos morfol�gicos 
  ## aleatorizados. Guarde los resultados de este PCA en un objeto denominado 
  ## "rand.pca.iris"


  ## TAREA 5 ##
  ## La l�nea de abajo pone los "eigenvalues" del PCA randomizado en la matriz
  ## "rand.ev". Con cada iteraci�n del bucle, se supone que el c�digo debe poner 
  ## estos valores en una fila distinta de esta matriz. Sin embargo hay un error,
  ## y los resultados est�n siempre siendo colocandos en la �ltima fila. 
  ## Solucione el problema en esta l�nea de c�digo.
  rand.ev[k,] <- rand.pca.iris$sdev
  
}
# termina el bucle


rand.ev <- rbind(empirical.ev, rand.ev)
# Combina por filas ("rbind") el vector de los "eigenvalues" emp�ricos con la 
# matriz de "eigenvalues" aleatorios. Esto coloca los valores emp�ricos en la 
# primera fila de la matriz "rand.ev"


## TAREA 6 ##
## Abra una ventana y dividala en 4 paneles con las funciones "par" o "layout"


hist(rand.ev[,1]^2, breaks=100, xlab="Eigenvalue", cex.lab=1.5, 
  cex.axis=1.5, main="PC 1")
# Esto crea un histograma con la distribuci�n del primer "eigenvalue" (columna 1),
# es decir de la variaci�n capturada por el primer componente principal


abline(v=rand.ev[1,1]^2, col="red")
# Esto resalta con una l�nea de la posici�n del "eigenvalue" emp�rico en esa 
# distribuci�n


sum(rand.ev[,1] >= rand.ev[1,1]) / (k+1) 
# Esto calcula el valor de p. El valor de p se calcula como la proporci�n de
# "eigenvalues" de la distribuci�n aleatorea que que son iguales o mayores que 
# el "eigenvalue" emp�rico. Tome en cuenta que estamos haciendo la suma de un 
# vector l�gico donde los TRUEs se tratan como 1 y los FALSE como 0.


## TAREA 7 ##
## Cree las figuras correspondientes para los "eigenvalues" 2, 3 y 4 en el resto
## de paneles de la figura que est� produciendo. Adem�s, calcule tambi�n los 
## valores de p para el resto de "eigenvalues".


## TAREA 8 ##
## Repita la figura, pero esta vez haga que se vea lo m�s profesional posible y
## guardela como un archivo TIFF con una alta resoluci�n (600 ppp).




















################################################################################
### SOLUCIONES PARA TAREAS #####################################################
################################################################################

## TAREA 1 ##
morpho <- iris[,1:4]


## TAREA 2 ##
barplot(empirical.ev^2, col="firebrick1", border="firebrick1", 
  xlab="Principal Components", ylab="Eigenvalue")


## TAREA 3 ##
rand.morpho[,2] <- sample(rand.morpho[,2])
rand.morpho[,3] <- sample(rand.morpho[,3])
rand.morpho[,4] <- sample(rand.morpho[,4])
  

## TAREA 4 ##
rand.pca.iris <- prcomp(rand.morpho, sclale=TRUE) 

 
## TAREA 5 ##
rand.ev[i,] <- rand.pca.iris$sdev


## TAREA 6 ##
par(mfrow=c(2,2))
#or
layout(m=matrix(1:4, ncol=2))
layout.show(4)


## TAREA 7 ##
hist(rand.ev[,2]^2, breaks=100, xlab="Eigenvalue", cex.lab=1.5, 
  cex.axis=1.5, main="PC 2")
abline(v=rand.ev[1,2]^2, col="red")
sum(rand.ev[,2] >= rand.ev[1,2]) / (k+1) 

hist(rand.ev[,3]^2, breaks=100, xlab="Eigenvalue", cex.lab=1.5, 
  cex.axis=1.5, main="PC 3")
abline(v=rand.ev[1,3]^2, col="red")
sum(rand.ev[,3] >= rand.ev[1,3]) / (k+1) 

hist(rand.ev[,4]^2, breaks=100, xlab="Eigenvalue", cex.lab=1.5, 
  cex.axis=1.5, main="PC 4")
abline(v=rand.ev[1,4]^2, col="red")
sum(rand.ev[,4] >= rand.ev[1,4]) / (k+1) 


## TAREA 8 ##
getwd() # Revise el directorio de trabajo y c�mbielo si es necesario


line.wd <- 2
line.col <- "black"
bar.col <- "firebrick3"
main.size <- 1.75
axis.size <- 1.5
lab.size <- 1.5
breaks.n <- 50


tiff(filename = "PCA_exercise.tiff", width = 25, height = 20, units = "cm", 
  pointsize = 12, res = 600)

  par(mfrow=c(2,2), mar=c(5, 6, 4, 2), mgp=c(3.75, 1, 0))
  
  hist(rand.ev[,1]^2, breaks=breaks.n, xlab="Eigenvalue", las=1, cex.lab=lab.size, 
    cex.axis=axis.size, main="PC 1", cex.main=main.size, col=bar.col, border=bar.col)
  abline(v=rand.ev[1,1]^2, col=line.col, lwd=line.wd)
  
  hist(rand.ev[,2]^2, breaks=breaks.n, xlab="Eigenvalue", las=1, cex.lab=lab.size, 
    cex.axis=axis.size, main="PC 2", cex.main=main.size, col=bar.col, border=bar.col)
  abline(v=rand.ev[1,2]^2, col=line.col, lwd=line.wd)
  
  hist(rand.ev[,3]^2, breaks=breaks.n, xlab="Eigenvalue", las=1, cex.lab=lab.size, 
    cex.axis=axis.size, main="PC 3", cex.main=main.size, col=bar.col, border=bar.col)
  abline(v=rand.ev[1,3]^2, col=line.col, lwd=line.wd)
  
  hist(rand.ev[,4]^2, breaks=breaks.n, xlab="Eigenvalue", las=1, cex.lab=lab.size, 
    cex.axis=axis.size, main="PC 4", cex.main=main.size, col=bar.col, border=bar.col)
  abline(v=rand.ev[1,4]^2, col=line.col, lwd=line.wd)

dev.off()


