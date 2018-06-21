tBHQ_data <-  read.csv("EtOH_tBHQ.csv",sep=";")
?read.csv()
str(tBHQ_data$TREATMENT)
library("tidyverse")
survival <- glm(data=tBHQ_data, HVT.min ~ TREATMENT)
group_means <- tBHQ_data %>%
  group_by(TREATMENT) %>%
  summarise(mean = mean(pO2))
ggplot() + geom_point(data=tBHQ_data, aes(x=as.numeric(TREATMENT), y=pO2)) +
  geom_segment(aes(x=as.numeric(TREATMENT)-0.2, xend=as.numeric(TREATMENT)+0.2, y=mean, yend=mean), 
                   data=group_means, colour="black") + theme(axis.text.x=element_blank())
 #git practise
