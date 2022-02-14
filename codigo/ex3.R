library("writexl")


numFilhos <- c(0, 1, 2, 3, 5,">5")
nf <- c(0, 1, 2, 3, 5,6)
familias <- c(17, 20, 28, 19, 7, 4, 5)

tabela <- data.frame("Filhos" = numFilhos, "Famílias" = familias)
tabela
View(tabela)

write_xlsx(tabela,"./dados/exercicio3.xlsx")


mediana <- median(nf)
moda    <- c(2)

print(paste("Moda: ", moda))
print(paste("Mediana: ", mediana))

nQuartis <- c("Mediana", "Moda")
Quartis <- c(mediana, moda)

#Criação dos gráficos
png(filename = "./graficos/ex3-fig1.png", width = 1000, height = 800)
barplot(Quartis, main="Exercício 03 - Medidas de tendência Central", xlab="Taxas", ylab="Resultado", names.arg = nQuartis, beside=TRUE, ylim=range(pretty(c(0, Quartis))), cex.names = 0.9, xaxs = "i", col = rainbow(2), space=0.5)
dev.off()

#Criação tabela
png(filename = "./graficos/ex3-fig2.png",width=200, height = 400)
p<-tableGrob(tabela)
grid.arrange(p)
dev.off()