# QB 2024 Project Check-In #2 11.22.24 

### Addressing prior feedback
To address Mike's feedback, we 
- Organized our repo with new folders 
- Updated README.MD to include software versions and an explanation of our repo setup
- Began performing analyses to make sense of the differences we see between amino acid sequences 

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
    - We found that V --> I occurred most freqeuntly (twice)

3. We also wrote and executed code to determine the percent identity between the two sequences and found this to be **60%**. 

4. We wrote a block of code to analyze amino acid properties of the initial and changed amino acid. We looked at this for V --> I, which is the change that occurred most frequently between these sections of the Zaire and Reston ebolavirus glyocproteins. Our results are as follows:
    - From: V Properties: Neutral, Small, Hydrophobic 
    - To: I Properties: Neutral, Large, Hydrophobic 
    
    So, there may not be much impact on protein activity since the charge and hydrophobicity are the same.

Note that we have a very small number of amino acid changes, so statistical analysis is difficult. 


### Project organization
- Our repo has been updated and organized as stated above 
- We reached our goal for check-in #2 


### Next steps
1. Explore and then use one of the following online tools to predict the impact of the V --> I substitution on the glycoprotein: SIFT, PolyPhen-2, PROVEAN. We may also look at a few more changes if we find something interesting. 

2. Move onto preparing our presentation. The story would be as follows: we aligned specific sequences relevant to infection, found percent identity, and determined substitution frequency. Then we took the most frequent change and analyzed properties of the substitution, then used SIFT, PolyPhen-2, or PROVEAN to predict impact of the substitution. We will report the impact and synthesize it with literature findings. 


### Struggles we've encountered 

It took a bit of work to reorganize our github repo, I think it would be helpful to teach future classes how to effectively create folders, remove files, and move files on github. 


**Questions**
1. What would be the purpose of a conda environment if we're running things through RStudio and not on our terminal? Is it sufficient to write the software and package versions in our README? 
2. How do we get our R notebook to be embedded in our github so it shows with the nice interface as opposed to just code? 
