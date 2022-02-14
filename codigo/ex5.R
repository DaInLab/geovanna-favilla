library(readxl)

planilha <- read_excel("./dados/exercicio5.xls")

nPessoas <- planilha$'Nº pessoas'
marcas <- planilha$'Marcas'
#Criação do histograma
png(filename = "./graficos/ex5-fig1.png", width = 800, height = 600)
barplot(nPessoas, main="Exercício 5 - Preferência do Público", xlab="Pessoas", ylab="Marcas", names.arg = marcas,  xlim=range(pretty(c(0, nPessoas))), cex.names = 0.8, xaxs = "i", col = rainbow(8), space=0.5, horiz=TRUE )
dev.off()