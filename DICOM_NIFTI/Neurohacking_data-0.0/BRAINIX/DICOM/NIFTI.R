library(oro.dicom)
library(oro.nifti)

# DICOM is a single sheet
# NIFTI is a stack of papers or book, represents 3d image
# Nifti has no pt info

setwd("../Neurohacking_data-0.0/BRAINIX/DICOM/")
all_slices_T1 = readDICOM("T1/")

dim(all_slices_T1$img[[11]])
header = all_slices_T1$hdr[[11]]
header[header$name == "PixelSpacing", "value"]
nifti_T1 = dicom2nifti(all_slices_T1)
dimensions = dim(nifti_T1); dimensions; class(nifti_T1)

image(1:dimensions[1], 1:dimensions[2], nifti_T1[,,11],
      col=gray(0:64/65))


setwd("../NIfTI/")
fname = "Output_3D_File"

writeNIfTI(nim=nifti_T1, filename=fname)

list.files(getwd(), pattern="Output_3D_File")

list.files(getwd(), pattern="T")
