# Lista de Exercícios - Capítulo 3

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("G:\\10-Caio\\70-Educação\\DSA\\FCD\\BigDataRAzure\\Cap03-LinguagemR-FatoresEstruturasControleFuncoes\\2-Arquivos-Cap03")
getwd()
# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
list.files()

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
v1 <- c("a", "b", "c", "d")
v2 <- c(TRUE, FALSE, FALSE, TRUE)
v3 <- c (1:4)
df <- data.frame(v1, v2, v3)
df
# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.

# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1
for(i in vec1) {
  if(i > 10) {
    print("Encontrei um maior: ")
    print(i)
  }
}

# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2

for(i in lst2 ) {
  print(i)
}
# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as materizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise
  mat1 * mat2
# Multiplicação de matrizes
  mat1 %*% mat2
# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos
v1 <- 1:4
names(v1) <- c("col1","col2","col3","col4")
v1
m1 <- matrix(c(1:6), nrow = 2, ncol = 3)
dimnames(m1) = list(c("row1","row2"),c("col1","col2", "col3"))
m1
l1 <- list(1:3, c("a", "b"))
l1
names(l1) = c("num", "letras")
l1
s# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2
for (i in sample(1:90, 50)){
  mat2[i] = NA  
}
mat2
# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
?apply
somaCol <- apply(mat1, 2, sum) 
somaRow <- apply(mat1, 1, sum) 
# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a
b <- sort(a)
# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
i = 1
j = 1
while(i <= nrow(mat1)){
  while(j <= ncol(mat1)) {
    if(mat1[i,j] > 15){
      print(mat1[i,j])     
    }
    j = j + 1
  }
  j = 1
  i = i +1
}
## outra solução! ##
for(i in mat1){
  if(i > 15){
    print(i)
    }
}
