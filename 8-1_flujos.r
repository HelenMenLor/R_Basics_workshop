################################################################################
### R BASICS WORKSHOP                                                                    ###
### PRESENTATION 8-1: CONTROL DE FLUJO                                         ### 
###                                                                                                 ###
### Unida de Servicios Bioinform�ticos                                      ###
### Instituto Nacional de Medicina Gen�mica                                                               ###
### Website: github.com/hachepunto/R_Basics_workshop                                         ### 
################################################################################

### INTRODUCCION ###############################################################

# En R hay una serie de elementos que te permiten controlar el flujo del código.
# Hay 4 tipos principales maneras de controlar flujo:

# 1. Bucles (loops) *for*
# 2. Bucles (loops) *while*
# 3. Condicionales 
# 4. Rupturas (breaks)

# Para esta presentación nos vamos a enfocar en *for*, *while* e *if*

## IMPORTANTE: para ayuda con control de flujo:
help(Control)


#########################
## Un ejemplo pr�ctico ##
#########################

# El objetivo del ejemplo es crear un mapa que muestra la distribuci�n de 
# especies de �rboles a trav�s de una parcela de bosque. Cada individuo se 
# representa por un punto, y cada especie por un color diferente.

# Abra una versi�n de los datos de la Parcela De Din�micas Forestales de Tyson. 
# Este conjunto de datos contiene informaci�n sobre la identidad y distribuci�n 
# de individuos de �rboles a trav�s de un �rea de 25 hect�reas en el Centro de 
# Investigaci�n Tyson cerca de St. Louis, MO. (Los datos han sido algo 
# aleatorizados. Gracias a Jonathan A. Myers por los datos).

tyson <- read.table(file=file.choose(), header=TRUE, sep="\t")

# Compruebe que los datos est�n bien abiertos
dim(tyson)
head(tyson)


# Ahora, vamos a hacer un mapa de la distribuci�n de las especies de �rboles en 
# la parcela de bosque

# OPCI�N 1: SIN BUCLES #

sp.list <- unique(tyson$spcode)
colors <- adjustcolor(rainbow(length(sp.list)), alpha.f=0.8)

tiff(filename="TysonForestMap_1.tif", width=10, height=10, units="in", res=300)

  # Crea una gr�fica vac�a
  plot(tyson$gx, tyson$gy, xlab="x", ylab="y", asp=1, type="n", cex.lab=1.5,
       cex.axis=1.5)

 # Grafica los �rboles de la especie "ulmrub"
  points(tyson$gx[tyson$spcode=="ulmrub"], tyson$gy[tyson$spcode=="ulmrub"],
         pch=16, col=colors[1])

  # Grafica los �rboles de la especies "lonmaa"
  points(tyson$gx[tyson$spcode=="lonmaa"], tyson$gy[tyson$spcode=="lonmaa"],
         pch=16, col=colors[2])

  # etc.
  points(tyson$gx[tyson$spcode=="asitri"], tyson$gy[tyson$spcode=="asitri"],
         pch=16, col=colors[3])

  points(tyson$gx[tyson$spcode=="acerub"], tyson$gy[tyson$spcode=="acerub"],
         pch=16, col=colors[4])

  points(tyson$gx[tyson$spcode=="diovir"], tyson$gy[tyson$spcode=="diovir"],
         pch=16, col=colors[5])

  points(tyson$gx[tyson$spcode=="linben"], tyson$gy[tyson$spcode=="linben"],
         pch=16, col=colors[6])

  points(tyson$gx[tyson$spcode=="cercan"], tyson$gy[tyson$spcode=="cercan"],
         pch=16, col=colors[7])

  points(tyson$gx[tyson$spcode=="celocc"], tyson$gy[tyson$spcode=="celocc"],
         pch=16, col=colors[8])

  points(tyson$gx[tyson$spcode=="unknown"], tyson$gy[tyson$spcode=="unknown"],
         pch=16, col=colors[9])

  points(tyson$gx[tyson$spcode=="plaocc"], tyson$gy[tyson$spcode=="plaocc"],
         pch=16, col=colors[10])

  points(tyson$gx[tyson$spcode=="pruser"], tyson$gy[tyson$spcode=="pruser"],
         pch=16, col=colors[11])

  points(tyson$gx[tyson$spcode=="ostvir"], tyson$gy[tyson$spcode=="ostvir"],
         pch=16, col=colors[12])

  points(tyson$gx[tyson$spcode=="carcor"], tyson$gy[tyson$spcode=="carcor"],
         pch=16, col=colors[13])

  points(tyson$gx[tyson$spcode=="tilame"], tyson$gy[tyson$spcode=="tilame"],
         pch=16, col=colors[14])

  points(tyson$gx[tyson$spcode=="prusp"], tyson$gy[tyson$spcode=="prusp"],
         pch=16, col=colors[15])

  points(tyson$gx[tyson$spcode=="celten"], tyson$gy[tyson$spcode=="celten"],
         pch=16, col=colors[16])

  points(tyson$gx[tyson$spcode=="quesp"], tyson$gy[tyson$spcode=="quesp"],
         pch=16, col=colors[17])

  points(tyson$gx[tyson$spcode=="morrub"], tyson$gy[tyson$spcode=="morrub"],
         pch=16, col=colors[18])

  points(tyson$gx[tyson$spcode=="malioe"], tyson$gy[tyson$spcode=="malioe"],
         pch=16, col=colors[19])

  points(tyson$gx[tyson$spcode=="cordru"], tyson$gy[tyson$spcode=="cordru"],
         pch=16, col=colors[20])

  points(tyson$gx[tyson$spcode=="aceneg"], tyson$gy[tyson$spcode=="aceneg"],
         pch=16, col=colors[21])

  points(tyson$gx[tyson$spcode=="quemue"], tyson$gy[tyson$spcode=="quemue"],
         pch=16, col=colors[22])

  points(tyson$gx[tyson$spcode=="junvir"], tyson$gy[tyson$spcode=="junvir"],
         pch=16, col=colors[23])

  points(tyson$gx[tyson$spcode=="carsp"], tyson$gy[tyson$spcode=="carsp"],
         pch=16, col=colors[24])

  points(tyson$gx[tyson$spcode=="quealb"], tyson$gy[tyson$spcode=="quealb"],
         pch=16, col=colors[25])

  points(tyson$gx[tyson$spcode=="querub"], tyson$gy[tyson$spcode=="querub"],
         pch=16, col=colors[26])

  points(tyson$gx[tyson$spcode=="quevel"], tyson$gy[tyson$spcode=="quevel"],
         pch=16, col=colors[27])

  points(tyson$gx[tyson$spcode=="corflo"], tyson$gy[tyson$spcode=="corflo"],
         pch=16, col=colors[28])

  points(tyson$gx[tyson$spcode=="quemar"], tyson$gy[tyson$spcode=="quemar"],
         pch=16, col=colors[29])

  points(tyson$gx[tyson$spcode=="cartex"], tyson$gy[tyson$spcode=="cartex"],
         pch=16, col=colors[30])

  points(tyson$gx[tyson$spcode=="amearb"], tyson$gy[tyson$spcode=="amearb"],
         pch=16, col=colors[31])

  points(tyson$gx[tyson$spcode=="cargla"], tyson$gy[tyson$spcode=="cargla"],
         pch=16, col=colors[32])

  points(tyson$gx[tyson$spcode=="carova"], tyson$gy[tyson$spcode=="carova"],
         pch=16, col=colors[33])

  points(tyson$gx[tyson$spcode=="fraame"], tyson$gy[tyson$spcode=="fraame"],
         pch=16, col=colors[34])

  points(tyson$gx[tyson$spcode=="cartom"], tyson$gy[tyson$spcode=="cartom"],
         pch=16, col=colors[35])

  points(tyson$gx[tyson$spcode=="queste"], tyson$gy[tyson$spcode=="queste"],
         pch=16, col=colors[36])

  points(tyson$gx[tyson$spcode=="pruame"], tyson$gy[tyson$spcode=="pruame"],
         pch=16, col=colors[37])

  points(tyson$gx[tyson$spcode=="jugnig"], tyson$gy[tyson$spcode=="jugnig"],
         pch=16, col=colors[38])

  points(tyson$gx[tyson$spcode=="sasalb"], tyson$gy[tyson$spcode=="sasalb"],
         pch=16, col=colors[39])

  points(tyson$gx[tyson$spcode=="ailalt"], tyson$gy[tyson$spcode=="ailalt"],
         pch=16, col=colors[40])

  points(tyson$gx[tyson$spcode=="crasp"], tyson$gy[tyson$spcode=="crasp"],
         pch=16, col=colors[41])

  points(tyson$gx[tyson$spcode=="vibruf"], tyson$gy[tyson$spcode=="vibruf"],
         pch=16, col=colors[42])

  points(tyson$gx[tyson$spcode=="fracar"], tyson$gy[tyson$spcode=="fracar"],
         pch=16, col=colors[43])

  points(tyson$gx[tyson$spcode=="sidlan"], tyson$gy[tyson$spcode=="sidlan"],
         pch=16, col=colors[44])

  points(tyson$gx[tyson$spcode=="gletri"], tyson$gy[tyson$spcode=="gletri"],
         pch=16, col=colors[45])

  points(tyson$gx[tyson$spcode=="acesac"], tyson$gy[tyson$spcode=="acesac"],
         pch=16, col=colors[46])

dev.off()

# �C�mo se deber�a modificar el c�digo anterior para cambiar el tama�o de los 
# s�mbolos que representan a cada �rbol?



# OPCI�N 2: SI POR FAVOR, NECESITO UN BUCLE! #

sp.list <- unique(tyson$spcode)
colors <- adjustcolor(rainbow(length(sp.list)), alpha.f=0.8)

tiff(filename="TysonForestMap_2.tif", width=10, height=10, units="in", res=300)

  plot(tyson$gx, tyson$gy, xlab="x", ylab="y", asp=1, type="n", cex.lab=1.5,
       cex.axis=1.5)
  
  for(i in 1:length(sp.list))
    points(tyson$gx[tyson$spcode==sp.list[i]], tyson$gy[tyson$spcode==sp.list[i]],
           pch=16, col=colors[i])

dev.off()

# �C�mo se deber�a modificar el c�digo anterior (con el bucle) para cambiar el 
# tama�o de los s�mbolos que representan a cada �rbol?


################################################################################
### 1. BUCLES *for* ############################################################
################################################################################

# Un bucle permite repetir un pedazo de código múltiples veces sin tener que 
# repetirlo.

# *for* es la manera mas común de construir bucles. Este tipo de bucle repite 
# un pedazo de código un numero pre-determinado de veces.


# La estructura general de un bucle *for* es la siguiente:
#
# for(i in vector)
# {
#   code
# }


# Esto quiere decir aproximadamente:
#
# para cada valor que i toma del vector repetir
# {
#   este código
# }


#####################
## Ejemplo f�cil 1 ##
#####################

v <- 1:10

for(i in v)
{
    print(i)
}

# Esto se traduce como:
#
# Crear una secuencia del 1 al 10 y guardarla como un objeto llamado *v*
# 
# Para cada valor que la variable *i* toma del vector *v* hacer lo siguiente:
# imprimir el valor de i
#


#####################
## Ejemplo f�cil 2 ##
#####################

v <- letters

v

for(i in v)
{
    print(i)
}


#####################
## Ejemplo f�cil 3 ##
#####################

v <- letters

length(v)

result <- 0

for(i in v)
{
	print(i)
	result <- result + 1
}

result


#####################
## Ejemplo f�cil 4 ##
#####################

v <- c(1,3,5,2,4)

result <- 0

for(i in 1:length(v))
{
	print( c(i, v[i]) )

	result <- result + v[i]
}

result


#####################
## Ejemplo f�cil 5 ##
#####################

col.v <- rainbow(100)
cex.v  <- seq(1, 10, length.out=100)

plot(0:1, 0:1, type="n")

for(i in 1:200)
{
	print(i)

	points(runif(1), runif(1), pch=16, col=sample(col.v, 1), 
	    cex=sample(cex.v, 1))

	Sys.sleep(0.1)
}

#####################
## Ejemplo f�cil 6 ##
#####################

# La secuencia de Fibonacci es una secuencia famosa en matem�ticas. Los primeros 
# dos elementos son 1 y 1. Los elementos posteriores se definen como la suma de 
# los dos inmediatamente anteriores. Por ejemplo, el tercer elemento es 2 
# (1 + 1), el cuarto elemento es 3 (2 + 1), y as� sucesivamente. En este ejemplo, 
# vamos a calcular los primeros 'n' n�meros en la secuencia de Fibonacci.

# Esto crea una variable que determina la longitud de la secuencia de Fibonacci:
n <- 25

# A menudo es �til para crear un objeto vac�o que almacenar� los valores creados
# en cada iteraci�n de un bucle. En este caso, creamos un vector vac�o de
# longitud 'n':
fibonacci <- rep(NA, times=n)

# Comprobamos el contenido de 'fibonacci':
fibonacci

# Por definici�n, los primeros dos elementos de la secuencia son 1 y 1:
fibonacci[1] <- 1
fibonacci[2] <- 1

# Este bucle calcular� los elementos 3 a 'n' de la secuencia:
for(i in 3:n)
{
  # El elemento 'i' se calcula como la suma de los elementos'i-1' e 'i-2'
  fibonacci[i] <- fibonacci[i-1] + fibonacci[i-2]
}

# Ahora podemos ver el resultado del bucle - la secuencia de Fibonacci de 1 al 
# elemento "n":
fibonacci



################################################################################
### 2. BUCLES *while* ##########################################################
################################################################################

# *while* también es muy útil para construir bucles. Este tipo de bucle repite
# un pedazo de código mientras una condición determinada es cierta.

# La estructura general de un bucle *while* es la siguiente:
#
# while(condición)
# {
#   c�digo
# }

# Esto quiere decir aproximadamente:
#
# mientras esta condición es verdadera repetir
# {
#   este c�digo
# }


#####################
## Ejemplo f�cil 1 ##
#####################

v <- 1:10

# Versión 1
i <- 0
while(i < max(v))
{
	i <- i+1
	print(i)
}


#####################
## Ejemplo f�cil 2 ##
#####################
i <- 0
while(i < max(v))
{
	print(i)
	i <- i+1
}


#####################
## Ejemplo f�cil 3 ##
#####################

Bp <- 0.1 
Dp <- 0.1 
Np <- 1-Bp-Dp

max.t <- 100
time <- 0
abund <- 10

plot(c(0, max.t), c(0, 100), type="n")


while(abund>0 & time<= max.t)
{
	change <- sample(c(-1,0,1), size=abund, prob=c(Dp, Np, Bp), replace=TRUE)

	abund <- abund + sum(change)
	time <- time + 1

	points(time, abund, pch=16, col="black")
}



#####################
## Ejemplo f�cil 4 ##
#####################

## El bucle "WHILE DATING" ##

you <- runif(1, 0, 100) # Tu personalidad en un n�mero
your.pickiness.score <- 0.1 # Qu� tan cerca a tu personalidad quieres que sea tu
                            # esposa/esposo

date <- 0 # El n�mero inicial de personas con las que has salido
missmatch <- Inf # Tu diferencia inicial en personalidad antes de empezar a salir 
                 # con gente 

while(missmatch > your.pickiness.score)
{
  date <- date + 1

	they <- runif(1, 0, 100)
	missmatch <- abs(you - they)


	if(missmatch <= your.pickiness.score)
	{
	  print("Congratulations, you are getting married!!")
	  print(paste("You've dated", date, "people", sep=" "))
	}

}



################################################################################
### 3. CONDICIONAL: *if* #######################################################
################################################################################

# El condicional *if* permite correr un pedazo de código solamente si una 
# condic�n en particular es verdadera

#####################
## Ejemplo f�cil 1 ##
#####################

v <- 1:10

for(i in v)
{
	print(i)

	if(i == 5)
		print("Reached 5") # Con un solo comando, las llaves {} no son necesarias
}


#####################
## Ejemplo f�cil 2 ##
#####################

trait <- 0
max.time <- 100

plot(c(0,max.time), c(-20, 20), type="n", 	ylab="Trait Value", xlab="Time")

points(0, trait, pch=16, col="black")

for(i in 1:max.time)
{
	trait.shift <- rnorm(1, 0, 0.5)
	trait <- trait + trait.shift 

	if(trait.shift > 0) 
	    COL <- "gold"
	if(trait.shift < 0) 
	    COL <- "lightblue"
	
	points(i, trait, pch=16, col=COL)

	Sys.sleep(0.2)
}



################################################################################
### 4. RUPTURAS: *break* #######################################################
################################################################################

# La función *break* causa que un bucle termine. Se usa frecuentemente en 
# conjunto con un condicional

#####################
## Ejemplo f�cil 1 ##
#####################

v <- 1:10

for(i in v)
{
	print(i)

	if(i == 5) # Con mas de un comando, las llaves {} son necesarias
	{ 
		print("Reached 5")
		break()
	}
}



################################################################################
### 5. COMO EVITAR BUCLES ######################################################
################################################################################

# Los bucles son extremadamente útiles, pero también pueden ser lentos. Cuando
# es posible, es buena idea evitar utilizar bucles en R y utilizar funciones
# que ya existen en R. A esto se le llama: vectorización.

# Por ejemplo, supongamos que tenemos una matriz muy grande de abundancia de 
# 10 especies en 1,000,000 de sitios

M <- matrix(rpois(50000000, 10), ncol=50)


dim(M) 

head(M)

# Como calcular la abundancia total de individuos por sitio (fila)?


## Opci�n 1 - un bucle muy ineficiente ##

abund.1 <- numeric()

system.time( 
{
 
  for(i in 1:nrow(M)) 
  { 
	abund.1 <- c(abund.1, sum(M[i,]))
  } 

}) 


## Opci�n 2 - un bucle un poco mejor construido ##

abund.2 <- rep(NA, nrow(M))

system.time( 
{
 
  for(i in 1:nrow(M)) 
  { 
	abund.2[i] <- sum(M[i,])
  } 

}) 


## Opci�n 4 - vectorizaci�n ##
system.time( 
{
  abund.4 <- colSums(M)
}) 



?apply











