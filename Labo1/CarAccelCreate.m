CarAccel=newfis("Car Acceleration");

% First input variable: Speed
CarAccel=addvar(CarAccel,'input','Speed',[-1,1]);
% Memebership functions
CarAccel=addmf(CarAccel,'input',1,'Slow','trapmf',[-2 -1 -0.5 0]);
CarAccel=addmf(CarAccel,'input',1,'OK','trimf',[-0.5 0 0.1]);
CarAccel=addmf(CarAccel,'input',1,'Fast','trapmf',[0 0.15 1 2]);

% Second  input variable: SpeedChange
CarAccel=addvar(CarAccel,'input','SpeedChange',[-1,1]);
% Memebership functions
CarAccel=addmf(CarAccel,'input',2,'Slowing','trapmf',[-2 -1 -0.3 0]);
CarAccel=addmf(CarAccel,'input',2,'Constant','trimf',[-0.3 0 0.3]);
CarAccel=addmf(CarAccel,'input',2,'Rising','trapmf',[0 0.3 1 2]);

% Output variable: Action
CarAccel=addvar(CarAccel,'output','Action',[-1,1]);
% Memebership functions
CarAccel=addmf(CarAccel,'output',1,'Release','trimf',[-2 -1 0]);
CarAccel=addmf(CarAccel,'output',1,'Nothing','trimf',[-1 0 1]);
CarAccel=addmf(CarAccel,'output',1,'Push','trimf',[0 1 2]);

% Rule creation
MyRules = [...
1 1 3 1 1;	% Push
1 2 3 1 1;
1 3 2 1 1; 	% Nothing
2 1 2 1 1;
2 2 2 1 1;
2 3 2 1 1;
3 1 2 1 1;
3 2 1 1 1;	% Release
3 3 1 1 1];
CarAccel=addrule(CarAccel,MyRules);
