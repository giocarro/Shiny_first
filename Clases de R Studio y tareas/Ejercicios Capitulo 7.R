# Ejercicios capítulo 7

# 1. Construya una función que reciba dos números reales a y b, 
# la función debe decir cuál es el mayor de ellos.

#Alguien mas

a=6
b=2
mayor_que <- function(a,b){
  if (a > b){
    return (a)
  }
  else {
    return (b)
  }
}
mayor_que(a, b)

#Gio

greater <- function(a,b){
  return (max(a,b))
}

greater(a,b)

# 2. Escriba una función llamada media que calcule la media muestral de un vector
# numérico x ingresado a la función. A continuación la fórmula para calcular 
# la media muestral.

x <- c(1,2,3,4,5,6)

mmtral <- function(v){
  return ( (sum(v)) / length(v) )
}

mmtral(x)

# 3. Construya una función que encuentre las raíces de una ecuación de segundo grado. 
# El usuario debe suministrar los coeficientes a, b y c de la ecuación ax^2+bx+c=0 y 
# la función debe entregar las raíces.

#x = (-b+-sqrt(b^2 - 4ac))/2a

#Coeficientes de la ecuacion:
a <- 2
b <- 2
c <- 2

chicharronera <- function(a,b,c){
  
  discriminante <- b**2 - 4*a*c
  
  if( a!=0 & discriminante >=0 ){
    x1 = (-b + sqrt(discriminante))/(2*a)
    x2 = (-b - sqrt(discriminante))/(2*a)  
    return (c(x1,x2))
  }
  else{
    return(print('Error, a=0 o  discriminante < 0'))
  }
}

chicharronera(a,b,c)

# 4. Escribir una función que calcule la velocidad de un proyectil dado que el 
# usuario ingresa la distancia recorrida en Km y el tiempo necesario en minutos. 
# Expresar el resultado se debe entregar en metros/segundo, recuerde que

# Velocidad = espacio / tiempo

# distancia en km
d <- 5

# tiempo en segundos
t <- 3
velo <- function(distancia_km,tiempo){
  
  if (tiempo >= 0){
    distancia_m <- distancia_km*1000
    return ( print(paste0('velocidad = ', v <- distancia_m / tiempo, ' m/s.' ) ) ) 
  }
  else{
    return(print('Error, tiempo < 0 '))
  }
  
}

velo(d,t)

# 5. Escribir una función que reciba dos valores a y b y que los intercambie.
# Es decir si ingresa a=4 y b=9 que la funcion entregue a=9 y b=4

a <- 3
b <- 4

print(paste0('Aquí a = ',a,' y b = ',b,'.'))

intercambio <- function(a,b){
  c <- a
  a <- b
  b <- c
  return(print(paste0('Ahora a = ',a,' y b = ', b,'.')))
}
  
intercambio(a,b)

# 6. Construya una función a la cual le ingrese el salario por hora y el número
# de horas trabajadas durante una semana por un trabajador. La función debe 
# calcular el salario neto.

#salario por hora
s_h <- 100

#horas trabajadas en el mes
h_t <- 160

#salario neto: cantidad recibida al mes
sal_neto <- function(sal_hora,h_trab){
  
  #return(print(paste0('salario neto = $', sal_hora*h_trab,'.00')))
  return(sal_hora*h_trab)
}

print(sal_neto(s_h,h_t))

# 7. Construya una función llamada precio que calcule el precio total de sacar 
# A fotocopias y B impresiones, sabiendo que los precios son 50 y 100 pesos 
# para A y B respectivamente si el cliente es un estudiante, y de 75 y 150 para 
# A y B si el cliente es un profesor. La función debe tener dos argumentos 
# cuantitativos (A y B) y el argumento lógico estudiante que por defecto 
# tenga el valor de TRUE. Use la estructura mostrada abajo.

precio <- function(A, B, estudiante=FALSE) {
  
  if (estudiante == TRUE)
    precio.total <- A*50 + B*100
  else
    precio.total <- A*75 + B*150
  
  return(precio.total)
}

precio(100,50)
100*75 + 50*150

# 8. Construya una función llamada salario que le ingrese el salario por hora 
# y el número de horas trabajadas durante una semana por un trabajador. 
# La función debe calcular el salario neto semanal, teniendo en cuenta que si 
# el número de horas trabajadas durante la semana es mayor de 48, esas horas 
# de demás se consideran horas extras y tienen un 35% de recargo. 
# Imprima el salario neto. Use la estructura mostrada abajo.

salario <- function(num.horas,valor.hora){
  
  if (num.horas > 48){
    h_extra <- num.horas-48
    #salario.neto <- 48*valor.hora + h_extra*valor.hora*1.35
    salario.neto <- valor.hora*(48 + h_extra*1.35)
  }
  else{
    salario.neto <- num.horas*valor.hora
  }
  
  return(salario.neto)
}

salario(50,100)

# 9. Construya una función llamada nota que calcule la nota obtenida por un 
# alumno en una evaluación de tres puntos cuya ponderación o importancia son 
# 20%, 30% y 50% para los puntos I, II y III respectivamente. 
# Adicionalmente la función debe generar un mensaje sobre si el estudiante 
# aprobó la evaluación o no. El usuario debe ingresar las notas individuales 
# de los tres puntos y la función debe entregar la nota final de la evaluación. 
# Use la estructura mostrada abajo.

nota <- function(p1, p2, p3){
  
}

# 10. Escriba una función llamada minimo que permita obtener el valor mínimo 
# de un vector numérico. No puede usar ninguna de las funciones básicas de R 
# como which.min(), which.max(), order(), min( ), max( ), sort( ) u order( ). 
# Use la estructura mostrada abajo.

# Bubble sort
# minimo <- function(x){
# 
#   for (i in c( 1 : (length(x)-1) ) ){
# 
#     for (j in c( 1 : (length(x)-i) ) ) {
#       if(x[j] > x[j+1]){
#         x[c(j,j+1)] <- x[c(j+1,j)]
#       }
# 
#     }
#   }
# 
#   minimo <- x[c(1)]
#   return(minimo)
# }

# seleccion

minimo <- function(x){

  for (i in c( 1 : (length(x)-1) ) ){
    if (x[i]>x[i+1]){
      minimo <- x[i+1]
    }
    else{
      minimo <- x[i]
    }
  }

  return(minimo)

}

x <- c(9,8,4,7,2,9)

minimo(x)
print(paste0('minimo = ',minimo(x)))

library(microbenchmark)
microbenchmark(minimo(x))
# Test
# v <- c(5,2,7,5,8)
# 
# for(i in v[c(1:length(v)-1)] ){
#   print(i) 
# }
# v[1]>v[2]

# 11. Construya una función que calcule las coordenadas del punto medio M
# entre dos puntos A y B. Vea la siguiente figura para una ilustración.
# ¿Cuáles cree usted que deben ser los parámetros de entrada de la función?

#P1(x1,y1)
p1 <- c(5,4)

#P2(x2,y2)
p2 <- c(0,10)

punto_M <- function(p1,p2){
  
  px_m <- (p1[1]+p2[1])/2
  py_m <- (p1[2]+p2[2])/2
  punto_M <- c(px_m,py_m)
  
  return (punto_M)
}

punto_M(p1,p2)