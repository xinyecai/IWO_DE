function ObjVals = Evaluate( Indivs,Fct,A)

[nmbOfVars nmbOfIndivs] = size( Indivs);
p=Indivs';
popsize=nmbOfIndivs;
ObjVals = zeros( 2, nmbOfIndivs);
delta=0.0001;
switch Fct
    %% Benchmark Problems
    case 'g01'
        g1 = 2 * Indivs(1,:) + 2 * Indivs(2,:) + Indivs(10,:) + Indivs(11,:) - 10;
        g2 = 2 * Indivs(1,:) + 2 * Indivs(3,:) + Indivs(10,:) + Indivs(12,:) - 10;
        g3 = 2 * Indivs(2,:) + 2 * Indivs(3,:) + Indivs(11,:) + Indivs(12,:) - 10;
        g4 = -8 * Indivs(1,:) + Indivs(10,:);
        g5 = -8 * Indivs(2,:) + Indivs(11,:);
        g6 = -8 * Indivs(3,:) + Indivs(12,:);
        g7 = -2 * Indivs(4,:) - Indivs(5,:) + Indivs(10,:);
        g8 = -2 * Indivs(6,:) - Indivs(7,:) + Indivs(11,:);
        g9 = -2 * Indivs(8,:) - Indivs(9,:) + Indivs(12,:);
        ObjVals(1,:) = 5 * sum(Indivs(1 : 4,:)) - 5 * sum(Indivs(1 : 4,:).^2)-sum(Indivs(5 : 13,:));
        ObjVals(2,:) = max(0, g1) + max(0, g2) + max(0, g3) + max(0, g4) + max(0, g5) + max(0, g6) + max(0, g7) + max(0, g8) + max(0, g9);
    case 'g02'
        g1 = 0.75 - prod(Indivs);
        g2 = sum(Indivs) - 7.5 * size(Indivs,1);
        ObjVals(1,:) = -abs(sum((cos(Indivs).^4)) - 2 * prod((cos(Indivs).^2)))./...
            (sqrt(sum(((ones(size(Indivs, 2), 1) * [1 : size(Indivs,1)])' .* (Indivs.^2)))) + 1e-17);
        ObjVals(2,:) = max(0, g1) + max(0, g2);
    case 'g03'
        g1 = abs(sum(Indivs.^2) - 1)- delta;
        ObjVals(1,:) = -(10.^0.5)^10 * prod(Indivs);
        ObjVals(2,:) = max(0, g1) ;
    case 'g04'
        g1 =  + 85.334407 + 0.0056858 * Indivs(2,:) .* Indivs(5,:) + 0.0006262 * Indivs(1,:) .* Indivs(4,:) - 0.0022053 * Indivs(3,:) .* Indivs(5,:) - 92;
        g2 = -85.334407 - 0.0056858 * Indivs(2,:) .* Indivs(5,:) - 0.0006262 * Indivs(1,:) .* Indivs(4,:) + 0.0022053 * Indivs(3,:) .* Indivs(5,:);
        g3 =  + 80.51249 + 0.0071317 * Indivs(2,:) .* Indivs(5,:) + 0.0029955 * Indivs(1,:) .* Indivs(2,:) + 0.0021813 * Indivs(3,:).^2 - 110;
        g4 = -80.51249 - 0.0071317 * Indivs(2,:) .* Indivs(5,:) - 0.0029955 * Indivs(1,:) .* Indivs(2,:) - 0.0021813 * Indivs(3,:).^2 + 90;
        g5 =  + 9.300961 + 0.0047026 * Indivs(3,:) .* Indivs(5,:) + 0.0012547 * Indivs(1,:) .* Indivs(3,:) + 0.0019085 * Indivs(3,:) .* Indivs(4,:) - 25;
        g6 = -9.300961 - 0.0047026 * Indivs(3,:) .* Indivs(5,:) - 0.0012547 * Indivs(1,:) .* Indivs(3,:) - 0.0019085 * Indivs(3,:) .* Indivs(4,:) + 20;
        ObjVals(1,:) = 5.3578547 * Indivs(3,:).^2 + 0.8356891 * Indivs(1,:) .* Indivs(5,:) + 37.293239 * Indivs(1,:) - 40792.141;
        ObjVals(2,:) = max(0, g1) + max(0, g2) + max(0, g3) + max(0, g4) + max(0, g5) + max(0, g6);
    case 'g05'
        g1 = -Indivs(4,:) + Indivs(3,:) - 0.55;
        g2 = -Indivs(3,:) + Indivs(4,:) - 0.55;
        g3 = abs(1000 * sin(-Indivs(3,:) - 0.25) + 1000 * sin(-Indivs(4,:) - 0.25) + 894.8 - Indivs(1,:)) - delta;
        g4 = abs(1000 * sin(Indivs(3,:) - 0.25) + 1000 * sin(Indivs(3,:) - Indivs(4,:)-0.25) + 894.8 - Indivs(2,:)) - delta;
        g5 = abs(1000 * sin(Indivs(4,:) - 0.25) + 1000 * sin(Indivs(4,:) - Indivs(3,:)-0.25) + 1294.8) - delta;
        ObjVals(1,:) = 3 * Indivs(1,:) + 0.000001 * Indivs(1,:).^3 + 2 * Indivs(2,:) + 0.000002/3 * Indivs(2,:).^3;
        ObjVals(2,:) = max(0, g1) + max(0, g2) + max(0, g3) + max(0, g4) + max(0, g5) ;
    case 'g06'
        g1 = -(Indivs(1,:) - 5).^2 - (Indivs(2,:) - 5).^2 + 100;
        g2 = (Indivs(1,:) - 6).^2 + (Indivs(2,:) - 5).^2-82.81;
        ObjVals(1,:) = (Indivs(1,:) - 10).^3 + (Indivs(2,:) - 20).^3;
        ObjVals(2,:) = max(0, g1) + max(0, g2);
    case 'g07'
        g1 = -105 + 4 * Indivs(1,:) + 5 * Indivs(2,:) - 3 * Indivs(7,:) + 9 * Indivs(8,:);
        g2 = 10 * Indivs(1,:)-8 * Indivs(2,:) - 17 * Indivs(7,:) + 2 * Indivs(8,:);
        g3 = -8 * Indivs(1,:) + 2 * Indivs(2,:) + 5 * Indivs(9,:)-2 * Indivs(10,:) - 12;
        g4 = 3 * (Indivs(1,:)-2).^2 + 4 * (Indivs(2,:)-3).^2 + 2 * Indivs(3,:).^2 - 7 * Indivs(4,:) -120;
        g5 = 5 * Indivs(1,:).^2 + 8 * Indivs(2,:) + (Indivs(3,:)-6).^2-2 * Indivs(4,:) - 40;
        g6 = Indivs(1,:).^2 + 2 * (Indivs(2,:) - 2).^2 - 2 * Indivs(1,:) .* Indivs(2,:) + 14 * Indivs(5,:) - 6 * Indivs(6,:);
        g7 = 0.5 * (Indivs(1,:) - 8).^2 + 2 * (Indivs(2,:) - 4).^2 + 3 * Indivs(5,:).^2 - Indivs(6,:) - 30;
        g8 = -3 * Indivs(1,:) + 6 * Indivs(2,:) + 12 * (Indivs(9,:) - 8).^2 - 7 * Indivs(10,:);
        ObjVals(1,:) = Indivs(1,:).^2 + Indivs(2,:).^2 + Indivs(1,:) .* Indivs(2,:) - 14 * Indivs(1,:) - 16 * Indivs(2,:) + (Indivs(3,:) - 10).^2 + 4 * (Indivs(4,:) - 5).^2 + (Indivs(5,:) - 3).^2 + 2 * (Indivs(6,:) - 1).^2 + 5 * Indivs(7,:).^2 + 7 * (Indivs(8,:) - 11).^2 + 2 * (Indivs(9,:) - 10).^2 + (Indivs(10,:) - 7).^2 + 45;
        ObjVals(2,:) = max(0, g1) + max(0, g2) + max(0, g3) + max(0, g4) + max(0, g5) + max(0, g6) + max(0, g7) + max(0, g8);
    case 'g08'
        g1 = Indivs(1,:).^2 - Indivs(2,:) + 1;
        g2 = 1 - Indivs(1,:) + (Indivs(2,:) - 4).^2;
        ObjVals(1,:) = -(sin(2 * pi * Indivs(1,:)).^3) .* sin(2 * pi * Indivs(2,:))./((Indivs(1,:).^3 .* (Indivs(1,:) + Indivs(2,:))) + 1e-17);%why add 1e-17???
        ObjVals(2,:) = max(0, g1) + max(0, g2);
    case 'g09'
        g1 = -127 + 2 * Indivs(1,:).^2 + 3 * Indivs(2,:).^4 + Indivs(3,:) + 4 * Indivs(4,:).^2 + 5 * Indivs(5,:);
        g2 = -282 + 7 * Indivs(1,:) + 3 * Indivs(2,:) + 10 * Indivs(3,:).^2 + Indivs(4,:) - Indivs(5,:);
        g3 = -196 + 23 * Indivs(1,:) + Indivs(2,:).^2 + 6 * Indivs(6,:).^2 - 8 * Indivs(7,:);
        g4 = 4 * Indivs(1,:).^2 + Indivs(2,:).^2 - 3 * Indivs(1,:) .* Indivs(2,:) + 2 * Indivs(3,:).^2 + 5 * Indivs(6,:) - 11 * Indivs(7,:);
        ObjVals(1,:) = (Indivs(1,:) - 10).^2 + 5 * (Indivs(2,:) - 12).^2 + Indivs(3,:).^4 + 3 * (Indivs(4,:) - 11).^2 + 10 * Indivs(5,:).^6 + 7 * Indivs(6,:).^2 + Indivs(7,:).^4 - 4 * Indivs(6,:) .* Indivs(7,:) - 10 * Indivs(6,:) - 8 * Indivs(7,:);
        ObjVals(2,:) = max(0, g1) + max(0, g2) + max(0, g3) + max(0, g4);
    case 'g10'
        g1 = -1 + 0.0025 * (Indivs(4,:) + Indivs(6,:));
        g2 = -1 + 0.0025 * (Indivs(5,:) + Indivs(7,:) - Indivs(4,:));
        g3 = -1 + 0.01 * (Indivs(8,:) - Indivs(5,:));
        g4 = -Indivs(1,:) .* Indivs(6,:) + 833.33252 * Indivs(4,:) + 100 * Indivs(1,:) - 83333.333;
        g5 = -Indivs(2,:) .* Indivs(7,:) + 1250 * Indivs(5,:) + Indivs(2,:) .* Indivs(4,:) - 1250 * Indivs(4,:);
        g6 = -Indivs(3,:) .* Indivs(8,:) + 1250000 + Indivs(3,:) .* Indivs(5,:) - 2500 * Indivs(5,:);
        ObjVals(1,:) = Indivs(1,:) + Indivs(2,:) + Indivs(3,:);
        ObjVals(2,:) = max(0, g1) + max(0, g2) + max(0, g3) + max(0, g4) + max(0, g5) + max(0, g6);
    case 'g11'
        g1 = abs(Indivs(2,:) - Indivs(1,:).^2) - delta;
        ObjVals(1,:) = Indivs(1,:).^2 + (Indivs(2,:) - 1).^2;
        ObjVals(2,:) = max(0, g1);
    case 'g12'
        nmbOfparameter=size(A,1);
        ObjVals(1,:) = -(100 - (Indivs(1, :) - 5).^2-(Indivs(2, :) - 5).^2 - (Indivs(3, :) - 5).^2)/100;
        for j = 1 : nmbOfIndivs
            ObjVals(2, j) = max(min(sum((repmat(Indivs(:, j)', nmbOfparameter,1) - A).^2, 2)) - 0.0625, 0);
        end
    case 'g13'
        g1 = abs(Indivs(1,:).^2 + Indivs(2,:).^2 + Indivs(3,:).^2 + Indivs(4,:).^2 + Indivs(5,:).^2 - 10) - delta;
        g2 = abs(Indivs(2,:) .* Indivs(3,:) - 5 * Indivs(4,:) .* Indivs(5,:))- delta;
        g3 = abs(Indivs(1,:).^3 + Indivs(2,:).^3 + 1)- delta;
        ObjVals(1,:) = exp(Indivs(1,:) .* Indivs(2,:) .* Indivs(3,:) .* Indivs(4,:) .* Indivs(5,:));
        ObjVals(2,:) = max(0, g1) + max(0, g2) + max(0, g3);
    case 'g14'
        c = [ -6.089 -17.164 -34.054 -5.914 -24.721 -14.986 -24.1 -10.708 -26.662 -22.179];
        g1 = abs(p(:, 1) + 2 * p(:, 2) + 2 * p(:, 3) + p(:, 6) + p(:, 10) - 2) - delta;
        g2 = abs(p(:, 4) + 2 * p(:, 5) + p(:, 6) + p(:, 7) - 1) - delta;
        g3 = abs(p(:, 3) + p(:, 7) + p(:, 8) + 2 * p(:, 9) + p(:, 10) - 1) - delta;
        f1 = sum(p .* (ones(popsize, 1) * c + log((p + 10^( - 30))./(10^( - 30) + sum(p, 2) * ones(1, 10)))), 2);
        f2 = max(0, g1) + max(0, g2) + max(0, g3);
        ObjVals(1,:)=f1';
        ObjVals(2,:)=f2';
    case 'g15'
        g1 = abs(p(:, 1).^2 + p(:, 2).^2 + p(:, 3).^2 - 25) - delta;
        g2 = abs(8 * p(:, 1) + 14 * p(:, 2) + 7 * p(:, 3) - 56) - delta;
        f1 = 1000 - p(:, 1).^2 - 2 * p(:, 2).^2 - p(:, 3).^2 - p(:, 1) .* p(:, 2) - p(:, 1) .* p(:, 3);
        f2 = max(0, g1) + max(0, g2);
        ObjVals(1,:)=f1';
        ObjVals(2,:)=f2';
    case 'g16'
        y1 = p(:, 2) + p(:, 3) + 41.6;
        c1 = 0.024 * p(:, 4) - 4.62;
        y2 = 12.5./c1 + 12;
        c2 = 0.0003535 * p(:, 1).^2 + 0.5311 * p(:, 1) + 0.08705 * y2 .* p(:, 1);
        c3 = 0.052 * p(:, 1) + 78 + 0.002377 * y2 .* p(:, 1);
        y3 = c2./c3;
        y4 = 19 * y3;
        c4 = 0.04782 * (p(:, 1) - y3) + 0.1956 * (p(:, 1) - y3).^2./p(:, 2) + 0.6376 * y4 + 1.594 * y3;
        c5 = 100 * p(:, 2);
        c6 = p(:, 1) - y3 - y4;
        c7 = 0.950 - c4./c5;
        y5 = c6 .* c7;
        y6 = p(:, 1) - y5 - y4 - y3;
        c8 = (y5 + y4) * 0.995;
        y7 = c8./y1;
        y8 = c8/3798;
        c9 = y7 - 0.0663 * y7./y8 - 0.3153;
        y9 = 96.82./c9 + 0.321 * y1;
        y10 = 1.29 * y5 + 1.258 * y4 + 2.29 * y3 + 1.71 * y6;
        y11 = 1.71 * p(:, 1) - 0.452 * y4 + 0.580 * y3;
        c10 = 12.3 / 752.3;
        c11 = 1.75 * y2 .* 0.995 .* p(:, 1);
        c12 = 0.995 * y10 + 1998.0;
        y12 = c10 * p(:, 1) + (c11./ c12);
        y13 = c12 - 1.75 * y2;
        y14 = 3623.0 + 64.4 * p(:, 2) + 58.4 * p(:, 3) + (146312.0./ (y9 + p(:, 5)));
        c13 = 0.995 * y10 + 60.8 * p(:, 2) + 48 * p(:, 4) - 0.1121 * y14 - 5095.0;
        y15 = y13./ c13;
        y16 = 148000.0 - 331000.0 * y15 + 40.0 * y13 - 61.0 .* y15 .* y13;
        c14 = 2324 * y10 - 28740000 * y2;
        y17 = 14130000 - 1328.0 * y10 - 531.0 * y11 + (c14./c12);
        c15 = (y13./y15) - (y13/ 0.52);
        c16 = 1.104 - 0.72 * y15;
        c17 = y9 + p(:, 5);

        g1 = 0.28/0.72 .* y5 - y4;
        g2 = p(:, 3) - 1.5 * p(:, 2);
        g3 = 3496 .* y2./c12 - 21;
        g4 = 110.6 + y1 - 62212./c17;
        g5 = 213.1 - y1;
        g6 = y1 - 405.23;
        g7 = 17.505 - y2;
        g8 = y2 - 1053.6667;
        g9 = 11.275 - y3;
        g10 = y3 - 35.03;
        g11 = 214.228 - y4;
        g12 = y4 - 665.585;
        g13 = 7.458 - y5;
        g14 = y5 - 584.463;
        g15 = 0.961 - y6;
        g16 = y6 - 265.916;
        g17 = 1.612 - y7;
        g18 = y7 - 7.046;
        g19 = 0.146 - y8;
        g20 = y8 - 0.222;
        g21 = 107.99 - y9;
        g22 = y9 - 273.366;
        g23 = 922.693 - y10;
        g24 = y10 - 1286.105;
        g25 = 926.832 - y11;
        g26 = y11 - 1444.046;
        g27 = 18.766 - y12;
        g28 = y12 - 537.141;
        g29 = 1072.163 - y13;
        g30 = y13 - 3247.039;
        g31 = 8961.448 - y14;
        g32 = y14 - 26844.086;
        g33 = 0.063 - y15;
        g34 = y15 - 0.386;
        g35 = 71084.33 - y16;
        g36 = - 140000 + y16;
        g37 = 2802713 - y17;
        g38 = y17 - 12146108;
        f1 = 0.000117 * y14 + 0.1365 + 0.00002358 * y13 + 0.000001502 * y16 + 0.0321 * y12 ...
            + 0.004324 * y5 + 0.0001 * (c15 ./ c16) + 37.48 * (y2./c12) - 0.0000005843 * y17;
        f2 = max(0, g1) + max(0, g2) + max(0, g3) + max(0, g4) + max(0, g5) + max(0, g6) + max(0, g7) + max(0, g8) + max(0, g9) + max(0, g10)...
            + max(0, g11) + max(0, g12) + max(0, g13) + max(0, g14) + max(0, g15) + max(0, g16) + max(0, g17) + max(0, g18) + max(0, g19)...
            + max(0, g20) + max(0, g21) + max(0, g22) + max(0, g23) + max(0, g24) + max(0, g25) + max(0, g26) + max(0, g27) + max(0, g28)...
            + max(0, g29) + max(0, g30) + max(0, g31) + max(0, g32) + max(0, g33) + max(0, g34) + max(0, g35) + max(0, g36) + max(0, g37) + max(0, g38);
        ObjVals(1,:)=f1';
        ObjVals(2,:)=f2';
    case 'g17'
        g1 = abs( - p(:, 1) + 300 - p(:, 3) .* p(:, 4)./131.078 .* cos(1.48477 - p(:, 6)) + 0.90798 .* p(:, 3).^2./131.078 .* cos(1.47588)) - delta;
        g2 = abs( - p(:, 2) - p(:, 3) .* p(:, 4)./131.078 .* cos(1.48477 + p(:, 6)) + 0.90798 .* p(:, 4).^2./131.078 .* cos(1.47588)) - delta;
        g3 = abs( - p(:, 5) - p(:, 3) .* p(:, 4)./131.078 .* sin(1.48477 + p(:, 6)) + 0.90798 .* p(:, 4).^2./131.078 .* sin(1.47588)) - delta;
        g4 = abs(200 - p(:, 3) .* p(:, 4)./131.078 .* sin(1.48477 - p(:, 6)) + 0.90798 .* p(:, 3).^2./131.078 .* sin(1.47588)) - delta;
        f1 = 30 .* p(:, 1) .* (p(:, 1) < 300) + 31 .* p(:, 1) .* (p(:, 1) >= 300) + 28 .* p(:, 2) .* (p(:, 2) < 100) + 29 .* p(:, 2) .* (p(:, 2) >= 100 & p(:, 2) < 200) + 30 .* p(:, 2) .* (p(:, 2) >= 200 & p(:, 2) < 1000);
        f2 = max(0, g1) + max(0, g2) + max(0, g3) + max(0, g4);
        ObjVals(1,:)=f1';
        ObjVals(2,:)=f2';
    case 'g18'
        g1 = p(:, 3).^2 + p(:, 4).^2 - 1;
        g2 = p(:, 9).^2 - 1;
        g3 = p(:, 5).^2 + p(:, 6).^2 - 1;
        g4 = p(:, 1).^2 + (p(:, 2) - p(:, 9)).^2 - 1;
        g5 = (p(:, 1) - p(:, 5)).^2 + (p(:, 2) - p(:, 6)).^2 - 1;
        g6 = (p(:, 1) - p(:, 7)).^2 + (p(:, 2) - p(:, 8)).^2 - 1;
        g7 = (p(:, 3) - p(:, 5)).^2 + (p(:, 4) - p(:, 6)).^2 - 1;
        g8 = (p(:, 3) - p(:, 7)).^2 + (p(:, 4) - p(:, 8)).^2 - 1;
        g9 = p(:, 7).^2 + (p(:, 8) - p(:, 9)).^2 - 1;
        g10 = p(:, 2) .* p(:, 3) - p(:, 1) .* p(:, 4);
        g11 = - p(:, 3) .* p(:, 9);
        g12 = p(:, 5) .* p(:, 9);
        g13 = p(:, 6) .* p(:, 7) - p(:, 5) .* p(:, 8);
        f1 = - 0.5 * (p(:, 1) .* p(:, 4) - p(:, 2) .* p(:, 3) + p(:, 3) .* p(:, 9) - p(:, 5) .* p(:, 9) + p(:, 5) .* p(:, 8) - p(:, 6) .* p(:, 7));
        f2 = max(0, g1) + max(0, g2) + max(0, g3) + max(0, g4) + max(0, g5) + max(0, g6) + max(0, g7) + max(0, g8) + max(0, g9) + max(0, g10)...
            + max(0, g11) + max(0, g12) + max(0, g13);
        ObjVals(1,:)=f1';
        ObjVals(2,:)=f2';
    case 'g19'
        a = [ -16 2 0 1 0;
            0 -2 0 0.4 2;
            -3.5 0 2 0 0;
            0 -2 0 -4 -1;
            0 -9 -2 1 -2.8;
            2 0 -4 0 0;
            -1 -1 -1 -1 -1;
            -1 -2 -3 -2 -1;
            1 2 3 4 5;
            1 1 1 1 1];
        b = [ -40 -2 -0.25 -4 -4 -1 -40 -60 5 1];
        c = [30 -20 -10 32 -10;
            -20 39 -6 -31 32;
            -10 -6 10 -6 -10;
            32 -31 -6 39 -20;
            -10 32 -10 -20 30];
        d = [4 8 10 6 2];
        e = [ -15 -27 -36 -18 -12];
        g1 = -2 * sum(ones(popsize, 1) * c(1:5, 1)' .* p(:, 11:15), 2) - 3 * d(1) .* p(:, 11).^2 - e(1) + sum(ones(popsize, 1) * a(1:10, 1)' .* p(:, 1:10), 2);
        g2 = -2 * sum(ones(popsize, 1) * c(1:5, 2)' .* p(:, 11:15), 2) - 3 * d(2) .* p(:, 12).^2 - e(2) + sum(ones(popsize, 1) * a(1:10, 2)' .* p(:, 1:10), 2);
        g3 = -2 * sum(ones(popsize, 1) * c(1:5, 3)' .* p(:, 11:15), 2) - 3 * d(3) .* p(:, 13).^2 - e(3) + sum(ones(popsize, 1) * a(1:10, 3)' .* p(:, 1:10), 2);
        g4 = -2 * sum(ones(popsize, 1) * c(1:5, 4)' .* p(:, 11:15), 2) - 3 * d(4) .* p(:, 14).^2 - e(4) + sum(ones(popsize, 1) * a(1:10, 4)' .* p(:, 1:10), 2);
        g5 = -2 * sum(ones(popsize, 1) * c(1:5, 5)' .* p(:, 11:15), 2) - 3 * d(5) .* p(:, 15).^2 - e(5) + sum(ones(popsize, 1) * a(1:10, 5)' .* p(:, 1:10), 2);
        f1 = sum(ones(popsize, 1) * c(1:5, 1)' .* p(:, 11:15), 2) .* p(:, 11) + sum(ones(popsize, 1) * c(1:5, 2)' .* p(:, 11:15), 2) .* p(:, 12)...
            + sum(ones(popsize, 1) * c(1:5, 3)' .* p(:, 11:15), 2) .* p(:, 13) + sum(ones(popsize, 1) * c(1:5, 4)' .* p(:, 11:15), 2) .* p(:, 14)...
            + sum(ones(popsize, 1) * c(1:5, 5)' .* p(:, 11:15), 2) .* p(:, 15) + 2 * sum(ones(popsize, 1) * d .* p(:, 11:15).^3, 2)...
            - sum(ones(popsize, 1) * b .* p(:, 1:10), 2);
        f2 = max(0, g1) + max(0, g2) + max(0, g3) + max(0, g4) + max(0, g5);
        ObjVals(1,:)=f1';
        ObjVals(2,:)=f2';
    case 'g20'
        a = [0.0693 0.0577 0.05 0.2 0.26 0.55 0.06 0.1 0.12 0.18 0.1 0.09...
            0.0693 0.0577 0.05 0.2 0.26 0.55 0.06 0.1 0.12 0.18 0.1 0.09];
        b = [44.094 58.12 58.12 137.4 120.9 170.9 62.501 84.94 133.425 82.507 46.07 60.097...
            44.094 58.12 58.12 137.4 120.9 170.9 62.501 84.94 133.425 82.507 46.07 60.079];
        c = [123.7 31.7 45.7 14.7 84.7 27.7 49.7 7.1 2.1 17.7 0.85 0.64];
        d = [31.244 36.12 34.784 92.7 82.7 91.6 56.708 82.7 80.8 64.517 49.4 49.1];
        e = [0.1 0.3 0.4 0.3 0.6 0.3];
        g1 = (p(:, 1) + p(:, 13))./(1E-100 + sum(p, 2) + e(1));
        g2 = (p(:, 2) + p(:, 14))./(1E-100 + sum(p, 2) + e(2));
        g3 = (p(:, 3) + p(:, 15))./(1E-100 + sum(p, 2) + e(3));
        g4 = (p(:, 7) + p(:, 19))./(1E-100 + sum(p, 2) + e(4));
        g5 = (p(:, 8) + p(:, 20))./(1E-100 + sum(p, 2) + e(5));
        g6 = (p(:, 9) + p(:, 21))./(1E-100 + sum(p, 2) + e(6));
        g7 = abs(p(:, 13)./(1E-100 + b(13) * (sum(p(:, 13:24)./(ones(popsize, 1) * b(13:24)), 2))) - c(1) * p(:, 1)./(1E-100 + 40 * b(1) * (sum(p(:, 1:12)./(ones(popsize, 1) * b(1:12)), 2)))) - delta;
        g8 = abs(p(:, 14)./(1E-100 + b(14) * (sum(p(:, 13:24)./(ones(popsize, 1) * b(13:24)), 2))) - c(2) * p(:, 2)./(1E-100 + 40 * b(2) * (sum(p(:, 1:12)./(ones(popsize, 1) * b(1:12)), 2)))) - delta;
        g9 = abs(p(:, 15)./(1E-100 + b(15) * (sum(p(:, 13:24)./(ones(popsize, 1) * b(13:24)), 2))) - c(3) * p(:, 3)./(1E-100 + 40 * b(3) * (sum(p(:, 1:12)./(ones(popsize, 1) * b(1:12)), 2)))) - delta;
        g10 = abs(p(:, 16)./(1E-100 + b(16) * (sum(p(:, 13:24)./(ones(popsize, 1) * b(13:24)), 2))) - c(4) * p(:, 4)./(1E-100 + 40 * b(4) * (sum(p(:, 1:12)./(ones(popsize, 1) * b(1:12)), 2)))) - delta;
        g11 = abs(p(:, 17)./(1E-100 + b(17) * (sum(p(:, 13:24)./(ones(popsize, 1) * b(13:24)), 2))) - c(5) * p(:, 5)./(1E-100 + 40 * b(5) * (sum(p(:, 1:12)./(ones(popsize, 1) * b(1:12)), 2)))) - delta;
        g12 = abs(p(:, 18)./(1E-100 + b(18) * (sum(p(:, 13:24)./(ones(popsize, 1) * b(13:24)), 2))) - c(6) * p(:, 6)./(1E-100 + 40 * b(6) * (sum(p(:, 1:12)./(ones(popsize, 1) * b(1:12)), 2)))) - delta;
        g13 = abs(p(:, 19)./(1E-30 + b(19) * (sum(p(:, 13:24)./(ones(popsize, 1) * b(13:24)), 2))) - c(7) * p(:, 7)./(1E-100 + 40 * b(7) * (sum(p(:, 1:12)./(ones(popsize, 1) * b(1:12)), 2)))) - delta;
        g14 = abs(p(:, 20)./(1E-100 + b(20) * (sum(p(:, 13:24)./(ones(popsize, 1) * b(13:24)), 2))) - c(8) * p(:, 8)./(1E-100 + 40 * b(8) * (sum(p(:, 1:12)./(ones(popsize, 1) * b(1:12)), 2)))) - delta;
        g15 = abs(p(:, 21)./(1E-100 + b(21) * (sum(p(:, 13:24)./(ones(popsize, 1) * b(13:24)), 2))) - c(9) * p(:, 9)./(1E-100 + 40 * b(9) * (sum(p(:, 1:12)./(ones(popsize, 1) * b(1:12)), 2)))) - delta;
        g16 = abs(p(:, 22)./(1E-100 + b(22) * (sum(p(:, 13:24)./(ones(popsize, 1) * b(13:24)), 2))) - c(10) * p(:, 10)./(1E-100 + 40 * b(10) * (sum(p(:, 1:12)./(ones(popsize, 1) * b(1:12)), 2)))) - delta;
        g17 = abs(p(:, 23)./(1E-100 + b(23) * (sum(p(:, 13:24)./(ones(popsize, 1) * b(13:24)), 2))) - c(11) * p(:, 11)./(1E-100 + 40 * b(11) * (sum(p(:, 1:12)./(ones(popsize, 1) * b(1:12)), 2)))) - delta;
        g18 = abs(p(:, 24)./(1E-100 + b(24) * (sum(p(:, 13:24)./(ones(popsize, 1) * b(13:24)), 2))) - c(12) * p(:, 12)./(1E-100 + 40 * b(12) * (sum(p(:, 1:12)./(ones(popsize, 1) * b(1:12)), 2)))) - delta;
        g19 = abs(sum(p, 2) - 1) - delta;
        g20 = abs(sum(p(:, 1:12)./(ones(popsize, 1) * d(1:12)), 2) + 0.7302 * 530 * 14.7/40 * sum(p(:, 13:24)./(ones(popsize, 1) * b(13:24)), 2) - 1.671) - delta;
        f1 = sum(ones(popsize, 1) * a .* p, 2);
        f2 = max(0, g1) + max(0, g2) + max(0, g3) + max(0, g4) + max(0, g5) + max(0, g6) + max(0, g7) + max(0, g8) + max(0, g9) + max(0, g10)...
            + max(0, g11) + max(0, g12) + max(0, g13) + max(0, g14) + max(0, g15) + max(0, g16) + max(0, g17) + max(0, g18) + max(0, g19)...
            + max(0, g20);
        ObjVals(1,:)=f1';
        ObjVals(2,:)=f2';
    case 'g21'
        g1 = -p(:, 1) + 35 * p(:, 2).^0.6 + 35 * p(:, 3).^0.6;
        g2 = abs( - 300 * p(:, 3) + 7500 * p(:, 5) - 7500 * p(:, 6) - 25 * p(:, 4) .* p(:, 5) + 25 * p(:, 4) .* p(:, 6) + p(:, 3) .* p(:, 4)) - delta;
        g3 = abs(100 * p(:, 2) + 155.365 * p(:, 4) + 2500 * p(:, 7) - p(:, 2) .* p(:, 4) - 25 * p(:, 4) .* p(:, 7) - 15536.5) - delta;
        g4 = abs( - p(:, 5) + log( - p(:, 4) + 900)) - delta;
        g5 = abs( - p(:, 6) + log(p(:, 4) + 300)) - delta;
        g6 = abs( - p(:, 7) + log( - 2 * p(:, 4) + 700)) - delta;
        f1 = p(:, 1);
        f2 = max(0, g1) + + max(0, g2) + max(0, g3) + max(0, g4) + max(0, g5) + max(0, g6);
        ObjVals(1,:)=f1';
        ObjVals(2,:)=f2';
    case 'g22'
        g1 = -p(:, 1) + p(:, 2).^0.6 + p(:, 3).^0.6 + p(:, 4).^0.6;
        g2 = abs(p(:, 5) - 100000 * p(:, 8) + 10^7) - delta;
        g3 = abs(p(:, 6) + 100000 * p(:, 8) - 100000 * p(:, 9)) - delta;
        g4 = abs(p(:, 7) + 100000 * p(:, 9) - 5 * 10^7) - delta;
        g5 = abs(p(:, 5) + 100000 * p(:, 10) - 3.3 * 10^7) - delta;
        g6 = abs(p(:, 6) + 100000 * p(:, 11) - 4.4 * 10^7) - delta;
        g7 = abs(p(:, 7) + 100000 * p(:, 12) - 6.6 * 10^7) - delta;
        g8 = abs(p(:, 5) - 120 * p(:, 2) .* p(:, 13)) - delta;
        g9 = abs(p(:, 6) - 80 * p(:, 3) .* p(:, 14)) - delta;
        g10 = abs(p(:, 7) - 40 * p(:, 4) .* p(:, 15)) - delta;
        g11 = abs(p(:, 8) - p(:, 11) + p(:, 16)) - delta;
        g12 = abs(p(:, 9) - p(:, 12) + p(:, 17)) - delta;
        g13 = abs( - p(:, 18) + log(p(:, 10) - 100)) - delta;
        g14 = abs( - p(:, 19) + log( - p(:, 8) + 300)) - delta;
        g15 = abs( - p(:, 20) + log(p(:, 16))) - delta;
        g16 = abs( - p(:, 21) + log( - p(:, 9) + 400)) - delta;
        g17 = abs( - p(:, 22) + log(p(:, 17))) - delta;
        g18 = abs( - p(:, 8) - p(:, 10) + p(:, 13) .* p(:, 18) - p(:, 13) .* p(:, 19) + 400) - delta;
        g19 = abs(p(:, 8) - p(:, 9) - p(:, 11) + p(:, 14) .* p(:, 20) - p(:, 14) .* p(:, 21) + 400) - delta;
        g20 = abs(p(:, 9) - p(:, 12) - 4.60517 * p(:, 15) + p(:, 15) .* p(:, 22) + 100) - delta;
        f1 = p(:, 1);
        f2 = max(0, g1) + max(0, g2) + max(0, g3) + max(0, g4) + max(0, g5) + max(0, g6) + max(0, g7) + max(0, g8) + max(0, g9) + max(0, g10)...
            + max(0, g11) + max(0, g12) + max(0, g13) + max(0, g14) + max(0, g15) + max(0, g16) + max(0, g17) + max(0, g18) + max(0, g19)...
            + max(0, g20);
        ObjVals(1,:)=f1';
        ObjVals(2,:)=f2';
    case 'g23'
        g1 = p(:, 9) .* p(:, 3) + 0.02 .* p(:, 6) - 0.025 .* p(:, 5);
        g2 = p(:, 9) .* p(:, 4) + 0.02 .* p(:, 7) - 0.015 .* p(:, 8);
        g3 = abs(p(:, 1) + p(:, 2) - p(:, 3) - p(:, 4)) - delta;
        g4 = abs(0.03 .* p(:, 1) + 0.01 .* p(:, 2) - p(:, 9) .* (p(:, 3) + p(:, 4))) - delta;
        g5 = abs(p(:, 3) + p(:, 6) - p(:, 5)) - delta;
        g6 = abs(p(:, 4) + p(:, 7) - p(:, 8)) - delta;
        f1 = -9 .* p(:, 5) - 15 .* p(:, 8) + 6 .* p(:, 1) + 16 .* p(:, 2) + 10 .* (p(:, 6) + p(:, 7));
        f2 = max(0, g1) + max(0, g2) + max(0, g3) + max(0, g4) + max(0, g5) + max(0, g6);
        ObjVals(1,:)=f1';
        ObjVals(2,:)=f2';
    case 'g24'
        g1 = -2 * p(:, 1).^4 + 8 * p(:, 1).^3 - 8 * p(:, 1).^2 + p(:, 2) - 2;
        g2 = -4 * p(:, 1).^4 + 32 * p(:, 1).^3 - 88 * p(:, 1).^2 + 96 * p(:, 1) + p(:, 2) - 36;
        f1 = -p(:, 1) - p(:, 2);
        f2 = max(g1, 0) + max(g2, 0);
        ObjVals(1,:)=f1';
        ObjVals(2,:)=f2';
end
end