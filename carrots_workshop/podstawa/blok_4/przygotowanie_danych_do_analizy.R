### PRZYGOTOWYWANIE DANYCH DO ANALIZY

# konwersje typów
  
#czyli co sie dzieje kiedy ladujemy dane do R i nie sa one dokladnie w takim typie jakbysmy chcieli
 
#1. Wymiencie znane typy danych
#2. Jakie typy na jakie mozemy chciec konwertowac?

titanic <- read.table("titanic.csv", sep=";", quote="", header=TRUE)

titanic[1:10,]

summary(titanic)
  
#mozna sprawdzic typy danych dla wszystkich kolumn jednoczesnie:
sapply(titanic, class)

#albo pojedynczo

  is.factor(titanic$Survived)
  is.numeric(titanic$Survived)
#is.integer()
#is.character()
  
  as.factor(titanic$Survived)
  #sprawdzmy!
  
  is.factor(titanic$Survived)
  
  titanic$Survived<-as.factor(titanic$Survived)
  
  is.factor(titanic$Survived)
  
  is.numeric(titanic$Fare)
  is.numeric(titanic$Age)
  is.factor(titanic$Pclass)
  is.numeric(titanic$Pclass)
  titanic$Pclass <- as.factor(titanic$Pclass)
  is.factor(titanic$Pclass)
  is.factor(titanic$Sex)
  
#konwersja z factor do numeric
  as.numeric(factor(c(-2,2)))
  
  
  as.numeric(as.character(factor(c(-2,2))))
  
  #mozna rowniez zmieniac typy wektorow, macierzy itp
  
  
#####################################################################
# wyrażenia regularne
  
  summary(titanic)
  sapply(titanic, class)
  
 titanic$Name<- as.character(titanic$Name)
 
 is.character(titanic$Name)
 
 #grep, grepl
 
 grep("James", titanic$Name)
 grep("[jJ]ames", titanic$Name)
 length( grep("James", titanic$Name))
 grep('(', titanic$Name)
 
 grep("a+", c("abc", "def", "cba a", "aa"), perl=TRUE, value=FALSE)
 
 grep("a+", c("abc", "def", "cba a", "aa"), perl=TRUE, value=TRUE)
 
 grepl("a+", c("abc", "def", "cba a", "aa"), perl=TRUE)
 
 #regexpr, gregexpr
 
 regexpr(",(.*)", titanic$Name)
new_name<- substr(titanic$Name,1,",")

regmatches(titanic$Name, regexpr("Miss(.*)",titanic$Name))
regexpr("a+", c("abc", "def", "cba a", "aa"), perl=TRUE)
 
 
 gregexpr("a+", c("abc", "def", "cba a", "aa"), perl=TRUE)
 
 x <- c("abc", "def", "cba a", "aa")
 m <- regexpr("a+", x, perl=TRUE)
 regmatches(x, m)

 m <- gregexpr("a+", x, perl=TRUE)
 regmatches(x, m)
 
 #sub, gsub
 sub('"\"', "", titanic$Name)
 
 gsub('"\"', "", titanic$Name)
 
 #regexec
 
 r<-regexec("Mr.(.*?)", titanic$Name)
r 
m <-regmatches(titanic$Name, r)

m
###################################################################
# radzenie sobie z brakami danych
summary(titanic)
#testowanie na brakujace dane
is.na(x) # returns TRUE of x is missing
y <- c(1,2,3,NA)
is.na(y) # returns a vector (F F F T) 
#na poczatek warto sie przyjrzec czy sa to wybrakowane obserwacje i je usunac

#brakujace dane mozna uzupelnic srednia badz mediana, dane titanic 
x <- c(1,2,NA,3)
mean(titanic$Age) 
mean(titanic$Age, na.rm=TRUE)
median(titanic$Age, na.rm=TRUE)



titanic$Age[is.na(titanic$Age)] <- mean(titanic$Age, na.rm=TRUE)

mean(titanic$Age) 

#brakujace dane mozna uzupelnic np danymi z dnia poprzedniego

# list rows of data that have missing values
mydata[!complete.cases(mydata),]

# create new dataset without missing data
newdata <- na.omit(mydata) 
