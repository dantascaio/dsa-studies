# Solução Lista de Exercícios - Capítulo 5

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("G:\\10-Caio\\70-Educação\\DSA\\FCD\\BigDataRAzure\\Cap05-ManipulaçãodeArquivosTXTCSVPlanilhasExcelemR\\2-Arquivos-Cap05")
getwd()


# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = colnames(mtcars), qmethod = "double")


# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
install.packages("readr")
library(readr)
df_iris <- read_csv("iris.csv", col_types = matrix(
  Sepal.Length = col_double(1),
  Sepal.Width = col_double(1),
  Petal.Length = col_double(1),
  Petal.Width = col_double(1),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

df_iris <- read_csv("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))



# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")

par(mfrow=c(1,1))
a <- hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
b <- hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="", add = TRUE)


?hist()
# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("plotly")
library(plotly)
head(iris)

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = Species , marker=list(size=20 , opacity=0.5))

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = ~Species , marker=list(size=20 , opacity=0.5))
?plot_ly
sessionInfo()

# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico que resulta nesta imagem.
p <- plot_ly(z = volcano, type = "surface")
p 
summary(volcano)
View(volcano)
# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson
install.packages("rjson")
library(rjson)
input <- fromJSON(file = "input.json")
print(input)
# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.
df_json <- data.frame(input)
df_json
# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML
install.packages("XML", repos = "http://www.omegahat.net/R")
library(XML)
arquivo_xml <- xmlParse("input.xml")
?xmlParse()
str(arquivo_xml)
# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe
df_xml <- xmlToDataFrame(arquivo_xml)

# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às seguintes perguntas:
csv <- read.csv("input.csv")
str(csv)
# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?
dim(csv)
## 8 linhas e 5 colunas
# Pergunta 2 - Qual o maior salário?
sort(csv$salary, decreasing = TRUE)
order(csv, csv$salary)
salarios <- csv[order(csv$salary, decreasing = TRUE),]
salarios[1,3]
# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.
salarios[1,]
# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.
subset(csv, dept == "IT")
# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600. 
subset(csv, dept == "IT" & salary > 600)
