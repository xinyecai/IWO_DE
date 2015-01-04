function [ParGen, ObjVals,outcome,FFEerror] = ...
    main( nmbOfIndivs, Fct,Cons,A,minf)

% create initial (parent) generation
ParGen = ParentGen( nmbOfIndivs, Cons);
% evaluate initial generation
ObjVals = Evaluate( ParGen,Fct,A);
breakflag=1;
FFEerror=0;
outcome=[];
Pmax=50;
FFE=size(ObjVals,2);
maxFFE=500000;
i=1;
while FFE<=maxFFE
    index=find(ObjVals(2,:)==0);
    if ~isempty(index)
        feasibleObjTemp=ObjVals(1,index);
        f=min(feasibleObjTemp);
        if abs(f-minf)<0.0001&&breakflag==1
            FFEerror=FFE;
            breakflag=breakflag+1;
        end
        outcome=[outcome [f; FFE]];
    end
    %   fprintf( 'generation %d\n', i);
    offspring=ChildGens(ParGen,ObjVals,Cons);
    offspring=mutation(offspring,Cons);
    offspringObj=Evaluate( offspring,Fct,A);
    ParGen=[ParGen offspring];
    ObjVals=[ObjVals offspringObj];
    FFE=FFE+size(offspringObj,2);
    nmbOfIndivs=size(ObjVals,2);
    if nmbOfIndivs>Pmax
        [ParGen ObjVals]=select(ParGen,ObjVals);
    end
    NP=size(ObjVals,2);
    for j=1:NP
        index3=find(ObjVals(2,:)==0);
        index4=find(ObjVals(2,:)~=0);
        feasibleObj=ObjVals(:,index3);
        feasiblePar=ParGen(:,index3);
        infeasibleObj=ObjVals(:,index4);
        infeasiblePar=ParGen(:,index4);
        archivePar=[];
        archiveObj=[];
        X = ParGen(:, j);
        ObjX = ObjVals(:, j);
%         globalF = 0.5+0.2.*rand;
         globalF = 0.7;
        globalCR=0.9+0.1.*rand;
        U = DE(ParGen, Cons, j, X, globalF, globalCR);
        ObjU = Evaluate(U,Fct,A);
        if ObjU(2,1)==0
            if isempty(index3)
                archivePar=[archivePar U];
                archiveObj=[archiveObj ObjU];
            else
                if ~ismember(1,(feasibleObj(1,:)<ObjU(1,1)))
                    a=find(feasibleObj(1,:)==max(feasibleObj(1,:)));
                    feasiblePar(:,a(1))=U;
                    feasibleObj(:,a(1))=ObjU;
                end
            end
        elseif ObjU(2,1)~=0
            if isempty(index4)
                archivePar=[archivePar U];
                archiveObj=[archiveObj ObjU];
            else
                if ~ismember(1,(infeasibleObj(1,:)<=ObjU(1,1)&infeasibleObj(2,:)<=ObjU(2,1))&...
                        (infeasibleObj(1,:)<ObjU(1,1)|infeasibleObj(2,:)<ObjU(2,1)))
                    Ranking=nondominatedRank(infeasiblePar,infeasibleObj);
                    index5=find(Ranking==max(Ranking));
                    if ObjU(2,1)<infeasibleObj(2,index5)
                        infeasiblePar(:,index5)=U;
                        infeasibleObj(:,index5)=ObjU;
                    end
                end
            end
        end
        ParGen(:,index3)=feasiblePar;
        ParGen(:,index4)=infeasiblePar;
        ObjVals(:,index3)=feasibleObj;
        ObjVals(:,index4)=infeasibleObj;
        if ~isempty(archivePar)
            ParGen=[ParGen archivePar];
            ObjVals=[ObjVals archiveObj];
        end
    end
    FFE=FFE+NP;
    i=i+1;
end
end



