library(readxl)
library(dplyr)

planilha <- read_excel("./dados/exercicio8.xls")


conjunto <- data.matrix(planilha)
vetor <- as.vector(conjunto)
vetor

#Criação dos gráficos
png(filename = "./graficos/ex8-fig1.png", width = 1000, height = 800)
hist(conjunto, main="Exercício 08 - Histograma", xlab="Altura", ylab="Frequência", col=rgb(0.8,0.1,0.1,0.6))
dev.off()

#Tabela
tabela <- data.frame(t(table(vetor)))[,-1]
tabela$vetor <- as.numeric(levels(tabela$vetor))
tabela <- tabela %>% 
  mutate(Fr = 100*Freq/sum(Freq),
         Fac = cumsum(Freq),
         Xi.Fi = vetor*Freq)
tabela
View(tabela)

#Criação tabela
png(filename = "./graficos/ex8-fig2.png",width=400, height = 800)
p<-tableGrob(tabela)
grid.arrange(p)
dev.off()