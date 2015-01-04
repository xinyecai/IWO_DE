function [ParGen ObjVals]=select(Par,Obj)
%%
Ranking=nondominatedRank(Par,Obj);
elite=find(Ranking<=50);
ParGen=Par(:,elite);
ObjVals=Obj(:,elite);