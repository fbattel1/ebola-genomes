# EBOLA PROTEOMICS

### Title: 
#### Comparative proteomics of lethal and non-pathogenic Ebolavirus species envelope glycoprotein 

### Description & Published Reference
The viral genus Ebolavirus contains six different species, nearly all of which are highly lethal in humans. The species Zaire ebolavirus has caused multiple outbreaks and has a fatality rate up to 90%. Its close relative, Reston ebolavirus, is the only Ebolavirus species to infect humans without causing disease.  We would like to compare the protein sequences of Reston ebolavirus and Zaire ebolavirus envelope glycoproteins to understand differences that may contribute to pathogenicity. 

**A Critical Domain of Ebolavirus Envelope Glycoprotein Determines Glycoform and Infectivity** by Fujihira et al, 2018 (https://www.nature.com/articles/s41598-018-23357-8) identifies a small stretch of surface glycoprotein amino acids (amino acids 33-50) that play a significant role in the glycoprotein's ability to infect cells in vitro. They found differences in this stretch between Zaire ebolavirus and Reston ebolavirus, and found that Reston ebolavirus became more infectious when this stretch of it's glycoprotein was replaced with that of Zaire ebolavirus. 

We chose to recapitulate this seqeuence alignment and analyze the amino acid differences. 

**Example figures:**
- https://omarwagih.github.io/ggseqlogo/ 
- http://yulab-smu.top/ggmsa/ 



### Dasets:
- Zaire ebolavirus (ZEBOV) envelope GP: https://www.uniprot.org/uniprotkb/Q05320/entry *Amino acids 30-60*
- Reston ebolavirus (RESTV) envelope GP: https://www.uniprot.org/uniprotkb/Q66799/entry *Amino acids 30-60*


### Software:
- R (Version 2024.04.2+764)
    - msa package  
    - Biostrings package
    - ggseqlogo package*
    - pheatmap package
    - ggplot package
    - ggtree package 
    - ggmsa * 


### Proposed Steps:
1. Sequence alignment of envelope glycoprotein and individual proteins of ZEBOV and RESTV in R (for check-in #1)
2. Visualization - (for check-in #2)
    a. Sequence alignment by amino acid (As in example published figure or similar) - msa package or heatmap with ggplot, ggseqlogo, pheatmap, ggmsa
    b. % amino acids changed in each protein as bar graph - ggplot 
    c. % amino acids changed that are likely to have an effect on pathogenicity - ggplot and take from Table 2 (Cong et al., 2015)
    d. Phylogenetic tree - ggtree
3. Expand alignment and visualization to include other members of the Ebolavirus genus: Sudan, Bundibugyo, Tai Forest, Bombali (stretch goal!)



### Resources:
Aligning UniProt sequences how-to: https://rpubs.com/mbelambe/835032 
Using DECIPHER tool in R: https://bioconductor.org/packages/release/bioc/vignettes/DECIPHER/inst/doc/ArtOfAlignmentInR.pdf 
Using msa to generate figures in R: https://orchardnotes.wordpress.com/2022/03/28/msa-figures-in-r-let-me-save-you-some-time/ 
Great example figure: http://yulab-smu.top/ggmsa/ 
Another paper that compares Ebolavirus species proteomes: Cong et al., 2015 Table 2 https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4615121/