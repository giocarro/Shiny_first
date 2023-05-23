
root_path <- "C:\\Users\\Gio Carro\\Documents\\R_exercises"
root_path <- "~/Data_Science"

iris_file_path <- paste(root_path,'/iris.csv', sep = '')

# path where to write the csv
write.csv(iris, iris_file_path, row.names = FALSE)

# dataframe
iris

# Numero de filas del data frame
nrow(iris) 
nrow(ggplot2::diamonds)

# Leer data frames en R
iris_file <- read.csv( iris_file_path )

# Leer Bb data.table
library(data.table)

# path where to write the csv for data frame diamonds
diamonds_file_path <- paste(root_path,'\\diamonds.csv', sep = '')
write.csv(ggplot2::diamonds, diamonds_file_path, row.names = FALSE)

# Leer data frames diamonds en R
diamonds_file <- read.csv( diamonds_file_path )

# Leer data frames en R con data.table
fread( iris_file_path )

# Leer data frames en R cono data table library
fread( diamonds_file_path )

# Rendimiento del código
library (microbenchmark)

# Pocos datos en el dataframe de Iris
microbenchmark(base = read.csv( iris_file_path ) ,
               data_table = fread( iris_file_path ), 
               times = 20)

# Muchos datos en el dataframe de diamonds
microbenchmark(base = read.csv( diamonds_file_path ),
               data_table = fread( diamonds_file_path ),
               times = 20)

# aqui se uso iris_file <- read.csv( iris_file_path )
grep('setosa' , iris_file$Species ) #mas eficiente
# grep('setosa' , read.csv( iris_file_path )$ Species )  tambien funciona

# Se seleccionan los renglones que tengan la palabra 'setosa'
iris_file[ grep('setosa' , iris_file$Species ) , ]
iris_file[100:112,]

head(iris_file)
# Se seleccionan n renglones y m columnas
fread( iris_file_path , nrows = 3 , select = c(1,2))

# Se seleccionan n renglones y columnas por nombre
fread( iris_file_path , nrows = 5 , select = c('Sepal.Length','Sepal.Width'))

# Empieza a leer desde donde skip diga (linea n o que contenga cierta cadena de caracteres)
fread( iris_file_path , skip = 100)
fread( iris_file_path , skip = 'virginica')


# T A R E A

# - Número de renglones Sepal.Length mayor a 5.1
library(dplyr)

dplyr::filter(iris_file, Sepal.Length > 5.1) %>%
  nrow()

dplyr::filter(iris_file, Sepal.Length > 5.1) %>% 
  group_by(Petal.Length, Petal.Width)

# Número de renglones Petal.Length menor o igual a 1.5
dplyr::filter(iris_file, Petal.Length <= 1.5) %>%
  nrow()

# - Promedio de Sepal.Width por Species

SW.setosa <- dplyr::filter(iris_file, Species == 'setosa') %>% 
  summarise(media_set=mean(Sepal.Width))

SW.versicolor <- dplyr::filter(iris_file, Species == 'versicolor') %>% 
  summarise(media_vers=mean(Sepal.Width))

SW.virg <- dplyr::filter(iris_file, Species == 'virginica') %>% 
  summarise(media_virg=mean(Sepal.Width))

# - Mediana de Sepal.Width por Species

SW1.setosa <- dplyr::filter(iris_file, Species == 'setosa') %>% 
  summarise(median_set= median(Sepal.Width))

SW1.versicolor <- dplyr::filter(iris_file, Species == 'versicolor') %>% 
  summarise(median_vers=median(Sepal.Width))

SW1.virg <- dplyr::filter(iris_file, Species == 'virginica') %>% 
  summarise(median_virg=median(Sepal.Width))


# - Máximo de Petal.Length por Species

# Setosa
# Forma 1 (Mejor)
set_df <- dplyr::filter(iris_file, Species == 'setosa') 
#max(set_df$Petal.Length)
dplyr::filter(set_df, Petal.Length == max(Petal.Length))

set_df <- dplyr::filter(iris_file, Species == 'setosa') %>% 
  dplyr::filter(Petal.Length == max(Petal.Length))


# Forma 2 (Peor)
max( (dplyr::filter(iris_file, Species == 'setosa')) $Petal.Length )
max_set_PL <- dplyr::filter(iris_file, Species == 'setosa') %>% 
  #subset(, subset = Petal.Length == max(Petal.Length))
  dplyr::filter(Petal.Length == max(Petal.Length))
max_set_PL

# versicolor
# max of versicolor Petal.Length
max( (dplyr::filter(iris_file, Species == 'versicolor')) $Petal.Length )
max_vers_PL <- dplyr::filter(iris_file, Species == 'versicolor') %>% 
  #subset(, subset = Petal.Length == max(Petal.Length))
  dplyr::filter(Petal.Length == max(Petal.Length))
max_vers_PL

# virginica
# max of virginica Petal.Length
max( (dplyr::filter(iris_file, Species == 'virginica')) $Petal.Length )
max_virg_PL <- dplyr::filter(iris_file, Species == 'virginica') %>% 
  #subset(, subset = Petal.Length == max(Petal.Length))
  dplyr::filter(Petal.Length == max(Petal.Length))
max_virg_PL

# - Mínimo de Petal.Length por Species

# setosa
# min of setosa Petal.Length
min( (dplyr::filter(iris_file, Species == 'setosa')) $Petal.Length )
min_set_PL <- dplyr::filter(iris_file, Species == 'setosa') %>% 
  #subset(, subset = Petal.Length == min(Petal.Length))
  dplyr::filter(Petal.Length == min(Petal.Length))
min_set_PL

# versicolor
# min of versicolor Petal.Length
min( (dplyr::filter(iris_file, Species == 'versicolor')) $Petal.Length )
min_vers_PL <- dplyr::filter(iris_file, Species == 'versicolor') %>% 
  #subset(, subset = Petal.Length == min(Petal.Length))
  dplyr::filter(Petal.Length == min(Petal.Length))
min_vers_PL

# virginica
# min of virginica Petal.Length
min( (dplyr::filter(iris_file, Species == 'virginica')) $Petal.Length )
min_virg_PL <- dplyr::filter(iris_file, Species == 'virginica') %>% 
  #subset(, subset = Petal.Length == min(Petal.Length))
  dplyr::filter(Petal.Length == min(Petal.Length))
min_virg_PL


