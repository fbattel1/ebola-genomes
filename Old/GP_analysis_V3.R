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





##------ ggmsa visualization-------

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

#ggsave("ggmsa_GP_alignment.png", plot = , width = 10, height = 6, dpi = 300)




##-------- ggseqlogo visualization --------

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

#ggsave("ggseqlogo_GP_alignment.png", plot = , width = 10, height = 1.5, dpi = 300)



####comment from here down 
## --------- Substitution table ------------

# Create data frame for the substitution table

substitution_table <- data.frame(From = character(0),
                                 To = character(0),
                                 Frequency = integer(0),
                                 stringsAsFactors = FALSE)

# Loop through each aligned position to compare amino acids
for (i in 1:nchar(aligned_pattern)) {  # Use nchar to iterate over each position
  aa1 <- substr(aligned_pattern, i, i)  # Amino acid from Zaire sequence (pattern)
  aa2 <- substr(aligned_subject, i, i)  # Amino acid from Reston sequence (subject)
  
  if (aa1 != aa2) {  # Only track substitutions (not matches)
    # Add the substitution to the table (From -> To)
    substitution_table <- rbind(substitution_table, 
                                data.frame(From = aa1, 
                                           To = aa2, 
                                           Frequency = 1))
  }
}

# Aggregate the substitutions to calculate the frequency of each unique substitution
substitution_table <- substitution_table %>%
  group_by(From, To) %>%
  summarise(Frequency = sum(Frequency)) %>%
  arrange(desc(Frequency))

# Print the substitution table
view(substitution_table)


# Plot (fix this... make it look nicer)
ggplot(substitution_table, aes(x = interaction(From, To), y = Frequency, fill = Frequency)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  theme_minimal() +
  labs(x = "Substitution (From → To)", 
       y = "Frequency", 
       title = "Substitution Frequencies Between Zaire and Reston GP") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


## Let's do some stats about substitutions. 
# Idea: chemistry changes - are they similar or very different 
# Idea: number of changes compared to whole sequence compared
# ------ Calculate Percent Identity ------
# Initialize a counter for matches
matches <- 0
total_positions <- nchar(aligned_pattern)

# Loop through each position and check for matches
for (i in 1:total_positions) {
  aa1 <- substr(aligned_pattern, i, i)  # Amino acid from Zaire sequence
  aa2 <- substr(aligned_subject, i, i)  # Amino acid from Reston sequence
  
  if (aa1 == aa2) {  # Check if the amino acids are the same
    matches <- matches + 1
  }
}

# Calculate Percent Identity
percent_identity <- (matches / total_positions) * 100

# Print Percent Identity
cat("Percent Identity between Zaire and Reston GP: ", percent_identity, "%\n")

# You can also visualize percent identity, for example, in your plot or log
# Adding a line to show this on the ggmsa plot:
ggmsa_plot + 
  ggtitle(paste("Percent Identity: ", round(percent_identity, 2),

## when this ^ is put into ggmsa plot earlier, comes back w % identity = 60% 



###------ Looking at properties -----
# The code below goes through single changes at a time
# This means we'll have to use our substitution table and do the analysis ourselves 
# Ex. T --> A, run all this code. Then F --> I, run all this code. 

# Define the properties for each amino acid: charge, size, and hydrophobicity
aa_properties <- data.frame(
  Amino_Acid = c("A", "C", "D", "E", "F", "G", "H", "I", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "Y"),
  Charge = c("Neutral", "Neutral", "Acidic", "Acidic", "Neutral", "Neutral", "Basic", "Neutral", "Basic", "Neutral", "Neutral", "Polar", "Neutral", "Polar", "Basic", "Neutral", "Neutral", "Neutral", "Neutral", "Neutral"),
  Size = c("Small", "Small", "Medium", "Medium", "Large", "Small", "Medium", "Large", "Large", "Large", "Medium", "Small", "Small", "Small", "Large", "Small", "Small", "Small", "Large", "Large"),
  Hydrophobicity = c("Hydrophobic", "Hydrophobic", "Hydrophilic", "Hydrophilic", "Hydrophobic", "Hydrophobic", "Hydrophilic", "Hydrophobic", "Hydrophilic", "Hydrophobic", "Hydrophobic", "Hydrophilic", "Hydrophobic", "Hydrophilic", "Hydrophilic", "Hydrophilic", "Hydrophilic", "Hydrophobic", "Hydrophobic", "Hydrophobic")
)

# Example amino acid substitution (D -> K)
from_aa <- "D"
to_aa <- "K"

# Get properties for the substitution
from_properties <- aa_properties[aa_properties$Amino_Acid == from_aa, ]
to_properties <- aa_properties[aa_properties$Amino_Acid == to_aa, ]

# Print the properties of both amino acids
cat("From:", from_aa, "Properties:", paste(from_properties[2:4], collapse = ", "), "\n")
cat("To:", to_aa, "Properties:", paste(to_properties[2:4], collapse = ", "), "\n")

#Later on, 
#For more detailed functional analysis or to understand if an amino acid change could affect protein activity (e.g., enzyme activity, binding affinity, etc.), there are databases and tools that can be used, such as:
#SIFT (Sorting Intolerant From Tolerant): Predicts whether an amino acid substitution affects protein function based on sequence conservation.
#PolyPhen-2 (Polymorphism Phenotyping v2): Predicts the impact of amino acid substitutions on protein function.
#PROVEAN: Another tool that predicts the functional effects of amino acid substitutions on protein function.
#There are R packages to interface with some of these tools and databases, or you can use external tools and import the results into R for further analysis.











