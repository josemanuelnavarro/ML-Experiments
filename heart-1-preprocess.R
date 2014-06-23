### Data reading and transformations ####


heart <-read.csv("C:/Users/JM/Documents/GitHub/ML-Experiments/heart.csv",sep=" ") #Data obtained from http://archive.ics.uci.edu/ml/datasets/Statlog+%28Heart%29
heart$sex<-as.factor(heart$sex)
heart$chest_pain_type<-as.factor(heart$chest_pain_type)
heart$fasting_blood_sugar.120mg.dl<-as.factor(heart$fasting_blood_sugar.120mg.dl)
heart$ex_induc_angina<-as.factor(heart$ex_induc_angina)
heart$thal<-as.factor(heart$thal)
heart$resting_elec_results<-as.factor(heart$resting_elec_results)
heart$heart_disease<-as.factor(heart$heart_disease)
heart$slope_of_peak_exercise<-ordered(heart$slope_of_peak_exercise,levels=c(1,2,3))

levels(heart$sex)<-c("F","M")
levels(heart$chest_pain_type)<-c("typical_angina","atypical_angina","non_anginal_pain","asymptomatic")
levels(heart$fasting_blood_sugar.120mg.dl)<-c("F","T")
levels(heart$ex_induc_angina)<-c("No","Yes")
levels(heart$slope_of_peak_exercise)<-c("upsloping","flat","downsloping")
levels(heart$thal)<-c("normal","fixed_defect","reversable_defect")
#levels(heart$heart_disease)<-c("No","Yes")
