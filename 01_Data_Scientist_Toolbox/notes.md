# (JHU Coursera) The Data Scientist's Toolbox Supporting Notes

Description: This is the summary notes Colin has been taken for the additional information regarding The Data Scientist's Toolbox setup.

Data Science Introduction & Data Type
----------
Data science helps to gather data to answer your designated question, and it can come from profession such as **Statistics**, **Computer Science**, **Mathematics**. But in order to have the **RIGHT data**, **cleaning and formatting data** is essential to ensure the data can reflect the actual situation. </br> 
</br> 

During the data formation, the 3 critical elements to characterize data is by the following: </br>
</br> 

* Data Volume → Volume of data is increasing available due to the improvement of storage method and capacity </br>
* Data Velocity → Data generated at a rapid rate from either process records, transaction records and the data can be immediately recorded and uploaded. </br>
* Data Variety → Data’s format has a wide variety whether it’s continuous data or categorical data, and it can applied with respect to different aspect. </br>

</br> 
Data can be expressed as a set of values of quantitative or qualitative variables is listed below: </br>
</br> 

Data Type | Definition
--- | ---
Set | a population individual tries to discover the correlation
Variable | a population individual tries to discover the correlation
Quantitative | Measurements or information which is **numerical and continuous**
Qualitative | Measurements or information which is **categorical**.
</br> 


R - Packages
----------
In general, R package is stored in the R database’s library. It represents the function of the designated requirement. And generally, the packages are stored in the repositories.</br>
</br> 

The main repositories are CRAN (Comprehensive R Archive Network), BioConductor and GitHub, and please refer to the following table for the repositories’ description. </br>
</br> 


Functions | CRAN | BioConductor | GitHub
--- | --- | --- | ---
Features | R's main repository (>12,000 packages available) | Repository mainly for bioinformatic industries | Popular open source repository (non R related as well)
</br> 


And please refer to the respective installation package steps.</br> 
</br> 

* CRAN </br>

  **install.packages**(*"package_name"*) → For single package </br> 
  **install.packages**(*c("package_1","package_2")*) → For multiple packages </br> 

* BioConductor </br>

  Step 1 → source(**"https://bioconductor.org/biocLite.R"**) </br> 
  Step 2 → use **biocLite**(*"package_name"*) </br> 

* GitHub </br>

  Step 1 → **install.packages**(*"devtools"*) </br> 
  Step 2 → **library**(*"devtools"*) </br> 
  Step 3 → **install_github**(*"GitHub_User/package"*) </br> 

Lastly, the following commands will summarize the package operations in R-console or RStudio.</br> 


Function | Load Installed Packages | Check Installed Packages | Update Packages | Unload Packages | Uninstall Packages | Version Check | Help Check
--- | --- | --- | --- | --- | --- | --- | ---
Command | **library**(*package_name*) | **installed.packages**() | **old.packages**() | **detach**() | **remove.packages**(*package_name*) | **version** | **help**()
Additional Command | --- | --- | **update.packages**() | **detach**(*"package_name" , unload=TRUE*) | --- | **sessionInfo**() | **help**(*"package = package_name"*)
Additional Command | --- | --- | **installed.packages**(*package_name*) | --- | --- | --- | ---
</br> 

 
Version Control
----------
Version control tracks and records changes within the code while making edits, it allows individual coders to go back to previous changes and take snapshots of individual profiles. Version control is beneficial for individuals to sort and trace the history of files while understand the respective changes in different versions. </br>
</br> 

Besides the individual coders, when doing the programming between cross function team. Version control is also essential for the group members to verify the version history while making changes without corrupt the existing changes from other team members. </br>
</br> 

Currently, Git is one of the most popular version control system since it’s a free open source. In this learning experience, GitHub is one of the most common online interface to store the files with version history control. </br>
</br> 

In version control, the following terminology will be commonly used  </br>
</br> 

Phrase | Definition 
--- | --- 
Repository | Equivalent to project’s folder/directory – all the version controlled files are located in a repository (a.k.a REPO). Repositories are what are hosted on GitHub and throughout this interface individual users can keep repo private or public. 
Commit | Save the edits and changes made. Commit is similar to a snapshot of the files. Git compares the previous version of all individual files in the repo with respect to current version while identifies the changes since then. The ones which have no changes will be maintained that previously stored file. </br> When making a change, also make a note associated with the commit to justify why this change was made. This is the good way to trace when there’s a mistake within the old historical files and identify in the quickest way
Push | Updating the repository with your edits, and since git involves making changes locally. Therefore it’s essential to push the committed changes to that repository online for public to access your edits.  
Pull | Update the local version of repository to current version since others have edited in the meantime. Since the shared repository is hosted online and if there are any other different contributors (or even when yourself is using a different device) could make changes to the file and pushed into the shared repository. Therefore pulling helps to update the local device with main repository. 
</br> 


As for the version control’s analogy, the following vocabularies are also heard in the common field when revising changes simultaneously across shared repositories or local computers.</br>

Phrase | Definition 
--- | --- 
Staging | This is to propose a change to commit, it can have separate commits to file for the change. In general, individuals pull the repository’s content so local copy is stored and edible. Once the changes are made, **staging** the file before **commit** the respective change. The commits will be **pushing** into the **repository** 
Branch |The files are branched when there are 2 simultaneous copies (usually one in the repositories while the other is stored locally. In order to summarize it, staging the local changes before committing to the shared repositories is essential to prevent separate branching.
Merge | This action is to merge all made commits from separate files into one file., but this could potentially cause a CONFLICT due to the two file’s changes are different when cross-verifying.
Conflict | If multiple make changes in the same file, and Git is unable to merge. The solution is to manually merge edits or overwrite codes
Clone | Make a copy of an existing Git repository, this helps to track the project’s version control while making local edits along with tracked changes.
Fork | Personal copy of a repository which are taken from another resources. And when making changes, the edits are logged on YOUR repository, not the original owners.
</br> 
