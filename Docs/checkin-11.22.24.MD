# QB 2024 Project Check-In #2 11.22.24 

### Addressing prior feedback
To address Mike's feedback, we 
- Organized our repo with new folders 
- Updated README.MD to include software versions and an explanation of our repo setup
- Began performing analyses to make sense of the differences we see. 

To address our peer reviewers, we 
- Added answers to all of their questions to the background section of our README
- 


### New progress
We made significant updates by incorporating feedback, as above.

We also ... 


### Project organization
- Our repo has been updated and organized as stated above 
- We reached our goal for check-in #2 
- Our next step is to 


### Struggles we've encountered 

It took a bit of work to reorganize our github repo, I'm not sure we learned how to move things around. 

What would be the purpose of a conda environment if we're running things through RStudio and not on our terminal? 




## -------------------------------- ##
Feedback from others

Mike feedback to implement:
It's definitely time to move past alignment and start describing what you're seeing (graphs, statistics)    and perform some analysis to make sense of the differences you're seeing.
Make folders for proper organization of repo 
Note what versions of packages and software you are using. The easiest ways to do this are by either creating a conda environment

Peer review questions 
- How can one strain be hemorrhagic and the other not? 
- You are focusing on the glycoprotein which is involved in host cell interaction, are the receptors for entry into host cells known for either strain?
- What is the difference between your V1 and V2 scripts?
- Did you choose Zaire ebolavirus because it has the highest sequence homology with Reston ebolavirus? 
- Does it (Ebola Reston) present any symptoms at all?
- You mentioned that Zaire ebolavirus has caused multiple outbreaks and has a fatality rate up to 90%—is it considered the most pathogenic/lethal ebolavirus? 
- How do you plan to handle alignment discrepancies or gaps? For example, if insertions or deletions occur in the glycoproteins, how will you account for 
    these when visualizing alignments or calculating the percentage of amino acids that differ?
- 


Peer review suggestions 
- it would be interesting to also compare another hemorrhagic strain and see if there are similar hits between the two, 
    this could add increased significance since its is almost and n of 2 then.
- Would it be too difficult to tile across the full amino acid sequence in manageable chunks to produce many figures like 
    the ones you've already made? You could look at them and determine which have the most compelling differences and then 
    add in additional viruses if you are interested in doing so. I imagine this would mostly involve reusing code you already 
    have with small changes to look at different sequences of interest.
- It might be helpful to create a text file or another markdown to explain the workflow (e.g., the difference between scripts 
    V1 vs V2 and when to use them) to help with reproducibility
- Create separate folders 
- I think it would be really cool if you guys could find a way to highlight key sites. For example, in sequence alignments or 
    sequence logos, emphasize amino acids previously implicated in pathogenicity to guide interpretation.