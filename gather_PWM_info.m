function all_PWM = gather_PWM_info(PWM_folder,cutoffFile)
files=dir(PWM_folder);
files(1:2)=[];
all_PWM = struct;
[N,T]=xlsread(cutoffFile);

for i=1:length(files)   
    cell=readtxt(strcat(PWM_folder,'\',files(i).name),'\t');
    matrix=str2double(cell(:,3:(end-1)));
    factor=files(i).name(1:end-4);
    all_PWM.(factor).PFM=cell;
    all_PWM.(factor).matrix=matrix;
    ind = strmatch(factor, T(:,1), 'exact');
    all_PWM.(factor).cutoff = N(ind,1);
    [m index]=max(matrix);
    all_PWM.(factor).best_motif=int2nt(index);
    % mutate the highest scored base
    [a,ind1] = max(m);
    [mut1,mut1ind] = min(matrix(:,ind1));
    m(ind1) = mut1;
    index(ind1) = mut1ind;
    all_PWM.(factor).mut1=int2nt(index);
    % mutate the second highest scored base
    [a,ind2] = max(m);
    [mut2,mut2ind] = min(matrix(:,ind2));
    m(ind2) = mut2;
    index(ind2) = mut2ind;
    all_PWM.(factor).mut2=int2nt(index);
end