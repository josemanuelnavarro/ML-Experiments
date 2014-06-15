require(ggplot2)
require(hexbin)

#One numerical variable exploration#

histogram<-function(x,df=heart,bw=5){
  ggplot(df)+geom_histogram(aes_string(x=x),binwidth=bw,fill="light blue")  
}

density_line<-function(x,df=heart){
  ggplot(df)+geom_density(aes_string(x=x)) 
}

log_density_line<-function(x,df=heart,breaks=c(10,100,1000,10000)){
  ggplot(df)+geom_density(aes_string(x=x))+scale_x_log10(breaks=breaks)
}

#One categorical variable exploration#

order_variable<- function(x,df=heart){
  var<-as.data.frame(table(df[,x]))
  var<-transform(var,Var1=reorder(Var1,Freq))
  colnames(var)<-c('var1','count')
  return (var)
}

barchart<-function(x,df=heart){
  ggplot(df)+geom_bar(aes_string(x=x),fill="light blue") 
}

h_barchart<-function(x,df=heart){
  ggplot(df)+geom_bar(aes_string(x=x),fill="light blue")+coord_flip()
}


#Relationship between two variables#

lineplot<-function(x,y,df=heart){
  ggplot(df)+geom_line(aes_string(x=x,y=y))
}

scatterplot<-function(x,y,df=heart){
  ggplot(df)+geom_point(aes_string(x=x,y=y))
}

linear_scatterplot<-function(x,y,df=heart){
  ggplot(df,aes_string(x=x,y=y))+geom_point()+stat_smooth(method="lm")
}

smooth_scatterplot<-function(x,y,df=heart){
  ggplot(df,aes_string(x=x,y=y))+geom_point()+geom_smooth()
}

smooth_scatterplot_boolean<-function(x,y,df=heart){
  df[,y]<-as.numeric(df[,y])
  ggplot(df,aes_string(x=x,y=y))+geom_point(position=position_jitter(w=0.05,h=0.05))+geom_smooth()
}

#Bar charts for two categorical variables#

stacked_bar<-function(x,y,df=heart){
  ggplot(df)+geom_bar(aes_string(x=x,fill=y))
}

sidebyside_bar<-function(x,y,df=heart){
  ggplot(df)+geom_bar(aes_string(x=x,fill=y),position='dodge')
}

filled_bar<-function(x,y,df=heart){
  ggplot(df)+geom_bar(aes_string(x=x,fill=y),position='fill')
}

rug_bar<-function(x,y,df=heart){
  ggplot(df,aes_string(x=x))+geom_bar(aes_string(fill=y),position='fill')+geom_point(aes(y=-0.05),size=0.75,aplha=0.3,position=position_jitter(h=0.01))
}

#facet_bar: can't make it work inside a function
  #ggplot(heart)+geom_bar(aes(x=x),position="dodge",fill="light blue")+facet_wrap(~y,scales="free_y")+theme(axis.text.x=element_text(angle=45,hjust=1))
