library(dplyr)
library(ggiraph)
drug_df=read.csv(file="C:\\Users\\Hitesh\\Documents\\Data-is-Beautiful-Challenges\\Feb-2019\\dataset.csv")
drug_list=drug_df$Drug
drug_mean_list=c("Mean Physical Harm","Mean Dependence","Mean Social Harm")
drug_harm_list=c("Acute Harm","Chronic Harm","Intravenous Harm","Pleasure","Psychological","Physical")
temp_df = data.frame(Drug_Name=character(),Drug_Mean_Category=character(),Drug_Mean_Value=integer())
for(row in 1:nrow(drug_df))
{
    Acute_Harm=paste("Acute Harm:",drug_df[row,"Acute.harm"],sep=" ")
    Chronic_Harm=paste("Chronic Harm:",drug_df[row,"Chronic.harm"],sep=" ")
    Intravenous_Harm=paste("Intravenous Harm:",drug_df[row,"Intravenous.harm"],sep=" ")
    temp_df=rbind(temp_df,data.frame(
      Drug_Name=drug_df[row,"Drug"],
      Drug_Mean_Category=drug_mean_list[1],
      Drug_Mean_Value=drug_df[row,"Mean.Physical.harm"]
    ))
    
    Pleasure=paste("Pleasure:",drug_df[row,"Pleasure"],sep=" ")
    Psychological=paste("Psychological:",drug_df[row,"Psychological"],sep=" ")
    Physical=paste("Physical:",drug_df[row,"Physical"],sep=" ")
    temp_df=rbind(temp_df,data.frame(
      Drug_Name=drug_df[row,"Drug"],
      Drug_Mean_Category=drug_mean_list[2],
      Drug_Mean_Value=drug_df[row,"Mean.Dependence"]
    ))
}

p=ggplot(data=temp_df, aes(x=Drug_Name, y=Drug_Mean_Value, fill=Drug_Mean_Category)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black")+
  geom_text(aes(label=Drug_Mean_Value),
            position = position_dodge(0.9),vjust = -0.5, size = 3
            )+
  scale_fill_manual(values=c("#2c7fb8", "#7fcdbb"))+
  labs(x="Name of the Drug",
       y="Mean Values")+
  guides(fill=guide_legend(title="Drug Mean Category"))+
  theme(axis.text.x  = element_text(angle=90, vjust=0.5,size=12),
        axis.text.x  = element_text(vjust=0.5,size=12),
        axis.title.x  = element_text(vjust=0.5,size=16),
        axis.title.y  = element_text(vjust=0.5,size=16)
        )
temp_df = data.frame(Drug_Name=character(),Drug_Mean_Category=character(),Drug_Mean_Value=integer())
for(row in 1:nrow(drug_df))
{
  Acute_Harm=drug_df[row,"Acute.harm"]
  Chronic_Harm=drug_df[row,"Chronic.harm"]
  Intravenous_Harm=drug_df[row,"Intravenous.harm"]
  Pleasure=drug_df[row,"Pleasure"]
  Psychological=drug_df[row,"Psychological"]
  Physical=drug_df[row,"Physical"]
  
  temp_df=rbind(temp_df,data.frame(
    Drug_Name=drug_df[row,"Drug"],
    Drug_Mean_Category=drug_harm_list[1],
    Drug_Mean_Value=Acute_Harm
  ))
  temp_df=rbind(temp_df,data.frame(
    Drug_Name=drug_df[row,"Drug"],
    Drug_Mean_Category=drug_harm_list[2],
    Drug_Mean_Value=Chronic_Harm
  ))
  temp_df=rbind(temp_df,data.frame(
    Drug_Name=drug_df[row,"Drug"],
    Drug_Mean_Category=drug_harm_list[3],
    Drug_Mean_Value=Intravenous_Harm
  ))
  temp_df=rbind(temp_df,data.frame(
    Drug_Name=drug_df[row,"Drug"],
    Drug_Mean_Category=drug_harm_list[4],
    Drug_Mean_Value=Pleasure
  ))
  temp_df=rbind(temp_df,data.frame(
    Drug_Name=drug_df[row,"Drug"],
    Drug_Mean_Category=drug_harm_list[5],
    Drug_Mean_Value=Psychological
  ))
  temp_df=rbind(temp_df,data.frame(
    Drug_Name=drug_df[row,"Drug"],
    Drug_Mean_Category=drug_harm_list[6],
    Drug_Mean_Value=Physical
  ))
}


p<-ggplot(df2, aes(x=dose, y=len, group=supp)) +
  geom_line(aes(color=supp))+
  geom_point(aes(color=supp))

r=ggplot(data=temp_df, aes(x=Drug_Name, y=Drug_Mean_Value, group=Drug_Mean_Category)) +
  geom_line(aes(color=Drug_Mean_Category),size=1)+
  geom_point(aes(color=Drug_Mean_Category))+
  geom_text(aes(label=Drug_Mean_Value),
            position = position_dodge(),vjust = 1, size = 4
  )+
  scale_color_manual("Drug Harm/Dependency",values=c("#3E5622","#678D58","#A6C48A","#c69f26","#f7d560","#ffe774"))+
  labs(x="Name of the Drug",
       y="Values")+
  guides(fill=guide_legend(title="Drug Harm/Dependency"))+
  theme(axis.text.x  = element_text(angle=90, vjust=0.5,size=12),
        axis.text.x  = element_text(vjust=0.5,size=12),
        axis.title.x  = element_text(vjust=0.5,size=16),
        axis.title.y  = element_text(vjust=0.5,size=16)
  )
grid.arrange(p,r,nrow=2)