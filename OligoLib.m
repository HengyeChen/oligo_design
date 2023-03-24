function final_seq = OligoLib(filtered_oligo_file,oligo_region,cutsite,PF,PR,final_seq_file)
dbstop if error
%oligo_file = 'C:\Users\bailab\Dropbox\Common\Sequence\yeast NDR\methylation test\barcode_design_v1.txt';
% PWM_folder = 'F:\Work\Hengye\NDR\ScerTF\Formatted_PWM_NDF';
% cutoffFile = 'F:\lbai_psu\Project_Genome-wide NDR\motif analysis\recommended_cutoff.xlsx';
% bkg_file = 'C:\Users\bailab\Dropbox\MATLAB\oligoDesign\design_info\bkg sequence (HO nuc-4).txt';

oligo_seq = readlines(filtered_oligo_file);
trim_seq = cell(length(oligo_seq),1);
for a = 1:length(oligo_seq)% a is the index of oligo
    oligo = char(oligo_seq(a,:));
    if isempty(oligo)
        continue
    end
    if (length(strfind(upper(oligo),upper(cutsite)))+length(strfind(upper(seqrcomplement(oligo)),upper(cutsite)))) ~= 0
        continue
    end    
    oligo = [PF oligo(oligo_region(1):oligo_region(2)) seqrcomplement(PR)];
    trim_seq(a,1) = {oligo};
end
final_seq = trim_seq(~cellfun('isempty',trim_seq));
writecell(final_seq,final_seq_file);
end
