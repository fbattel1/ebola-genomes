# Comparative proteomics of lethal and non-pathogenic Ebolavirus species envelope glycoproteins 

### Description & Published Reference:
The viral genus Ebolavirus contains six different species, nearly all of which are highly lethal in humans. The species Zaire ebolavirus is the most lethal and has caused multiple outbreaks with a fatality rate up to 90%. Its close relative, Reston ebolavirus, is the only Ebolavirus species to infect humans without causing disease. It is not known to cause any symptoms, either. The cause of such a stark difference in pathogenicity between these two viruses is still under investigation. We would like to compare the protein sequences of Reston ebolavirus and Zaire ebolavirus envelope glycoproteins to understand differences that may contribute to pathogenicity. 

**A Critical Domain of Ebolavirus Envelope Glycoprotein Determines Glycoform and Infectivity** by Fujihira et al, 2018 (https://www.nature.com/articles/s41598-018-23357-8) identifies a small stretch of surface glycoprotein amino acids (amino acids 33-50) that play a significant role in the glycoprotein's ability to infect cells in vitro. They found differences in this stretch between Zaire ebolavirus and Reston ebolavirus. Using an in vitro system and the glycoprotein's known receptor, they found that Reston ebolavirus became more infectious when this stretch of it's glycoprotein was replaced with that of Zaire ebolavirus. 

We chose to recapitulate this seqeuence alignment and analyze the amino acid differences. 

**Example figures:**
- https://omarwagih.github.io/ggseqlogo/ 
- http://yulab-smu.top/ggmsa/ 



### Dasets:
- Zaire ebolavirus (ZEBOV) envelope GP: https://www.uniprot.org/uniprotkb/Q05320/entry *Amino acids 30-60*
- Reston ebolavirus (RESTV) envelope GP: https://www.uniprot.org/uniprotkb/Q66799/entry *Amino acids 30-60*


### Software:
- R (Version 2024.04.2+764)
    - Biostrings_2.72.1
    - tidyverse_2.0.0
    - pwalign_1.0.0
    - ggthemes_5.1.0
    - ggplot2_3.5.1
    - dplyr_1.1.4 
    - ggmsa_1.10.0
    - ggseqlogo_0.2 



### Proposed Steps:
1. Sequence alignment of envelope glycoprotein and individual proteins of ZEBOV and RESTV in R (for check-in #1)
2. Visualization - (for check-in #2)
    a. Sequence alignment by amino acid (As in example published figure or similar) - msa package or heatmap with ggplot, ggseqlogo, pheatmap, ggmsa
    b. % amino acids changed in each protein as bar graph - ggplot 
    c. % amino acids changed that are likely to have an effect on pathogenicity - ggplot and take from Table 2 (Cong et al., 2015)
    d. Phylogenetic tree - ggtree
3. Expand alignment and visualization to include other members of the Ebolavirus genus: Sudan, Bundibugyo, Tai Forest, Bombali (stretch goal!)
 

### Workflow as of 11.22.24:
1. We sucessfully aligned the relevant amino acids from the two surface glycopropteins, from amino acids 30 through 60 which overlap with those of interest, 33 through 50. We did not observe any alignment discrepancies or gaps, but the alignment package is equipped to handle and visualize this. This code can be found in /Scripts/GP_anlaysis_V3.Rmd
2. We successfully visualized the alignment sequence in two different ways, using ggmsa and ggseqlogo. These figures can be found in /Figures as gmsa_GP_alignment.png and ggseqlogo_GP_alignment.png 
3. Instead of expanding our alignment to the full GP sequences, to other members of the Ebolavirus genus, or to other hemorrhagic fevers, as we initially proposed (and as suggested by a few peer reviewers), we chose instead to dig deeper into the nature of the specific amino acid changes in the 33-55 amino acid stretch of Zaire ebolavirus and Reston ebolavirus GPs. 
4. **Our next goal is, at the suggestion of a peer reviewer, is to identify and highlight key sites in the amino acid alignment stretch that represent important changes with biological consequences. We aim to have this complete for check-in #2** 


### Repository Organization:
Docs
- checkin-11.1.24.MD = check-in #1 
- checkin-11.22.24.MD = check-in #2 

Figures
- ggmsa_GP_alignment.png = our ggmsa alignment
- ggseqlogo_GP_alignment.png = our ggseqlogo alignment 

Old
- GP_analysis_V1.R = alignment of full GP sequences before narrowing down project focus
- GP_analysis_V2.R = alignment and visualization of partial GP sequences before moving to R notebook 
- alignment_GP.png = console output of alignment as a test
- ebola_reston_GP.txt = full length Reston GP protein sequence
- ebola_zaire_GP.txt = full length Zaire GP protein sequence 

Raw data
- rgp_30_60.txt = 30 amino acid sequence spanning region of interest for Reston ebolavirus
- zgp_30_60.txt = 30 amino acid sequence spanning region of interest for Zaire ebolavirus

Scripts
- GP_anlaysis_V3.Rmd = R notebook of our full script so far, including alignment, visualization, and analysis 
- GP_anlaysis_V3.html = associated html


### Resources:
Aligning UniProt sequences how-to: https://rpubs.com/mbelambe/835032 
Using DECIPHER tool in R: https://bioconductor.org/packages/release/bioc/vignettes/DECIPHER/inst/doc/ArtOfAlignmentInR.pdf 
Using msa to generate figures in R: https://orchardnotes.wordpress.com/2022/03/28/msa-figures-in-r-let-me-save-you-some-time/ 
Great example figure: http://yulab-smu.top/ggmsa/ 
Another paper that compares Ebolavirus species proteomes: Cong et al., 2015 Table 2 https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4615121/