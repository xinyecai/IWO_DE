function U = DE(Indivs, Cons, i, X, F, CR)

[nmbOfVars nmbOfIndivs]=size(Indivs);
indexOfIndividual = 1 : nmbOfIndivs;
indexOfIndividual(i) = [];

temp = floor(rand * (nmbOfIndivs - 1)) + 1;
nouse(1) = indexOfIndividual(temp);
indexOfIndividual(temp) = [];

index = randperm( prod( size( indexOfIndividual)));
M = index( 1:2);
time=1;
while isequal(Indivs(:,indexOfIndividual(M(1))),Indivs(:,indexOfIndividual(M(2))))&&time<=20
    index = randperm( prod( size( indexOfIndividual)));
    M = index( 1:2);
    time=time+1;
end

V = Indivs(:,nouse(1)) + F .* (Indivs(:,indexOfIndividual(M(1))) - Indivs(:,indexOfIndividual(M(2))));
C=Cons( :, 2);
D=Cons( :, 1);
foo =  C-V;
bar = V -D;
A=bar<0;
while ismember(1,A)
    V(A)=D(A)+(abs(bar(A))./2);
    bar=V-D;
    A=bar<0;
end
B=foo<0;
while ismember(1,B)
    V(B)=C(B)-(abs(foo(B))./2);
    foo=C-V;
    B=foo<0;
end

jRand = floor(rand * nmbOfVars) + 1;
t = rand(nmbOfVars,1) < CR;
t(jRand,1) = 1;
t_ = 1 - t;

U = t .* V + t_ .* X;
