function [acc,TP,FP,precision,TPR,TNR,FAR,FRR,Fmeasure] = results(label,y,setname,classes)

acc = mean(double(label == y)) * 100;
fprintf('\n%s Set Accuracy: %f\n', setname, acc);
le = length(label);                                % number of training samples
actual = zeros(classes,le);                              % actual values of output classes (rows = # of classes, columns = # of training samples) 
predicted = zeros(classes,le); 

for i = 1:classes
    actual_index = y == i - 1;
    predicted_index = label == i - 1;
    actual(i,actual_index) = 1;
    predicted(i,predicted_index) = 1;
end

%% Calculating performance parameters

[TP,FP,precision,TPR,TNR,FAR,FRR,Fmeasure] = performance_stat(actual,predicted);

%% Plotting confusion matrix

figure;
plotconfusion(actual,predicted);
title(strcat(setname,' Confusion Matrix'));

%% Plotting Region of Convergence (ROC) curve

figure;
plotroc(actual,predicted);
title(strcat(setname,' ROC'));

end