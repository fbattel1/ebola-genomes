library(Biostrings)
library(tidyverse)
library(pwalign)
library(ggthemes)
library(ggplot2)
library(dplyr)
library(ggmsa)
library(ggseqlogo)

# Using a stretch of amino acid sequences from AA 30 to 60, spanning AA 33-50 
# AA 33-50 has been identified as playing a role in infectivity 

# Read in sequences from txt files
# Zaire GP
zgp <- AAString(readLines("zgp_30_60.txt"))
print(zgp)

# Reston GP 
rgp <- AAString(readLines("rgp_30_60.txt"))
print(rgp)

 
# Align sequences using pairwise alignment 
alignment_GP <- pairwiseAlignment(pattern = zgp, subject = rgp)
print(alignment_GP)


# Extract sequences (with ziare as pattern and reston as subject) and convert to character vector
# Character vector will store strings of text 
aligned_pattern <- as.character(alignment_GP@pattern)
aligned_subject <- as.character(alignment_GP@subject)

# Create alignment matrix 
# Splits into single characters
# 2 rows, one for each sequence
# byrow = TRUE --> data filled by row 
alignment_matrix <- matrix(c(strsplit(aligned_pattern, "")[[1]],
                             strsplit(aligned_subject, "")[[1]]),
                           nrow = 2, byrow = TRUE)


# Labels rows, or sequences, as below 
rownames(alignment_matrix) <- c("Zaire", "Reston")

## ggmsa visualization

# Convert matrix to data frame 
alignment_aa <- AAStringSet(apply(alignment_matrix, 1, paste, collapse = ""))

# Ensure unique names for each sequence 
names(alignment_aa) <- rownames(alignment_matrix)

# Plot

ggmsa <- ggmsa(alignment_aa) +
  theme_minimal() + 
  theme(axis.text.x = element_text(size = 12), axis.text.y = element_text(size = 12),
        plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 14)) +
  labs(title = "Amino acids 30-60 comparison - Ebola Zaire and Ebola Reston GP",  # Title of the plot
    x = "Position",  # X-axis label
    y = "Amino Acid"  # Y-axis label
  )

ggsave("ggmsa_GP_alignment.png", plot = , width = 10, height = 6, dpi = 300)




# ggseqlogo visualization 

# Position frequency matrix, shows how often the sequence appears in that position of the alignment
create_pfm <- function(mat) {
  unique_aa <- unique(unlist(mat)) # Finds unique AAs in vector form
  pfm <- matrix(0, nrow = length(unique_aa), ncol = ncol(mat)) # Makes empty matrix with 0s for now 
  rownames(pfm) <- unique_aa # Assigns the unique AAs to the two rows 
  
  # Loop through each column in the sequence alignment matrix 
  for (i in 1:ncol(mat)) {
    amino_acids <- mat[, i]
    for (aa in unique_aa) { # Iterates over each AA to see if it's present in both rows of the column 
      if (aa %in% amino_acids) {
        pfm[aa, i] <- sum(amino_acids == aa) # Sums probability/frequency of those AAs in the column
      }
    }
  }
  
  return(pfm) # Prints resulting matrix 
}

# Creates data frame for the position frequency matrix 
pfm <- create_pfm(alignment_matrix)


# Create sequence logo using pfm 

ggseqlogo <- ggseqlogo(pfm, method = "prob") + 
  labs(x = "Position", y = "Probability", 
       title = "Amino acids 30-60 comparison - Ebola Zaire and Ebola Reston GP") + 
  theme_minimal() + 
  theme(plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 12), 
        axis.text = element_text(size = 10))

ggsave("ggseqlogo_GP_alignment.png", plot = , width = 10, height = 1.5, dpi = 300)
