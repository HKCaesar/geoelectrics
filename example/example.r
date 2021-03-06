# Script for plotting three profiles of an example measurement
# filled sinkhole

### looking for working directory
#whereFrom=as.character(sys.calls()[[1]][2]) 
#try(setwd(dirname(whereFrom)))

### load packages
library(geoelectrics)
# library(lattice) # for levelplots
# library(rgl)
# library(fields)

# a new object is created for each profile and stored within the list p
p1 <- new("Profile",
            title = "Profile 1",
            xyzData = 
              new("XyzData", 
                  address = "../example/xyzFiles/p1_DipolDipol_SW-NE.xyz"),
            rawData = 
              new("RawData",
                  address = "../example/rawdata/p1_DipolDipol_SW-NE.dat"),
            measurementType = "DipolDipol",
            gpsCoordinates = 
              new("GpsCoordinates",
                  address = "../example/gps/p1.txt"))

p2 <- new("Profile",
            title = "Profile 2",
            xyzData = 
              new("XyzData", 
                  address = "../example/xyzFiles/p2_DipolDipol_SSW-NNE.xyz"),
            rawData = 
              new("RawData",
                  address = "../example/rawdata/p2_DipolDipol_SSW-NNE.dat"),
            measurementType = "DipolDipol",
            gpsCoordinates = 
              new("GpsCoordinates",
                  address = "../example/gps/p2.txt")) 

p3 <- new("Profile",
            title = "Profile 3",
            xyzData = 
              new("XyzData", 
                  address = "../example/xyzFiles/p3_DipolDipol_S-N.xyz"),
            rawData = 
              new("RawData",
                  address = "../example/rawdata/p3_DipolDipol_S-N.dat"),
            measurementType = "DipolDipol",
            gpsCoordinates = 
              new("GpsCoordinates",
                  address = "../example/gps/p3.txt")) 

p3 <- heightAdjustment(p3, -10)

sinkhole <- new("ProfileSet",
                profiles = list(p1, p2, p3),
                title="Sinkhole")

plot3dXyz(p3)
plot3dXyz(sinkhole@profiles[[3]])

plot3dXyz(sinkhole,
          xlab="length [m]", 
          ylab="height above sea level [m]",
          zlab="length [m]")

plotLegend(sinkhole)
plotLegend(p3)

plotIntersect(sinkhole)
plotIntersect(sinkhole@profiles[[1]], sinkhole@profiles[[2]])

plotRawHeight(p1, height = p1@xyzData@height)
levelplotRaw(p1)
levelplotLegendLabel()

levelplotXyz(p1)

#save.image(file="../data/sinkhole.RData", ascii = TRUE)