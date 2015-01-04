function seedChildGen = ChildGens(ParGen,ObjVals,Cons)

Smin=0;
Smax=2;
[nmbOfVars nmbOfIndivs] = size( ParGen);
index1=find(ObjVals(2,:)==0);
feasiblePercent=length(index1)./nmbOfIndivs;
%%
objFun=ObjVals(1,:);
conVio=ObjVals(2,:);
minObj=min(objFun);
maxObj=max(objFun);
minCon=min(conVio);
maxCon=max(conVio);
newObj=sqrt(feasiblePercent.*((objFun-minObj)./((maxObj-minObj)+1e-30)).^2+(1-feasiblePercent).*((conVio-minCon)./((maxCon-minCon)+1e-30)).^2);
zzzzz=find(newObj>1);
if ~isempty(zzzzz)
    z=1;
end
Ranking=(newObj-min(newObj))./((max(newObj)-min(newObj))+1e-30);
%%
seeds=floor(Smin+(Smax-Smin).*(1-Ranking));
m=100;
seedChildGen=[];
for i=1:nmbOfIndivs
    l=seeds(i);
    offspring=polynomial( ParGen(:,i)*ones(1,l), Cons,m,1,Ranking(i));
    seedChildGen=[seedChildGen offspring];
end
end
