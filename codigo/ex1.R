library(readxl)

planilha <- read_excel("./dados/exercicio1.xls")

media        <- mean(planilha$'Taxas de juros')
mediana      <- median(planilha$'Taxas de juros')
variancia    <- var(planilha$'Taxas de juros')
desvioPadrao <- sd(planilha$'Taxas de juros')
valorMinimo  <- min(planilha$'Taxas de juros')
valorMaximo  <- max(planilha$'Taxas de juros')
Q1           <- quantile(planilha$'Taxas de juros', probs = 0.25)
Q3           <- quantile(planilha$'Taxas de juros', probs = 0.75)

print(paste("Media: ", media))
print(paste("Mediana: ", mediana))
print(paste("Variancia: ", variancia))
print(paste("Desvio Padrao: ", desvioPadrao))
print(paste("Valor Minimo: ", valorMinimo))
print(paste("Valor Maximo: ", valorMaximo))
print(paste("Q1: ", Q1))
print(paste("Q3: ", Q3))

nomesDosCalculos <- c("Media", "Mediana", "Variancia", "D.Padrao", "V.Minimo", "V.Maximo", "Q1", "Q3")
calculos <- c(media, mediana, variancia, desvioPadrao, valorMinimo, valorMaximo, Q1, Q3)

png(filename = "./graficos/ex1.png", width = 1000, height = 800)
barplot(calculos, main="Exercício 1", xlab="Cálculos", ylab="Taxas de juros", names.arg = nomesDosCalculos, ylim=c(0, 3), cex.names = 0.8, xaxs = "i")
dev.off()