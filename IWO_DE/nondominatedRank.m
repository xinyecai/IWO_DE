function Ranking= nondominatedRank(Indivs,ObjVals)

[nmbOfVars nmbOfIndivs] = size( Indivs);
[nmbOfObjs value]=size(ObjVals);
NmbOfDominating = zeros( nmbOfIndivs, 1);
for p = 1:nmbOfIndivs
  NmbOfDominating(p)=length(find(((ObjVals(1,:)<=ObjVals(1,p)&ObjVals(2,:)<=ObjVals(2,p))&...
            (ObjVals(1,:)<ObjVals(1,p)|ObjVals(2,:)<ObjVals(2,p)))==1));
end
[foo SortIdx] = sortrows( [NmbOfDominating ObjVals(2,:)']);
Ranking = zeros( nmbOfIndivs, 1);
for i = 1:nmbOfIndivs
  Ranking( i) = find( SortIdx == i);
end