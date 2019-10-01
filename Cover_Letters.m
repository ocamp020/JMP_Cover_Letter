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
% Sergio Ocampo, Oct 1st 2019

%% Name files
    
    CSV_File = 'Job_Postings.csv' ;
    Tex_File = 'Cover_Template.tex';
    PDF_File = 'Cover_Template.pdf';
    CSV_File_aux = 'addresses_1.csv' ; 
    
    % Note that the files can be located in different folders


%% Load institutions and job titles
    Data = readtable(CSV_File)  ; % Three columns: institution, department, position
    N    = size(Data,1)         ; % Number of jobs
    
%% Switch for separate folders
    % If Separate_Folders is set to "true" cover letters are saved in
    % separate folders containing a tex file for reproduction along with
    % the pdf. This is useful if further editing (or tailoring) of the
    % cover letter is required. 
    
    % Note: If this is done an additional entry to the CSV file is needed
    % providing the folder name. The name has to begin with a letter.
    
    
    Separate_Folders = false ; % Alternative value: true
    
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
    
    % Title for PDF (and Folder)
    Institution = strrep(data_aux{1,1},' ','_') ; 
    Position    = strrep(data_aux{1,3},' ','_') ;
    if Separate_Folders
        Folder    = strrep(data_aux{1,4},' ','_') ;
        PDF_Title = [Folder{1},'/',Institution{1},'_',Position{1},'_Cover.pdf'];
        % Create folder if it does not already exists 
        if exist(Folder{1},'dir') == 0 
            eval(['!mkdir ',Folder{1}]) 
        end
        % Move files to folder for editing 
        copyfile(CSV_File_aux,[Folder{1},'/',CSV_File_aux])
        copyfile(Tex_File,[Folder{1},'/',Tex_File])
        % Comment next line if you are not using a signature
        copyfile('Signature_File.png',[Folder{1},'/Signature_File.png'])
    else
        PDF_Title = [Institution{1},'_',Position{1},'_Cover.pdf'];
        % Check if file already exists (if it does add an index) 
        j = 1;
        while exist(PDF_Title, 'file') == 2
            PDF_Title = [Institution{1},'_',Position{1},'_Cover_',num2str(j),'.pdf'];
            j = j+1 ;
        end 
    end

    % Change PDF Name to PDF_Title (and move to folder if necessary)
    %eval(['!mv ',PDF_File,' ',PDF_Title,' &'])
    movefile(PDF_File,PDF_Title)
    pause(1)
    
    % Report success 
    disp(['Cover Letter for ',Institution{1},' completed'])
end 