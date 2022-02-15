library(qcc) #gráficos de controle de qualidade
library(readxl)

ex6 <- read_excel("./dados/exercicio6.xls")

pessoas <- ex6$'Nº pessoas'
names(pessoas) <- ex6$'Qualidade'
#Criação do gráfico pareto
png(filename = "./graficos/ex6-fig1.png", width = 800, height = 600)
graficoPareto <- pareto.chart(pessoas, main="Exercício 6 - Qualificação de Atendimento", ylab2="Frequência Cumulativa", ylab="Frequência", cumperc = seq(0, 100, by = 25), col = rainbow(8))
dev.off()