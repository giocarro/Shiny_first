#Giovanni Alberto Estrada Hernández

# EJERCICIOS Capitulo 5
# 1. ¿Qué cantidad de dinero sobra al repartir 10000$ entre 3 personas?

# %/% es cociente entero en una division
x <- 10000 %/% 3

# 2. ¿Es el número 4560 divisible por 3?
y <- 4560
if(y%%3 == 0){
  print(paste0(y," es divisible entre 3"))
  print(paste0(y,"/3 = ",y/3))
}

# 3. Construya un vector con los números enteros del 2 al 87. 
# ¿Cuáles de esos números son divisibles por 7?

z <- c(2:87)[c(2:87)%%7==0]
z

# 4. Construya dos vectores, el primero con los números enteros desde 7 hasta 3, 
# el segundo vector con los primeros cinco números positivos divisibles por 5. 
# Sea A la condición de ser par en el primer vector. 
# Sea B la condición de ser mayor que 10 en el segundo vector. 
# ¿En cuál de las 5 posiciones se cumple A y B simultáneamente?

a <- c(7:3)
b <- c(5:100)
b <- b[b%%5==0]
b <- b[1:5]
b

par_vec = a[a%%2==0]
greater_than_ten = b[b>10]

#  Mario best answer
v1 <- 7:3
v2 <- seq(from=5, by=5, length.out = 5)

v1%%2 == 0 & v2>10

# 5. Consulte este enlace en el cual hay una anéctoda de Gauss niño. 
# Use R para obtener el resultado de la suma solicitada por el profesor del niño
# Gauss.

sum(1:100)

# 6. Construya un vector con los siguientes elementos: 1, -4, 5, 9, -4. 
# Escriba un procedimiento para extraer las posiciones donde está el valor 
# mínimo en el vector.

x <- (c(1,-4,5,9,-4))
which(x == min(x))

# Abraham which.min(x)

# 7. Calcular 8!
prod(c(1:8))

# Abraham
prod(seq_len(8))

# 8.Evaluar la siguiente suma  ∑i=e**i donde i inicia en 3 y termina en 7
x <- 0
for(i in 3:7){
  x <- x + exp(i)
}
x

# Abraham
sum(exp(3:7))

# 9. Evaluar la siguiente productoria
# multi del 1 al 10 log raiz de i

#prod(seq_len(log(sqrt(10))))
prod(log(sqrt(1:10)))

# 10. Construya un vector cualquiera e inviertalo, es decir, que el primer 
# elemento quede de último, el segundo de penúltimo y así sucesivamente. 
# Compare su resultado con el de la función rev.

v1 <- c(2:7)
v2 <- v1[length(v1):1]
str(v2)

# 11. Create the vector: 1,2,3,...,20
vec <- c(1:20)

# 12. Create the vector: 20,19,18,...,1
vec <- c(20:1)
str(vec)

# 13. Create the vector: 1,-2,3,-4,5,-6,...,19,-20
x <- c(1:20)
x <- ifelse(x%%2==0,x*(-1),x)

#14. Create the vector: .1^3, .2^1, .1^6, .2^4, ... , 0.1^36, 0.2^34
s1 = c(seq(from = 3, to = 36, by = 3))
s2 = c(seq(from = 1, to = 34, by = 3))

l1 = length(s1)
l2 = length(s2)

v1 = c(seq(0.1,0.1, length.out = l1))
v2 = c(seq(0.2,0.2, length.out = l2))

v1_1 <- v1**s1
v2_1 <- v2**s2

#Combinar vectores
v_f <- c(as.numeric(rbind(v1_1, v2_1)))
length(v_f)
str(v_f)

# 15. Calculate the following:
# Suma de 10 a 100 de (i^3 + 4i^2)

sum((10:100)**3,4*(10:100)**2)

# 16. Read the data set available in: https://raw.githubusercontent.com/fhernanb/datos/master/Paises.txt

url <- 'https://raw.githubusercontent.com/fhernanb/datos/master/Paises.txt'
dt1 <- read.table(url,header = TRUE)

# 17. Use a code to obtain the number of variables of the data set.
length(dt1[1,])

# 18. Use a code to obtain the number of countries in the data set.
length(dt1$Pais)
length(dt1[,1])
length(dt1[['Pais']])

# 19. Which is the country with the higher population?
myframe <- data.frame(dt1)
subset(myframe, subset = poblacion == max(poblacion))
subset(myframe, subset = poblacion == max(poblacion), select = c('Pais','poblacion'))

# 20. Which is the country with the lowest literacy rate?
subset(myframe, subset = alfabetizacion == min(alfabetizacion))

# 21. ¿Qué valor de verdad tiene la siguiente afirmación? 
# “Los resultados de la función floor y trunc son siempre los mismos”.
# Falso
floor(-1.1) == trunc(-1.1)

# En R hay unas bases de datos incluídas, una de ellas es la base de datos 
# llamada mtcars. Para conocer las variables que están en mtcars usted 
# puede escribir en la consola ?mtcars o también help(mtcars). 
# De la base mtcars obtenga bases de datos que cumplan las siguientes 
# condiciones.

require(graphics)
pairs(mtcars, main = "mtcars data", gap = 1/4)
coplot(mpg ~ disp | as.factor(cyl), data = mtcars,
       panel = panel.smooth, rows = 1)
## possibly more meaningful, e.g., for summary() or bivariate plots:
mtcars2 <- within(mtcars, {
  vs <- factor(vs, labels = c("V", "S"))
  am <- factor(am, labels = c("automatic", "manual"))
  cyl  <- ordered(cyl)
  gear <- ordered(gear)
  carb <- ordered(carb)
})
summary(mtcars2)

# 22. Autos que tengan un rendimiento menor a 18 millas por galón de combustible.
str(mtcars)
#Edgar
mtcars[mtcars$mpg < 18,]

# 23. Autos que tengan 4 cilindros.
mtcars[mtcars$cyl == 4,]

# 24. Autos que pesen más de 2500 libras y tengan transmisión manual.
mtcars[mtcars$wt > 2.500 & mtcars$am == 1 ,]



#  T E S T   O F   M I C R O B E N C H M A R K
library(microbenchmark)
set.seed(1)
x <- runif(1e6)
microbenchmark(mean(x), sum(x) / length(x))
identical(mean(x), sum(x) / length(x))