library(ggplot2)
library(ggpubr)

df<-read.csv("bcg.csv")
head(df)

# testing example change

p <- ggplot(data=df, aes(x=align.length, y=pct.id)) + 
  geom_count() + 
  theme_bw()+ 
  font("xylab", size=25) +
  font("xy.text", size=20) + 
  font("legend.title", size=15)+
  xlab("\nAlignment length") + 
  ylab("Percent identity\n") + 
  #scale_size_continuous("Count") + 
  scale_size_continuous(range = c(5, 30)) + 
  rremove("legend")

p+  geom_text(data = ggplot_build(p)$data[[1]], 
            aes(x, y, label = n), color = "#ffffff", size=5)

ggplot(data=df, aes(x=Gene.ontology..cellular.component.)) + 
  geom_bar() + 
  theme_bw()+ 
  font("xylab", size=25) +
  font("xy.text", size=8) + 
  font("legend.title", size=15)+
  xlab("GO Compartment") + 
  ylab("Count") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggplot(data=df, aes(x=Transmembrane)) + 
  geom_bar() + 
  theme_bw()+ 
  font("xylab", size=30) +
  font("xy.text", size=25) + 
  font("legend.title", size=15)+
  xlab("\nTransmembrane") + 
  ylab("Count\n") + 
  theme(axis.text.x = element_text(angle = 0, hjust = 1))


df2<-read.csv("Database_InsilicoBCG.csv")

df2<-data.frame(c(df2$Gene.ontology..cellular.component..1, df2$tag.2[df2$tag.2%in%c("cell wall")])); colnames(df2)<-"Gene.ontology..cellular.component..1"

ggplot(data=df2, aes(x=Gene.ontology..cellular.component..1)) + 
  geom_bar() + 
  theme_bw()+ 
  font("xylab", size=25) +
  font("xy.text", size=8) + 
  font("legend.title", size=15)+
  xlab("GO Compartment") + 
  ylab("Count") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

df2$Gene.ontology..cellular.component..1[df2$Gene.ontology..cellular.component..1%in%"Cell Surface"]<-"cell surface"
#df2$Gene.ontology..cellular.component..1[df2$Gene.ontology..cellular.component..1%in%"cell outer membrane"]<-"cell surface"
df2$Gene.ontology..cellular.component..1[df2$Gene.ontology..cellular.component..1%in%"plasma membrane "]<-"plasma membrane"
df2$Gene.ontology..cellular.component..1[df2$Gene.ontology..cellular.component..1%in%"cytoplasm "]<-"cytoplasm"
df2$Gene.ontology..cellular.component..1[df2$Gene.ontology..cellular.component..1%in%"cytosol"]<-"cytoplasm"
df2$Gene.ontology..cellular.component..1[df2$Gene.ontology..cellular.component..1%in%"chromosome"]<-""
df2$Gene.ontology..cellular.component..1[df2$Gene.ontology..cellular.component..1%in%"proteasome complex"]<-"cytoplasm"
df2$Gene.ontology..cellular.component..1[df2$Gene.ontology..cellular.component..1%in%"bacterial extracellular vesicle"]<-"secreted"
df2$Gene.ontology..cellular.component..1[df2$Gene.ontology..cellular.component..1%in%"Secreted"]<-"secreted"




df3<-data.frame(df2[!(df2$Gene.ontology..cellular.component..1==""),]); colnames(df3)<-"Gene.ontology..cellular.component..1"

df2<-read.csv("bcg3.csv")
df2$Gene.ontology..cellular.component.[df2$Gene.ontology..cellular.component.%in%"Cell Surface"]<-" cell surface"
df2$Gene.ontology..cellular.component.[df2$Gene.ontology..cellular.component.%in%"cell Surface"]<-" cell surface"
df2$Gene.ontology..cellular.component.[df2$Gene.ontology..cellular.component.%in%"cell surface"]<-" cell surface"
#df2$Gene.ontology..cellular.component..1[df2$Gene.ontology..cellular.component..1%in%"cell outer membrane"]<-"cell surface"
df2$Gene.ontology..cellular.component.[df2$Gene.ontology..cellular.component.%in%"plasma membrane "]<-"plasma membrane"
df2$Gene.ontology..cellular.component.[df2$Gene.ontology..cellular.component.%in%"Plasma membrane"]<-"plasma membrane"
df2$Gene.ontology..cellular.component.[df2$Gene.ontology..cellular.component.%in%"cytoplasm "]<-"cytoplasm"
df2$Gene.ontology..cellular.component.[df2$Gene.ontology..cellular.component.%in%"cytosol"]<-"cytoplasm"
df2$Gene.ontology..cellular.component.[df2$Gene.ontology..cellular.component.%in%"chromosome"]<-""
df2$Gene.ontology..cellular.component.[df2$Gene.ontology..cellular.component.%in%"extracellular region"]<-""
df2$Gene.ontology..cellular.component.[df2$Gene.ontology..cellular.component.%in%"proteasome complex"]<-"cytoplasm"
df2$Gene.ontology..cellular.component.[df2$Gene.ontology..cellular.component.%in%"bacterial extracellular vesicle"]<-"secreted"
df2$Gene.ontology..cellular.component.[df2$Gene.ontology..cellular.component.%in%"Secreted"]<-"secreted"

df2<-df2[df2$Gene.ontology..cellular.component.!="", ]

ggplot(data=df2, aes(x=Gene.ontology..cellular.component.)) + 
  geom_bar(stat="count", fill="black") + 
  stat_count(geom = "text", colour = "white", size = 8,
             aes(label = ..count..),position=position_stack(vjust=0.5)) + 
  theme_bw()+ 
  font("xylab", size=25) +
  font("xy.text", size=20) + 
  font("legend.title", size=14)+
  xlab("\nGO Compartment") + 
  ylab("Count\n") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
