function MIndivs=mutation(ParGen,Cons) 
%%
[nmbOfVars nmbOfIndivs]=size(ParGen);
MIndivs=polynomial(ParGen, Cons, 1,(1./nmbOfVars),1);