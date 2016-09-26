################################################################################
### R BASICS WORKSHOP                                       				                     ###
### EJERCICIO 7-2: Gr�ficos                                                  ###
###                                                               						                      ###
### Unida de Servicios Bioinform�ticos    						                      ###
### Instituto Nacional de Medicina Gen�mica                                               			          ###
### Website: github.com/hachepunto/R_Basics_workshop			                                   ### 
################################################################################

## TAREA 1 ##
# Cargue el set de datos de "Iris" de Edgar Anderson

# Los siguientes argumentos se describen en la p�gina de ayuda de la funci�n
# "plot.default": "xlim" y "ylim." Utilize ambos argumentos en este c�digo para 
# modificar la gr�fica resultante, la misma que muestra la relaci�n entre dos
# variables morfol�gicas para especies de Iris:

plot(iris$Petal.Width, iris$Sepal.Width)


## TAREA 2 ##
# Vaya a la p�gina de ayuda para la funci�n "plot" y lea sobre estos 6 argumentos:
# "type", "main", "sub", "xlab", "ylab", y "asp". Utilice esa informaci�n para 
# modificar el c�digo anterior utilizando todos los cinco argumentos.


## TAREA 3 ##
# Considere este cambio en el c�digo de la tarea 2:

plot(iris$Petal.Width, iris$Sepal.Width, xlab="Petal Width (cm)", 
    ylab="Sepal Width (cm)", cex.axis=1.5, cex.lab=1.5, bty="n", pch=19)

# Note el uso del argumento "bty". Vaya a la p�gina de ayuda para la funci�n 
# "par" y lea sobre este argumento. Cambiar el valor dado al argumento "bty" en 
# el c�digo anterior para ver los resultados que son posible para diferentes 
# valores de "bty".


## TAREA 4 ##
# El siguiente c�digo difiere del c�digo de la Tarea 3 s�lo en el uso del 
# argumento "type":

plot(iris$Petal.Width, iris$Sepal.Width, xlab="Petal Width (cm)", 
    ylab="Sepal Width (cm)", cex.axis=1.5, cex.lab=1.5, bty="n", pch=19, type="n")

# Lea sobre el argumento "type" en la ayuda para la funci�n "plot" para 
# aprender lo que pas�. A continuaci�n, utilice el c�digo anterior como punto de 
# partida para representar gr�ficamente la relaci�n entre el ancho del s�palo y 
# el ancho del p�talo mostrando cada especie con un s�mbolo y color diferente. 
# Vea la lista de s�mbolos disponibles a trav�s del argumento "pch" en la p�gina 
# 44 de "R para principiantes". Vea tambi�n la descripci�n del argumento "pch" 
# en la p�gina de ayuda para la funci�n "par". Para ver una lista de colores 
# disponibles escriba "colours()". Para completar esta tarea es necesario que 
# utilice la funci�n de "points" y que ponga en practica sus conocimientos sobre
# indexaci�n de objetos.


## TAREA 5 ##
# A�ada una leyenda al gr�fico que ha creado en la Tarea 4 usando la funci�n
# "lengend". Obtenga informaci�n acerca de esta funci�n visitando la p�gina de 
# ayuda correspondiente.


## TAREA 6 ##
# Examine los datos de longitud del s�palo y ancho del p�talo utilizando 
# este c�digo:

summary(iris$Sepal.Length)
summary(iris$Petal.Width)

# Considere cuidadosamente el siguiente c�digo que produce histogramas de 
# longitud del s�palo y ancho del p�talo en el mismo gr�fico:

hist(iris$Sepal.Length, breaks=seq(0,8,0.5), col="gray70", border="gray40", 
    xlab="", ylab="", main="", xaxt="n", yaxt="n", ylim=c(0,40))
par(new=TRUE)
hist(iris$Petal.Width, breaks=seq(0,8,0.5), density=30, xlab="", ylab="", 
    main="", xaxt="n", yaxt="n", ylim=c(0,40))

# Lea en la p�gina de ayuda para la funcion "par" la informaci�n sobre el 
# argumento "new". Use de las funciones "axis", "mtext" y "legenda" para agregar 
# ejes, t�tulos de ejes y una leyenda. 


## TAREA 7 ##
# El gr�fico que ha creado en la tarea 5 puede tener un problema: el eje Y es 
# demasiado corto y deja parcialmente fuera una de las barras del histograma. 
# Modifique los valores en el argumento "ylim" para solucionar este problema. 
# Puede haber tambi�n un segundo problema: el t�tulo del eje vertical se puede 
# estar cortado. Utilice el argumento "mar" de la funci�n "par" para solucionar 
# este segundo problema. Lea sobre el argumento "mar" en la p�gina de ayuda de 
# la funci�n "par".




















################################################################################
### SOLUCIONES PARA TAREAS #####################################################
################################################################################






