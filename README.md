# JMP_Cover_Letter
This repository contains files to replicate a cover letter template with the names of different institutions.

The objective is to take a cover letter template (Cover_Template.tex) and generate multiple pdf files with the information of institutions and positions to which one wants to apply. Each pdf file is named according to and institution/position. 

The list of cover letters is specified in "Job_Postings.csv". The CSV file has three columns: Name of institution, name of department, name of position. Each row describes the job posting corresponding to an individual cover letter. 

"Cover_Letters.m" reads "Job_Postings.csv" and produces individual pdf files for each row (job application), names of pdf files are adjusted if there are several applications to the same institution.  

The program "Cover_Letters.m" runs in Matlab. It takes two inputs:

  1) Cover_Template.tex
  2) Job_Postings.csv

The output is a set of pdf files.


Sergio Ocampo
