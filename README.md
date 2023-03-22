# Design oligos
We designed programs to generate oligos with different TF motifs and remove oligos with unintended motifs.
The oligo design program is made by Chao Yan.

## input files
### Background sequence
The background sequence is in txt format and saved in "[bkg sequence (HO nuc-4).txt](https://github.com/HengyeChen/oligo_design/blob/main/design_info/bkg%20sequence%20(HO%20nuc-4).txt)".

### TF motif information
TF motif information are saved in "[list_for_oligo_design2.xlsx](https://github.com/HengyeChen/oligo_design/blob/main/design_info/list_for_oligo_design2.xlsx)".

### Position weight matrix (PWM)
PWMs are saved in folder "[Formatted_PWM](https://github.com/HengyeChen/oligo_design/tree/main/Formatted_PWM)".

### PWM score cutoff information
PWM score cutoff information is saved in "[recommended_cutoff.xlsx](https://github.com/HengyeChen/oligo_design/blob/main/recommended_cutoff.xlsx)".

## Oligo design
Add your folder to the MATLAB path
Run the command below to open OligoDesign3. 
> OligoDesign3;

Choose input files and select output folder in the program. You can change the motif number and position in the text box on the program panel.
This program replace the endogenous sequence in the background nucleosome sequence with target TF motifs. The output of this step is not the final oligos!

## Generate final oligo library and check motifs in oligo sequences
Run the command below to generate oligos, check motifs in oligos and remove oligos with unintended motifs.
> cd Yourfolder;%open the directory containing the sample files\
> oligo_file = 'oligos\oligo_example.txt';\
> bkg_file = 'design_info\bkg sequence (HO nuc-4).txt';\
> isBScheck = 1;\
> PWM_folder = 'Formatted_PWM';\
> cutoffFile = 'recommended_cutoff.xlsx';\
> oligo_region = [29,88];\
> PF = 'CTGCTAGGGAAGACACTGCG';\
> PR = 'CACGATCCGAAGACAGTTCC';\
> cutsite = 'GAAGAC';\
> result_file = 'oligos\oligo_motif_scan.mat';\
> output_seqs = 'oligos\oligo_filtered.txt';\
> [all_mat,final_seq] = OligoLib(oligo_file,bkg_file,isBScheck,PWM_folder,cutoffFile,oligo_region,PF,PR,cutsite,result_file,output_seqs);

OligoLib.m generates 100bp oligos, scans each oligo, and uses PWMs and cutoff file to determine the existence of each TF motif. oligos with unintended motifs will be removed.

## Examples of output files
### oligos and filtered oligos
Oligo sequences are saved in txt files "[oligo_example.txt](https://github.com/HengyeChen/oligo_design/blob/main/oligos/oligo_example.txt)" and "[oligo_filtered.txt](https://github.com/HengyeChen/oligo_design/blob/main/oligos/oligo_filtered.txt)"

### Motif information
Motif information for all oligos is saved in mat file "[oligo_motif_scan.mat](https://github.com/HengyeChen/oligo_design/blob/main/oligos/oligo_motif_scan.mat)";
In this file, each column represent a TF motif in the folder "[Formatted_PWM](https://github.com/HengyeChen/oligo_design/tree/main/Formatted_PWM)"(in alphabetical order).Each row represents an oligo in "[oligo_example.txt](https://github.com/HengyeChen/oligo_design/blob/main/oligos/oligo_example.txt)".










