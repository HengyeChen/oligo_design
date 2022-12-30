function [c,ia,ic]=uniquecrows(carray)

idxes=[];
for i=1:size(carray,2)
    [~,~,ic1]=unique(carray(:,i));
    idxes=[idxes,ic1];    
end
[~,ia,ic]=unique(idxes,'rows','stable');
c=carray(ia,:);

