alldata <- read.csv("alldata.csv")

head(alldata)

str(alldata)

#New Arrival Date Column

alldata$NewArrivalDate <- strptime(as.character(alldata$Arrival.Date), "%m/%d/%Y")
alldata$NewArrivalDate <- as.Date(alldata$NewArrivalDate)

#New Dept Date Column

alldata$NewDepartureDate <- strptime(as.character(alldata$Departure.Date), "%m/%d/%Y")
alldata$NewDepartureDate <- as.Date(alldata$NewDepartureDate)

#New Stay # Date Column

alldata$StayNumber <- alldata$NewDepartureDate - alldata$NewArrivalDate 

# Let's remove our old date columns
alldata <- subset(alldata, select = -c(Arrival.Date, Departure.Date))

