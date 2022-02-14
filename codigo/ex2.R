library(readxl)
library(ggplot2)
library(gridExtra)

planilha <- read_excel("./dados/exercicio2.xls")

tabelaFreq <- as.data.frame(table(planilha))
print(paste("Frequências: ", tabelaFreq))

#Calcular a moda
Moda <- function(value) {
  uniqv <- unique(value)
  uniqv[which.max(tabulate(match(value, uniqv)))]
}

#Calculos
media        <- mean(planilha$'Casas')
mediana      <- median(planilha$'Casas')
moda         <- Moda(planilha$'Casas')
variancia    <- var(planilha$'Casas')
desvio       <- sd(planilha$'Casas')

#Conjunto de dados
nQuartis <- c("Média", "Mediana", "Moda")
Quartis <- c(media, mediana, moda)

nSd <- c("Variância", "Desvio Padrão")
Sd <- c(variancia, desvio)

#Criação dos gráficos
library(RColorBrewer)
png(filename = "./graficos/ex2-fig1.png", width = 1000, height = 800)
barplot(Quartis, main="Exercício 02 - Medidas de tendência Central", xlab="Taxas", ylab="Resultado", names.arg = nQuartis, beside=TRUE, ylim=range(pretty(c(0, Quartis))), cex.names = 0.9, xaxs = "i", col = rainbow(10), space=0.5)
dev.off()

png(filename = "./graficos/ex2-fig2.png", width = 1000, height = 800)
barplot(Sd, main="Exercício 01 - Medidas de Dispersão", xlab="Taxas", ylab="Resultado", names.arg = nSd, beside=TRUE, ylim=range(pretty(c(0, Sd))), cex.names = 0.9, xaxs = "i", col = rainbow(10), space=0.5)
dev.off()

#Criação tabela
png(filename = "./graficos/ex2-fig3.png", height=1000, width=200)
p<-tableGrob(tabelaFreq)
grid.arrange(p)
dev.off()