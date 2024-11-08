QB 2024 Project Check-In 11.1.24 (Updateed 11.7.24 at the bottom)
Addressing prior feedback
To start, we updated our README.MD to reflect our discussion with Mike to align just the envelope glycoprotein amino acid sequences of Ebola zaire and Ebola reston. We also included a png of a sample plot we'd like to make. 


New progress
Our goal for check-in #1 was to align the sequences, which we were successful in doing. We started by downloading the txt files from uniprot and loading them into R, where we did a pairwise alignment after installing the necessary packages. You can find our code in the GP_analysis_V1.R file.

We also took a screenshot of what the alignment returned in our console, a preliminary figure showing the pairwise alignment by amino acid along with the score. This is listed as "alignment_GP.png" in our repository. 

The pairwise alignment revealed a score of -15.80577, which means that there is high variation between the sequences we've aligned. It will be interesting to see what else we can glean through our visualizations. 


Project organization
Moving forward, we would like to visualize the alignment using one of the methods listed in our README. A long-term goal is to align the envelope glycoprotein sequences of the other ebola species and conduct multiple sequence alignment as opposed to pairwise alignment. See below. 


Struggles we've encountered 
We played around with a number of different plotting techniques/packages (ggseqlogo, ggmsa) but had a hard time visualizing the alignment well because the length of the amino acid sequences is so long, over 600 amino acids. We couldn't get a readable figure this way. 

We're thinking of either 
    - Finding a better way to visualize the data (ex. other packages)
    OR 
    - Choosing a smaller region (ex. 100 amino acids) of the protein to look at more deeply. 

Another option is to forego visualizing the sequence alignment and pull statistics out of our findings, like the number of amino acid differences, chemistry, etc. and make plots. 

Finally, as alluded to above, we could also align the sequences of other ebola species envelope glycoproteins which would allow us to use well-defined multiple sequence alignment visualization packages and could actually make it easier to make figures and view the data 

If you have any suggestions for which direction is best please let us know :) 


Update 11.7.24

We decided to pick a shorter stretch of amino acids in the glycoprotein to visualize as our next goal for check-in 1. 

We found a paper that identifies a small stretch of glycoprotein amino acids, from AA 33 to 50, that play a significant role in the glycoprotein's ability to infect cells in vitro. 

Here: https://www.nature.com/articles/s41598-018-23357-8 (Fujihira et al, 2018)

According to this paper, the sequences between ZEBOV and RESTV don't align very well. They also found that when they replaced these 18 amino acids in RESTV GP with those from ZEBOV GP, RESTV became more infectious. This suggests a role of this amino acid stretch in the differential infectivity of the two viruses. 

So, for our alignment, we decided to align amino acids 30 through 60. This spans the 33-50 region. 

We visualized this alignment two different ways, using ggmsa and ggseqlogo. 
They both show similar alignment in slighly different aesthetic formats. 
Ggseqlogo has the advantage of automaticaly color-coding AAs based on chemistry, with an included  legend. 

Both plots have been uploaded. 



