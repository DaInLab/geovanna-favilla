library(readxl)
library(dplyr)

planilha <- read_excel("./dados/exercicio9.xls")
salarios <- planilha$'Salários'

freqSal  <- read_excel("dados/exercicio9.xls")
freqSal[,'Ganho Salarial'] <- NA

freqSal$`Faixa Salarial`[freqSal$Salários < 10] <- 'Baixa'
freqSal$`Faixa Salarial`[freqSal$Salários > 10 ] <- 'Média'
freqSal$`Faixa Salarial`[freqSal$Salários > 15] <- 'Alta'

salarios <- freq2raw(data=freqSal, freq= freqSal$qtde_func)


#Criação dos gráficos
png(filename = "./graficos/ex9-fig1.png", width = 1000, height = 800)
hist(salarios, main="Exercício 09 - Histograma", xlab="Salários (em salários mínimos recebidos)", ylab="Frequência",beside=TRUE, ylim=range(pretty(c(0, salarios))), col=rgb(0.8,0.1,0.1,0.6))
dev.off()

tabela <- data.frame(t(table(salarios)))[,-1]
tabela$salarios <- as.numeric(levels(tabela$salarios))
tabela <- tabela %>% 
  mutate(Fr = 100*Freq/sum(Freq),
         Fac = cumsum(Freq),
         Xi.Fi = salarios*Freq)
tabela
View(tabela)
#Criação tabela
png(filename = "./graficos/ex9-fig2.png",width=400, height = 1200)
p<-tableGrob(tabela)
grid.arrange(p)
dev.off()