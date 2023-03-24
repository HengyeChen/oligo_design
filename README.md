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

## Generate check motifs in oligo sequences
Run the command below to check motifs in oligos and remove oligos with unintended motifs.
> cd Yourfolder; % open the directory containing the sample files\
> oligo_file = 'oligos\oligo_example.txt'; % file containing oligo sequences\
> bkg_file = 'design_info\bkg sequence (HO nuc-4).txt'; % file containing background sequence\
> PWM_folder = 'Formatted_PWM'; % folder containing position weight matrixes of each TF\
> cutoffFile = 'recommended_cutoff.xlsx'; % file containing cutoff values for each PWM\
> result_file = 'oligos\oligo_motif_scan.mat'; % motif searching results for all oligos\
> output_seqs = 'oligos\oligo_filtered.txt'; % filtered oligos\
> [all_mat,filtered_seq] = BindingsitecheckHC_v2(oligo_file,bkg_file,PWM_folder,cutoffFile,result_file,output_seqs);


## Generate final oligo library
> cd Yourfolder; % open the directory containing the sample files\
> filtered_oligo_file = 'oligos\oligo_filtered.txt'; % file containing filtered oligo sequences generated by step e above.\
> oligo_region = [29,88]; % start and end index of the variable region\
> PF = 'CTGCTAGGGAAGACACTGCG'; % the sequence of the forward primer\
> PR = 'CACGATCCGAAGACAGTTCC'; % the sequence of the reverse primer\
> cutsite = 'GAAGAC'; % the cutting site of restriction enzyme, BbsI\
> final_seq_file = 'oligos\oligo_final.txt'; % final library sequences\
> final_seq = OligoLib(filtered_oligo_file,oligo_region,cutsite,PF,PR,final_seq_file);



OligoLib.m generates 100bp oligos, scans each oligo, and uses PWMs and cutoff file to determine the existence of each TF motif. oligos with unintended motifs will be removed.

## Examples of output files
### oligos and filtered oligos
Oligo sequences are saved in txt files "[oligo_example.txt](https://github.com/HengyeChen/oligo_design/blob/main/oligos/oligo_example.txt)", "[oligo_filtered.txt](https://github.com/HengyeChen/oligo_design/blob/main/oligos/oligo_filtered.txt)", and "[oligo_final.txt](https://github.com/HengyeChen/oligo_design/blob/main/oligos/oligo_final.txt)"

### Motif information
Motif information for all oligos is saved in mat file "[oligo_motif_scan.mat](https://github.com/HengyeChen/oligo_design/blob/main/oligos/oligo_motif_scan.mat)";
In this file, each column represent a TF motif in the folder "[Formatted_PWM](https://github.com/HengyeChen/oligo_design/tree/main/Formatted_PWM)"(in alphabetical order).Each row represents an oligo in "[oligo_example.txt](https://github.com/HengyeChen/oligo_design/blob/main/oligos/oligo_example.txt)".










