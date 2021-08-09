# Solução Lista de Exercícios - Capítulo 6

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap06")
getwd()


# Exercicio 1 - Instale a carregue os pacotes necessários para trabalhar com SQLite e R
install.packages("RSQLite")
library("RSQLite")

# Exercicio 2 - Crie a conexão para o arquivo mamiferos.sqlite em anexo a este script
driver = dbDriver("SQLite")
connection = dbConnect(driver, dbname = "mamiferos.sqlite")
dbListTables(connection)
# Exercicio 3 - Qual a versão do SQLite usada no banco de dados?
# Dica: Consulte o help da função src_dbi()
install.packages("dplyr")
install.packages("dbplyr")
library("dplyr")
library("dbplyr")

tbl(connection, "dados3")
 # resposta: Database: sqlite 3.35.5

# Exercicio 4 - Execute a query abaixo no banco de dados e grave em um objero em R:
# SELECT year, species_id, plot_id FROM surveys
query = "SELECT year, species_id, plot_id FROM surveys"
dbGetQuery(connection, query)

# Exercicio 5 - Qual o tipo de objeto criado no item anterior?
str(dbGetQuery(connection, query))
 #resposta: Dataframe

# Exercicio 6 - Já carregamos a tabela abaixo para você. Selecione as colunas species_id, sex e weight com a seguinte condição:
# Condição: weight < 5
pesquisas <- tbl(connection, "surveys")
query2 = "SELECT species_id, sex, weight FROM surveys WHERE weight < 5"
dbGetQuery(connection, query2)
# Exercicio 7 - Grave o resultado do item anterior em um objeto R. O objeto final deve ser um dataframe
resultado <- dbGetQuery(connection, query2)
str(resultado)

# Exercicio 8 - Liste as tabelas do banco de dados carregado
dbListTables(connection)
# [1] "dados3"  "plots"   "species" "surveys"

# Exercicio 9 - A partir do dataframe criado no item 7, crie uma tabela no banco de dados
dbRemoveTable(connection, "resultado")
resultado[3,2] = "F"
dbCreateTable(conn =  connection, name = "resultado", resultado)

# Exercicio 10 - Imprima os dados da tabela criada no item anterior
dbReadTable(connection, "resultado")


