#Load data
kzooparcels <- read.csv(file = "ParcelsCT_Neighb.csv", head = T, sep = ",")
View(kzooparcels)

#Subset for each neighborhood
BurkeAcres <- subset(kzooparcels, NAME == "Burke Acres")
Northside <- subset(kzooparcels, NAME == "Northside")
Westwood <- subset(kzooparcels, NAME == "Westwood")
Fairmont <- subset(kzooparcels, NAME == "Fairmont")
Eastside <- subset(kzooparcels, NAME == "Eastside")
Stuart <- subset(kzooparcels, NAME == "Stuart")
CBD <- subset(kzooparcels, NAME == "CBD")
Edison <- subset(kzooparcels, NAME == "Edison")
WestMainHill <- subset(kzooparcels, NAME == "West Main Hill")
WMUKRPH <- subset(kzooparcels, NAME == "WMU/KRPH")
Arcadia <- subset(kzooparcels, NAME == "Arcadia")
Vine <- subset(kzooparcels, NAME == "Vine")
Knollwood <- subset(kzooparcels, NAME == "Knollwood")
Southside <- subset(kzooparcels, NAME == "Southside")
OaklandWinchell <- subset(kzooparcels, NAME == "Oakland/Winchell")
WestnedgeHill <- subset(kzooparcels, NAME == "Westnedge Hill")
Milwood <- subset(kzooparcels, NAME == "Milwood")
SouthWestnedge <- subset(kzooparcels, NAME == "South Westnedge")
ColonyFarm <- subset(kzooparcels, NAME == "Colony Farm")
ParkviewHills <- subset(kzooparcels, NAME == "Parkview Hills")
Oakwood <- subset(kzooparcels, NAME == "Oakwood")
HillnBrook <- subset(kzooparcels, NAME == "Hill N' Brook")

View(HillnBrook)

#summary statistics of taxable value per acre across whole City
summary(kzooparcels$TVperAcre)


require(sqldf)
#Calculate TVpAcre of the average parcel by neighborhood.
NeighbTV <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                  sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreN
                  from kzooparcels where NAME != 'NA' group by NAME")
View(NeighbTV)

write.csv(NeighbTV, "TVbyNeighb.csv")

#Calculate avg TVpAcre by zoning code across the whole City

ZoneTV <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from kzooparcels where ParcelM_16 != 'NA' group by ParcelM_16")
View(ZoneTV)

write.csv(ZoneTV, "TVbyZoning.csv")


#Calculate avg TVpAcre by zoning code by neighborhood

ZoneBA <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from BurkeAcres where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneNS <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from Northside where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneWW <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from Westwood where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneFM <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from Fairmont where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneES <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from Eastside where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneSt <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from Stuart where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneCBD <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from CBD where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneEd <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from Edison where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneWMH <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from WestMainHill where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneWMU <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from WMUKRPH where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneArc <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from Arcadia where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneVine <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from Vine where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneBA <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from BurkeAcres where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneKW <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from Knollwood where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneSS <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from Southside where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneOW <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from OaklandWinchell where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneWNH <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from WestnedgeHill where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneMW <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from Milwood where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneSWN <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from SouthWestnedge where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneCF <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from ColonyFarm where ParcelM_16 != 'NA' group by ParcelM_16")
ZonePVH <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from ParkviewHills where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneOWood <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                 from Oakwood where ParcelM_16 != 'NA' group by ParcelM_16")
ZoneHnB <- sqldf("select ParcelM_16, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                 from HillnBrook where ParcelM_16 != 'NA' group by ParcelM_16")


View(ZoneHnB)

write.csv(ZoneHnB, "TVbyZoningHnB.csv")
write.csv(ZoneOWood, "TVbyZoningOWood.csv")
write.csv(ZonePVH, "TVbyZoningPVH.csv")
write.csv(ZoneCF, "TVbyZoningCF.csv")
write.csv(ZoneSWN, "TVbyZoningSWN.csv")
write.csv(ZoneMW, "TVbyZoningMW.csv")
write.csv(ZoneWNH, "TVbyZoningWNH.csv")
write.csv(ZoneOW, "TVbyZoningOW.csv")
write.csv(ZoneSS, "TVbyZoningSS.csv")
write.csv(ZoneKW, "TVbyZoningKW.csv")
write.csv(ZoneBA, "TVbyZoningBA.csv")
write.csv(ZoneVine, "TVbyZoningVine.csv")
write.csv(ZoneArc, "TVbyZoningArc.csv")
write.csv(ZoneWMU, "TVbyZoningWMU.csv")
write.csv(ZoneEd, "TVbyZoningEd.csv")
write.csv(ZoneCBD, "TVbyZoningCBD.csv")
write.csv(ZoneSt, "TVbyZoningSt.csv")
write.csv(ZoneES, "TVbyZoningES.csv")
write.csv(ZoneFM, "TVbyZoningFM.csv")
write.csv(ZoneWW, "TVbyZoningWW.csv")
write.csv(ZoneNS, "TVbyZoningNS.csv")
write.csv(ZoneBA, "TVbyZoningBA.csv")
write.csv(ZoneWMH, "TVbyZoningWMH.csv")



#Next time, just add a where NAME = "neighborhood" and select
#from kzooparcels, saves a step.


#Now let's do the inverse, look at how different zoning categories
#have different values depending on neighborhood.

CBTR <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
                from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'CBTR' group by NAME")
CC <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'CC' group by NAME")
CCBD <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'CCBD' group by NAME")
CMU <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'CMU' group by NAME")
CN1 <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'CN-1' group by NAME")
CO <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'CO' group by NAME")
IC <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'IC' group by NAME")
M1 <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'M-1' group by NAME")
M2 <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'M-2' group by NAME")
PUD <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'PUD' group by NAME")
RD19 <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'RD-19' group by NAME")
RM15 <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'RM-15' group by NAME")
RM24 <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'RM-24' group by NAME")
RM36 <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'RM-36' group by NAME")
RMU <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'RMU' group by NAME")
RS5 <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'RS-5' group by NAME")
RS7 <- sqldf("select NAME, count(TVperAcre) as NumParcels,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreZ
              from kzooparcels where ParcelM_16 != 'NA' AND 
              ParcelM_16 = 'RS-7' group by NAME")


View(CBTR)

write.csv(CC, "TVbyNeighbCC.csv")
write.csv(CBTR, "TVbyNeighbCBTR.csv")
write.csv(CCBD, "TVbyNeighbCCBD.csv")
write.csv(CMU, "TVbyNeighbCMU.csv")
write.csv(CN1, "TVbyNeighbCN1.csv")
write.csv(CO, "TVbyNeighbCO.csv")
write.csv(IC, "TVbyNeighbIC.csv")
write.csv(M1, "TVbyNeighbM1.csv")
write.csv(M2, "TVbyNeighbM2.csv")
write.csv(PUD, "TVbyNeighbPUD.csv")
write.csv(RD19, "TVbyNeighbRD19.csv")
write.csv(RM15, "TVbyNeighbRM15.csv")
write.csv(RM24, "TVbyNeighbRM24.csv")
write.csv(RM36, "TVbyNeighbRM36.csv")
write.csv(RMU, "TVbyNeighbRMU.csv")
write.csv(RS5, "TVbyNeighbRS5.csv")
write.csv(RS7, "TVbyNeighbRS7.csv")


#load 2011 data, subset only columns we need, and merge
#with 2016 data. Then calculate difference and % Change
#between TVpacre in 2011 to 2016 by neighborhood.
#ID which neighborhoods are becoming more valuable/less valuable

parcels2011 <- read.csv(file = "2011Parcels.csv", head = T, sep = ",")

names(parcels2011)
cols <- c(5, 40)
names(parcels2011)[40] <- "TVpAcre11"

parcels2011 <- parcels2011[, cols]
names(parcels2011)

#merge w/ 2016 data by PIN
parcels1116 <- merge(parcels2011, kzooparcels, by = "PIN", all.x = T)

View(parcels1116)



#Create Neighb level aggregate data
NeighbTV2 <- sqldf("select NAME, count(TVpAcre11) as NumParcels,
                  sum(TVpAcre11)/count(TVpAcre11) as AvgTVpAcre11,
sum(TVperAcre)/count(TVperAcre) as AvgTVpAcre16
                  from parcels1116 where NAME != 'NA' group by NAME")

#Calc % Change from 2011 to 2016
NeighbTV2$Diff <- NeighbTV2$AvgTVpAcre16 - NeighbTV2$AvgTVpAcre11
NeighbTV2$PerChange <- NeighbTV2$Diff / NeighbTV2$AvgTVpAcre11

View(NeighbTV2)

write.csv(NeighbTV2, "PerChangeCT.csv")
#Now use this to create map showing change.****










#Calc Avg TV p Acre by Census Tract for Kzoo
#Then load in U.S. Census data, merge, and conduct analysis
CTTV <- sqldf("select TRCT_KEY, count(TVperAcre) as NumParcels,
                  sum(TVperAcre)/count(TVperAcre) as AvgTVpAcreN
                  from kzooparcels where TRCT_KEY != 'NA' group by TRCT_KEY")
View(CTTV)

tractscensus <- read.csv(file = "tractsdata.csv", head = T, sep = ",")

View(tractscensus)


tracts <- merge(CTTV, tractscensus, by.x = "TRCT_KEY", by.y = "trct_key", all.x.y = T)


View(tracts)

write.csv(tracts, "tractsmerge.csv")

#Now perform the analysis

require(Hmisc)

names(tracts)

options(scipen = 999)

corrCT <- lm(AvgTVpAcreN ~ PercNonWhite + PercVacHU + PercOO +
               MedHHInc + MGR + PerFamHH + PercFamPov +
               PerCollDeg + PercUnemp + CommDrAlone, data = tracts)

summary(corrCT)



plot(tracts$MedHHInc, tracts$AvgTVpAcreN)

cor(tracts$AvgTVpAcreN, tracts$MedHHInc)
cor(tracts$AvgTVpAcreN, tracts$MHV)
cor(tracts$AvgTVpAcreN, tracts$PercWhite)
cor(tracts$AvgTVpAcreN, tracts$DenPPSQMI)
cor(tracts$AvgTVpAcreN, tracts$PercRO)










#by property class, ignore for now.
ZonePC <- sqldf("select parcels_pr,
                sum(TVperAcre)/count(TVperAcre) as AvgTVpAcrePC
                from kzooparcels where parcels_pr != 'NA' group by parcels_pr")
View(ZonePC)





#Use SQLDF to find the average number of positive growth years for a parcel by neighborhood and the average number of occupancy changes per parcel for a neighborhood.

require(sqldf)

AvgPosOcc

count(parcel_num) as NumParcels,

sum(Total_Pos_Years)/count(Total_Pos_Years) as AvgPositiveYears, sum(Occupancy_Change)/count(Occupancy_Change) as AvgOccChange from TAData where BRA_PD != 'NA' group by BRA_PD")

AvgPosOcc2

View(AvgPosOcc2)

#Now let's see how those total numbers compare to just how things fared during the recession and after the recession.

AvgPosOcc_Rec

AvgPosOcc_Rec2

View(AvgPosOcc_Rec2)

#Let's combine this back into our PDmerge2 dataset.

PDmerge3

PDmerge4

View(PDmerge4)

#Let's see how the average number of positive years per parcel compared to the average number of occupancy status changes per parcel.