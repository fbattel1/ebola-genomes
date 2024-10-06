EBOLA PROTEOMICS

Title: Comparative proteomics of lethal and non-pathogenic Ebolavirus species 

Description: The viral genus Ebolavirus contains six different species, nearly all of which are highly lethal in humans. The species Zaire ebolavirus has caused multiple outbreaks and has a fatality rate up to 90%. Its close relative, Reston ebolavirus, is the only Ebolavirus species to infect humans without causing disease.  We would like to compare the protein sequences of Reston ebolavirus and Zaire ebolavirus to understand differences that may contribute to pathogenicity. 

Published reference: Cong et al., 2015 https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4615121/
- This paper compared proteome of Ebolavirus species to find amino acid changes that could be associated with a loss of pathogenicity
- While they go on to conduct structural analyses and predictions, we can build off of their early methods (sequence alignment, etc.) to visualize differences between Zaire ebolavirus (ZEBOV) and Reston ebolavirus (RESTV)
- Table 2 is particularly relevant for interpretation of our results 

Example published figure:
- https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4615121/ Supplementary figures S1-S3 (Cong et al., 2015)
- http://yulab-smu.top/ggmsa/ not a publication but tutorial ggmsa 


Dasets:
- Zaire ebolavirus (ZEBOV) proteome: https://www.uniprot.org/proteomes/UP000007209 
- Reston ebolavirus (RESTV) proteome: https://www.uniprot.org/taxonomy/386032 (individual protein sequences available)


Software:
- R (Version 2024.04.2+764)
    - msa package  
    - Biostrings package
    - ggseqlogo package
    - pheatmap package
    - ggplot package
    - ggtree package 
    - ggmsa 


Proposed Steps:
1. Sequence alignment of whole proteomes and individual proteins of ZEBOV and RESTV in R 
2. Visualization - 
    a. Sequence alignment by amino acid (As in example published figure or similar) - msa package or heatmap with ggplot, ggseqlogo, pheatmap, ggmsa
    b. % amino acids changed in each protein as bar graph - ggplot 
    c. % amino acids changed that are likely to have an effect on pathogenicity - ggplot and take from Table 2 (Cong et al., 2015)
    d. Phylogenetic tree - ggtree
3. Expand alignment and visualization to include other members of the Ebolavirus genus: Sudan, Bundibugyo, Tai Forest, Bombali

   

Resources:
Aligning UniProt sequences how-to: https://rpubs.com/mbelambe/835032 
Using DECIPHER tool in R: https://bioconductor.org/packages/release/bioc/vignettes/DECIPHER/inst/doc/ArtOfAlignmentInR.pdf 
Using msa to generate figures in R: https://orchardnotes.wordpress.com/2022/03/28/msa-figures-in-r-let-me-save-you-some-time/ 
Great example figure: http://yulab-smu.top/ggmsa/ 
