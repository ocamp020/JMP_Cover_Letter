% Cover Letters
% This script takes a list of institutions, departments and Position and 
% compiles individual PDF files with a cover letter for each application
% 
% Input:
% Cover_Letter_Template.tex
% Job_List.csv
%   - Make sure there are no spaces before or after the names
% 
% Output:
% PDFs with cover letter
%
% Sergio Ocampo, Nov 7th 2018

%% Name files
    
    CSV_File = 'Job_Postings.csv' ;
    Tex_File = 'Cover_Template.tex';
    PDF_File = 'Cover_Template.pdf';
    CSV_File_aux = 'addresses_1.csv' ; 
    
    % Note that the files can be located in different folders


%% Load institutions and job titles
    Data = readtable(CSV_File)  ; % Three columns: institution, department, position
    N    = size(Data,1)         ; % Number of jobs
    
%% Write individual cover letters

for i=1:N
    % Select row of Data
    data_aux = Data(i,:) ;
    
    % Write row of Data on aux file
    writetable(data_aux,CSV_File_aux)
    
    % Compile Tex
    % In Mac/Unix try:
        eval(['!/Library/TeX/texbin/pdflatex ',Tex_File,' &'])
    % In Windows try: 
        % [x,y]=system(['pdflatex ',Tex_File]);
    pause(5) %Pause to give the computer time to compile the file before renaminig it 
    
    % Title for PDF
    Institution = strrep(data_aux{1,1},' ','_') ; 
    Position    = strrep(data_aux{1,3},' ','_') ;
    PDF_Title = [Institution{1},'_',Position{1},'_Cover.pdf'];
        % Check if file already exists (if it does add an index) 
        j = 1;
        while exist(PDF_Title, 'file') == 2
            PDF_Title = [Institution{1},'_',Position{1},'_Cover_',num2str(j),'.pdf'];
            j = j+1 ;
        end 
    
    % Change PDF Name
    %eval(['!mv ',PDF_File,' ',PDF_Title,' &'])
    movefile(PDF_File,PDF_Title)
    pause(0.5)
    
    disp(['Cover Letter for ',Institution{1},' completed'])
end 

