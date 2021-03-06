# Solução Lista de Exercícios - Capítulo 7

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap08")
getwd()

# Formatando os dados de uma página web
install.packages("rvest")
library(rvest)
library(stringr)
library(tidyr)

# Exercício 1 - Faça a leitura da url abaixo e grave no objeto pagina
# http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I
pagina <- read_html("http://forecast.weather.gov/MapClick.php?lat=42.31674913306716&lon=-71.42487878862437&site=all&smap=1#.VRsEpZPF84I")

# Exercício 2 - Da página coletada no item anterior, extraia o texto que contenha as tags:
# "#detailed-forecast-body b  e .forecast-text"
dias <- html_elements(pagina, ".forecast-label b") # ou dias <- html_elements(pagina, "#detailed-forecast-body b")
previsao <- html_elements(pagina, ".forecast-text")

# Exercício 3 - Transforme o item anterior em texto
dias_txt <- html_text(dias, trim = TRUE)
previsao_txt <- html_text(previsao, trim = TRUE)
info <- list(dias_txt, previsao_txt)
# Exercício 4 - Extraímos a página web abaixo para você. Agora faça a coleta da tag "table"
url <- 'http://espn.go.com/nfl/superbowl/history/winners'
pagina <- read_html(url)
tabela <- html_elements(pagina, "tr")
tabela_txt = 
  tabela %>%
  html_text2() 
# Exercício 5 - Converta o item anterior em um dataframe
df<-  data.frame(tabela_txt)


####################CORRECAO####################
pagina <- read_html(url)
tabela <- html_nodes(pagina, 'table')
class(tabela)

tabela <- html_nodes(pagina, "table")
tabela_txt = 
  tabela %>%
  html_text2() 
# Exercício 5 - Converta o item anterior em um dataframe
df<-  data.frame(tabela)

# Exercício 6 - Remova as duas primeiras linhas e adicione nomes as colunas
df2 <- df[-(1:2), ]
df2 <- data.frame(df2)
colnames(df2) <-  "Results"

# Exercício 7 - Converta de algarismos romanos para números inteiros
head(df2)
separate(df2, "Results", into = c("Index", "Result"), sep="\\s", extra = "merge")
df2 %>% separate("Results", into = c("Index", "Result"), sep="\\s", extra = "merge") -> df3

df3 <- transform(df3, Index = as.numeric(as.roman(df3$Index)))

# Exercício 8 - Divida as colunas em 4 colunas


# Exercício 9 - Inclua mais 2 colunas com o score dos vencedores e perdedores
# Dica: Você deve fazer mais uma divisão nas colunas


# Exercício 10 - Grave o resultado em um arquivo csv



