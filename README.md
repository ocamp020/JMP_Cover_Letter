# JMP_Cover_Letter
This repository contains files to replicate a cover letter template with the names of different institutions.

The objective is to take a cover letter template (Cover_Template.tex) and generate multiple pdf files with the information of institutions and positions to which one wants to apply. Each pdf file is named according to and institution/position. 

The list of cover letters is specified in "Job_Postings.csv". The CSV file has three columns: Name of institution, name of department, name of position. Each row describes the job posting corresponding to an individual cover letter.
  Important: Make sure there are no spaces before or after the names.

Optional: 
  1) Add signature to your cover letter. You can dispense of this by commenting line 144 in "Cover_Template.tex"
  2) Save cover letters in separate folders. This is useful if further editing (or tailoring) of the cover letter is required. To use this set the "Separate_Folder" flag in "Cover_Letters.m" to "true" and add the folder name as a fourth entry in "Job_Postings.csv'. Make sure the folder name starts with a letter and has no spaces. 

The program "Cover_Letters.m" runs in Matlab. It takes two inputs:

  1) Cover_Template.tex
  2) Job_Postings.csv

The output is a set of pdf files.


Sergio Ocampo and Dominic Smith
