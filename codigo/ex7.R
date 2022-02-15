library(readxl)

planilha <- read_excel("./dados/exercicio7.xls")

nAreas <- planilha$'Áreas'
atendimento <- planilha$'Atendimento'
#Criação do gráfico de barras
png(filename = "./graficos/ex7-fig1.png", width = 800, height = 600)
barplot(atendimento, main="Exercício 7 - Áreas de atendimento", xlab="Pessoas atendidas", ylab="Áreas", names.arg = nAreas,  xlim=range(pretty(c(0, atendimento))), cex.names = 0.8, xaxs = "i", col = rainbow(8), space=0.5, horiz=TRUE )
dev.off()