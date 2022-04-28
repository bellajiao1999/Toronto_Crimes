#create a dataframe
df <- read.csv("neighbourhood_crime_rates.csv")


#Clean the dataset
df1 <- df %>% filter( Neighbourhood == "York University Heights")
df2<-df1[1,10:12]
df3<-t(df2)
colnames(df3)<- c("Assault")
neighborhood<-c(df1$Neighbourhood)
df4<-cbind(df3,neighborhood)
df4<-as.data.frame(df4)


#df4$Count=as.numeric(df4$Count)
df4$year<-c(2018,2019,2020)
df4$BnE=c(df1$BreakAndEnter_Rate2018,df1$BreakAndEnter_Rate2019,df1$BreakAndEnter_Rate2020)
df4$Auto_Theft=c(df1$AutoTheft_2018, df1$AutoTheft_2019,df1$AutoTheft_2020)
df4$Robbery=c(df1$Robbery_2018,df1$Robbery_2019,df1$Robbery_2020)
df4$Shooting=c(df1$Shootings_2018, df1$Shootings_2019, df1$Shootings_2020)
df4$Homicide=c(df1$Homicide_2018, df1$Homicide_2019, df1$Homicide_2020)
df4$Assault <- as.integer(df4$Assault) 
df4$year<- as.character(df4$year)

write.csv(df4, "crime_data.csv",row.names = FALSE)
