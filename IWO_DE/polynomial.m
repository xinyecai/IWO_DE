function MIndivs= polynomial( Indivs, Cons,etaM,pM,f)

[nmbOfVars nmbOfIndivs] = size( Indivs);
Neg=Indivs-repmat(Cons(:,1),1,nmbOfIndivs);
Pos=repmat(Cons(:,2),1,nmbOfIndivs)-Indivs;
U = rand( size( Indivs));
Dir=U<0.5;
DeltaNeg = (2 * U(Dir)).^(1/(etaM + 1)) - 1;
DeltaPos = 1 - (2 * (1 - U(~Dir))).^(1/(etaM + 1));
Delta = zeros( size( Indivs));
Delta( Dir) = DeltaNeg;
Delta( ~Dir) = DeltaPos;
M = randperm( prod( size( Indivs)));
M = M( 1:ceil( pM * length( M)));
MIndivs = Indivs;
if etaM==1
    maxM=(Cons(:,2)-Cons(:,1))*ones(1,nmbOfIndivs);
else
%     maxMtemp=zeros(size(Indivs));
%     maxMtemp(Dir)=Neg(Dir);
%     maxMtemp(~Dir)=Pos(~Dir);
    maxMtemp=(Cons(:,2)-Cons(:,1))*ones(1,nmbOfIndivs);
    maxM=(f+1e-04).*maxMtemp;
%     maxM=maxMtemp;
end
MIndivs(M) = Indivs(M) +maxM(M).* Delta(M);

C=repmat( Cons( :, 2), 1, nmbOfIndivs);
D=repmat( Cons( :, 1), 1, nmbOfIndivs);
foo =  C- MIndivs;
bar = MIndivs -D;
A=bar<0;
while ismember(1,A)
    MIndivs(A)=D(A)+(abs(bar(A))./2);
    bar=MIndivs-D;
    A=bar<0;
end
B=foo<0;
while ismember(1,B)
    MIndivs(B)=C(B)-(abs(foo(B))./2);
    foo=C-MIndivs;
    B=foo<0;
end