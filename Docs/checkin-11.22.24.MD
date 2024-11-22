# QB 2024 Project Check-In #2 11.22.24 

### Addressing prior feedback
To address Mike's feedback, we 
- Organized our repo with new folders 
- Updated README.MD to include software versions and an explanation of our repo setup
- Began performing analyses to make sense of the differences we see

To address our peer reviewers, we 
- Added answers to their questions to the background and workflow sections of our README
- Incorporated feasible suggestions, including
    - A more straightforward way of representing the iterations of our code (we chose to use an R notebook)
    - Creating folders
    - Explaining our workflow in our README


### New progress
1. We spent a significant amount of time incorporating feedback, as detailed above, to make our repository, README, and scripts more understandable for reproducibility. 

2. We then created a substitution table of the amino acid changes that occurred.
- We found the frequency of each substitution and generated a bar plot showing the frequency of each change. 
- This can be found in /Figures as substitution_table.png
- We found that V --> I occurred most freqeuntly. We will interpret this and other data and recocnile them with the paper's findings to a greater extent in our final presentation.

3. We also wrote and executed code to determine the percent identity between the two sequences and found this to be **60%**. 

4. We wrote a block of code to analyze amino acid properties of the initial and changed amino acid. We looked at this for V --> I, which is the change that occurred most frequently between Zaire and Reston ebolavirus glyocproteins. Our results are as follows:
- From: V Properties: Neutral, Small, Hydrophobic 
- To: I Properties: Neutral, Large, Hydrophobic 
So, there may not be much impact on protein activity since the charge and hydrophobicity are the same.



### Project organization
- Our repo has been updated and organized as stated above 
- We reached our goal for check-in #2 

#### Next steps
1. Briefly explore the following tools to predict impact of amino acid substitution on protein function: SIFT, PolyPhen-2, PROVEAN for a handful of our substitutions 
OR
2. Get the block of code in #4 to run through all of our changes so we could get a list of initial and substituted properties, perhaps to show that most amino acids stayed the same in terms of charge but changed most based on size
OR
3. Move directly onto preparing our presentation 


### Struggles we've encountered 

It took a bit of work to reorganize our github repo, I think it would be helpful to teach future classes how to effectively create folders, remove files, and move files on github. 


**Questions**
Organizational
1. What would be the purpose of a conda environment if we're running things through RStudio and not on our terminal? Is it sufficient to write the software and package versions in our README? 
2. How do we get our R notebook to be embedded in our github so it shows with the nice interface as opposed to just code? 

Project
Which next step (or combination) seems the most reasonable to you in the time we have remaining? 




## -------------------------------- ##
**To do**
- Update notebook 
- Move past alignment and start describing what you're seeing (graphs, statistics) and perform some analysis to make sense of the differences you're seeing.
- Find a way to highlight key sites. For example, in sequence alignments or sequence logos, emphasize amino acids previously implicated in pathogenicity to guide interpretation.