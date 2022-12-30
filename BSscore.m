% given one sequence (seq) and one PWM, scan through the sequence to see whether
% there is a signigicant hit (pass cutoff).
% this program only consider one sequence direction

function [hit_seq, hit_index, score]=BSscore(seq, PMW, cutoff)

motifLength = size(PMW,2);
seqLength = length(seq);
hit_seq = ''; score = -100;

for i=1:seqLength-motifLength+1
    score(i)=0;
    seqUnit = nt2int(seq(i:i+motifLength-1)); %convert into 1-4: ACGT
    for j=1:motifLength
        if seqUnit(j)<=4
            score(i) = score(i) + PMW(seqUnit(j),j);
        else  % if there is N, take average of all 4 bases
            score(i) = score(i) + mean(PMW(:,j));
        end
    end
end

%round the index to the nearest two digit, and also use >=instead of>
score=round(score*100)/100;
hit_index = find(score>=cutoff);

if ~isempty(hit_index)
    for i=1:length(hit_index)
                hit_seq(i,:) = seq(hit_index(i):hit_index(i)+motifLength-1);
        end
    end
end