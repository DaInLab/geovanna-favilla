library(readxl)

planilha <- read_excel("./dados/exercicio1.xls")

#Calculos
media        <- mean(planilha$'Taxas de juros')
mediana      <- median(planilha$'Taxas de juros')
variancia    <- var(planilha$'Taxas de juros')
desvioPadrao <- sd(planilha$'Taxas de juros')
minimo       <- min(planilha$'Taxas de juros')
maximo       <- max(planilha$'Taxas de juros')
Q1           <- quantile(planilha$'Taxas de juros', probs = 0.25)
Q3           <- quantile(planilha$'Taxas de juros', probs = 0.75)


print(paste("Média (segundo Quartil): ", media))
print(paste("Mediana: ", mediana))
print(paste("Variância: ", variancia))
print(paste("Desvio Padrão: ", desvioPadrao))
print(paste("Valor Mínimo: ", minimo))
print(paste("Valor Máximo: ", maximo))
print(paste("Primeiro Quartil: ", Q1))
print(paste("Terceiro Quartil: ", Q3))

#Conjunto de dados
nQuartis <- c("Q1","Média (Q2)", "Q3", "Mediana")
Quartis <- c(Q1, media, Q3, mediana)

nSd <- c("Variância", "Desvio Padrão")
Sd <- c(variancia, desvioPadrao)

nMinMax <- c("Mínimo", "Máximo")
MinMax <- c(minimo, maximo)

#Criação dos gráficos
library(RColorBrewer)
png(filename = "./graficos/ex1-fig1.png", width = 1000, height = 800)
barplot(Quartis, main="Exercício 01 - Quartis e Mediana", xlab="Taxas", ylab="Resultado", names.arg = nQuartis, beside=TRUE, ylim=range(pretty(c(0, Quartis))), cex.names = 0.8, xaxs = "i", col = rainbow(20), space=0.5)
dev.off()

png(filename = "./graficos/ex1-fig2.png", width = 1000, height = 800)
barplot(Sd, main="Exercício 01 - Variância e Desvio Padrão", xlab="Taxas", ylab="Resultado", names.arg = nSd, beside=TRUE, ylim=range(pretty(c(0, Sd))), cex.names = 0.8, xaxs = "i", col = rainbow(20), space=0.5)
dev.off()

png(filename = "./graficos/ex1-fig3.png", width = 1000, height = 800)
barplot(MinMax, main="Exercício 01 - Máximo e Mínimo", xlab="Taxas", ylab="Resultado", names.arg = nMinMax, beside=TRUE, ylim=range(pretty(c(0, MinMax))), cex.names = 0.8, xaxs = "i", col = rainbow(20), space=0.5)
dev.off()