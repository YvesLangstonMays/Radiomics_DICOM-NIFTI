library(oro.dicom)
library(oro.nifti)


setwd("../Neurohacking_data-0.0/BRAINIX/DICOM/")
slice = readDICOM("T1/BRAINIX_DICOM_T1_IM-0001-0001.dcm")

class(slice)

names(slice)

class(slice$hdr)
class(slice$img)

# There is a header and an image, both are lists
slice$hdr

# Dimensions are 512x512
dim(slice$img[[1]])

# Plotting
# Defining the dimensions
dimensions = dim(t(slice$img[[1]]))
dimensions
# Use the transpose function to plot
image(1:dimensions[1], 1:dimensions[2], t(slice$img[[1]]), col=gray(0:64/64))

# Plot without subsetting, prob = T makes it a density hist instead of count
hist(slice$img[[1]][,], breaks=50, xlab="FLAIR", prob=T, col=rgb(0, 0, 1, 1/4), main="")

header = slice$hdr[[1]]
names(header)
# [1] "group"    "element"  "name"     "code"     "length"   "value"    "sequence"

header$name
header[header$name == "PixelSpacing", "value"]
# Each pixel is 0.46875mm x 0.46875mm

header[header$name == "FlipAngle",]
# Flip angle of 4

all_slices_T1 = readDICOM("T1/")

dim(all_slices_T1$img[[11]])
header = all_slices_T1$hdr[[11]]
header[header$name == "PixelSpacing", "value"]
