# Lista de Exercícios - Capítulo 4

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("G:\\10-Caio\\70-Educação\\DSA\\FCD\\BigDataRAzure\\Cap04-LinguagemR-FatoresEstruturasControleFuncoes\\Arquivos-Cap04")
getwd()

# Exercicio 1 - Crie uma função que receba os dois vetores abaixo como parâmetro, 
# converta-os em um dataframe e imprima no console
vec1 <- (10:13)
vec2 <- c("a", "b", "c", "d")

funcaoEx1 <- function(v1, v2) {
  df <- data.frame(v1, v2)
  print(df)
}
funcaoEx1(vec1, vec2)

# Exercicio 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com 
# números inteiros e calcule a média de cada linha
matrizEx2 <- matrix(c(1:16), nrow = 4, ncol = 4)
apply(matrizEx2, 1, mean)

# Exercicio 3 - Considere o dataframe abaixo. 
# Calcule a média por disciplina e depois calcule a média de apenas uma disciplina
escola <- data.frame(Aluno = c('Alan', 'Alice', 'Alana', 'Aline', 'Alex', 'Ajay'),
                     Matematica = c(90, 80, 85, 87, 56, 79),
                     Geografia = c(100, 78, 86, 90, 98, 67),
                     Quimica = c(76, 56, 89, 90, 100, 87))


apply(escola[,2:ncol(escola)], 2, mean)
mean(escola$Matematica)
# Exercicio 4 - Cria uma lista com 3 elementos, todos numéricos 
# e calcule a soma de todos os elementos da lista
listaExec4 = list(c(1:10), c(20:30), 100)
do.call(sum, listaExec4)

lapply(listaExec4, sum)
# Exercicio 5 - Transforme a lista anterior um vetor
unlist(listaExec4)
# Exercicio 6 - Considere a string abaixo. Substitua a palavra "textos" por "frases"
str <- c("Expressoes", "regulares", "em linguagem R", 
         "permitem a busca de padroes", "e exploracao de textos",
         "podemos buscar padroes em digitos",
         "como por exemplo",
         "10992451280")
respostaExec6 <- gsub("textos", "frases",x = str)

# Exercicio 7 - Usando o dataset mtcars, crie um gráfico com ggplot do tipo 
# scatter plot. Use as colunas disp e mpg nos eixos x e y respectivamente
mtcars
plot(x = mtcars$disp, y = mtcars$mpg)
ggplot(data = mtcars, aes(x = disp, y = mpg)) + geom_point()
# Exercicio 8 - Considere a matriz abaixo.
# Crie um bar plot que represente os dados em barras individuais.
mat1 <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
colnames(mat1) <- c("Um", "Dois", "Três", "Quatro")
rownames(mat1) <- c("1", "2", "3")
barplot(
  mat1,
  beside = TRUE,
  legend.text = TRUE
  )
?barplot
# Exercício 9 - Qual o erro do código abaixo?
library(ggplot2)
data(diamonds)
ggplot(data = diamonds, aes(x = price, group = fill, fill = cut)) + 
  geom_density(adjust = 1.5)

ggplot(data = diamonds, aes(x = price,  group = cut, fill = cut)) + 
  geom_density(adjust = 1.5)
?aes()

# Exercício 10 - Qual o erro do código abaixo?
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
  geom_bar() +
  labs(fill = "cyl")



