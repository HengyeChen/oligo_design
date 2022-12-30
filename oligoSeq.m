% this function take the background sequence (bckSeq), the factor binding
% sites (bsFinal), and the starting locations of the binding sites
% It replace the corresponding segment on the background seq with the
% binding sites.

function [seq,error,change,LocOut] = oligoSeq(bsFinal,Loc)%loc is a vector with beginning index of binding sites
global bckSeq;
global lowLimit;
global highLimit;

error = 0; change = 0;
seq = bckSeq;
LocOut = Loc;

if length(bsFinal)~=length(Loc) % # of binding site must match # of locations
    error = 1;
    return;
end

for i=1:length(Loc)
    bs = char(bsFinal(i));
    bs = strtrim(bs);
    %rightend(i) = Loc(i)+length(bs);
    rightend(i) = Loc(i)+length(bs)-1;
end

if min(Loc)<lowLimit+74 || max(rightend)>highLimit+74    %binding siet locatoin out the oligo range
    error = 2;
    return;
end

change = 0;
for i=1:length(Loc)
    bs = char(bsFinal(i));
    bs = strtrim(bs);
    if ~strcmp(bs,'*') % '*' means skipping -- no change of the sequence
        l0=0; 
        if i<length(Loc) %if not the last in locations
           l0 = Loc(i+1)-Loc(i); % l0: distance between the current binding site to the next
        end
        l = length(bs);    % l: length of the binding sites
        if l>l0 %if length of the binding site is larger than the distance
            for k=i:length(Loc)
                Loc(k)=Loc(k)+(k-i)*10;% add 10 bases in the interval
            end
        end
        for j=1:length(bs)%make changes to the background sequence
            if nt2int(bs(j))>=1 && nt2int(bs(j))<=4 %if the nucleotide is A, C, G or T (not N)
                if ~strcmp(seq(Loc(i)+j-1),bs(j)) % sequence in the binding site different from the original sequence.
                    seq(Loc(i)+j-1) = lower(bs(j)); 
                    change = change + 1;
                end
            end
        end
    end
end

LocOut = Loc;



