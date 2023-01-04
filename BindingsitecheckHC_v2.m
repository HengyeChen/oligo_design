function [all_mat,final_seq] = BindingsitecheckHC_v2(oligo_file,bkg_file,PWM_folder,cutoffFile,result_file,output_seqs)
dbstop if error
all_PWM = gather_PWM_info(PWM_folder, cutoffFile);
oligo_seq = readlines(oligo_file);
trim_seq = cell(length(oligo_seq),1);
bkg_seq = char(readlines(bkg_file));
%two zero matrix were generated, and the zeros will be replaced by the
%number of each factor that is found in each oligo
All_TF = fieldnames(all_PWM);
num_matrix_f = zeros(length(oligo_seq),length(All_TF));
num_matrix_r = zeros(length(oligo_seq),length(All_TF));
num_matrix = zeros(length(oligo_seq),length(All_TF));
bkg_mat = zeros(1,length(All_TF));
% list = {'ABF1'; 'CBF1'; 'MCM1'; 'ORC1'; 'RAP1'; 'REB1'; 'ASG1'; 'AZF1';'BAS1';'ECM22';'INO4';'LEU3';'RFX1';'RGM1';...
%     'RGT1';'RSC3';'SFP1';'STB4';'STB5';'STP1';'STP2';'SUM1';'SUT1';'TBF1';'TBS1';'TEA1';'UGA3';'UME6';'URC2'}';
% index = cell(1,length(All_TF));
for j=1:numel(All_TF)
    PWM = all_PWM.(char(All_TF(j))).matrix;
    cutoff = all_PWM.(char(All_TF(j))).cutoff;
    [hit_seq1, hit_index1, score1]=BSscore(bkg_seq, PWM, cutoff);   
    [hit_seq2, hit_index2, score2]=BSscore(bkg_seq, PWM, cutoff);  
    bkg_mat(1,j) = length(hit_index1)+length(hit_index2);
%     hit_idx = [hit_index1,length(oligo)-flip(hit_index2)];
%     if ~isempty(hit_idx)
%         index(1,i) = {hit_idx};
%     end
end
for a = 1:length(oligo_seq)% a is the index of oligo
    oligo = char(oligo_seq(a,:));
    oligoR = seqrcomplement(oligo);
    for i=1:numel(All_TF)
        PWM = all_PWM.(char(All_TF(i))).matrix;
        cutoff = all_PWM.(char(All_TF(i))).cutoff;
        [hit_seq1, hit_index1, score1]=BSscore(oligo, PWM, cutoff);
        
        [hit_seq2, hit_index2, score2]=BSscore(oligoR, PWM, cutoff);
        
        num_matrix_f(a,i) = length(hit_index1);
        num_matrix_r(a,i) = length(hit_index2);
        num_matrix(a,i) = num_matrix_f(a,i) + num_matrix_r(a,i);
        hit_idx = [hit_index1,length(oligo)-flip(hit_index2)];
%         if ~isempty(hit_idx)
%             index(a,i) = {hit_idx};
%         end
    end
    if (sum((num_matrix(a,:)-bkg_mat)>0)) <= 1
        trim_seq(a,1) = {oligo};
    end
end
final_seq = trim_seq(~cellfun('isempty',trim_seq));
all_mat.f = num_matrix_f;
all_mat.r = num_matrix_r;
save(result_file,'all_mat');
writecell(final_seq,output_seqs);
end
