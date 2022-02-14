library(readxl)
library(dplyr)

planilha <- read_excel("./dados/exercicio4.xls")
salarios <- planilha$'Salários'

#Criação dos gráficos
png(filename = "./graficos/ex4-fig1.png", width = 1000, height = 800)
hist(salarios, main="Exercício 04 - Histograma", xlab="Salários", ylab="Frequência", col=rgb(0.8,0.1,0.1,0.6))
dev.off()

#Tabela
tabela <- data.frame(t(table(salarios)))[,-1]
tabela$salarios <- as.numeric(levels(tabela$salarios))
tabela <- tabela %>% 
  mutate(Fr = 100*Freq/sum(Freq),
         Fac = cumsum(Freq),
         Xi.Fi = salarios*Freq)
tabela
View(tabela)

#Criação tabela
png(filename = "./graficos/ex4-fig2.png",width=400, height = 600)
p<-tableGrob(tabela)
grid.arrange(p)
dev.off()