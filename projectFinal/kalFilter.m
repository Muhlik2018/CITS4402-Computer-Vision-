function [updatedP,currentState] = kalFilter(lastState,currP,currPosition)
H=[1,0,0,0,0,0;...
    0,1,0,0,0,0];
R=[1,0;...
    0,1;];

% Predict state, position using last computed P
[statePred,positionPred,predP]=stateEstimate(lastState,currP);



% compute error and etc.
error=currPosition-positionPred;
covariance=H*predP*H'+R;
kalmanGain=predP*H'/covariance;


% update predicted state, update P
currentState=statePred+kalmanGain*error;
currentState(1,1)=currPosition(1,1);
currentState(2,1)=currPosition(2,1);
updatedP=(1-kalmanGain*H)*predP;

end

