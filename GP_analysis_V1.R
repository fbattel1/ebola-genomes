library(Biostrings)
library(tidyverse)

# Downloaded txt files from uniprot 

# Read in sequences from txt files
zaire_GP <- AAString(readLines("ebola_zaire_GP.txt"))
#print(zaire_GP)

reston_GP <- AAString(readLines("ebola_reston_GP.txt"))
#print(reston_GP)


# Align sequences 
alignment_GP <- pairwiseAlignment(pattern = zaire_GP, subject = reston_GP)
print(alignment_GP)

# took screenshot of console alignment graphic for first check in 