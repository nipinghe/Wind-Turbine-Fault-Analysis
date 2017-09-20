function [TP,FP,precision,TPR,TNR,FAR,FRR,Fmeasure] = performance_stat(actual,predicted)

% Finding True positive, True Negatives, False Positives and False Negatives
[cost,confmat,~,perf] = confusion(actual,predicted);

TP = confmat(1,1);
FP = confmat(1,2);
precision = TP / TP + FP;
TPR = sum(perf(:,3)) * 10;             % Recall
TNR = sum(perf(:,4)) * 10;
FAR = sum(perf(:,2)) * 100;
FRR = sum(perf(:,1)) * 100;
Fmeasure = 2 * (precision * TPR) / (precision + TPR); 

fprintf('\n Misclassification Cost: %f\n',cost * 100);
fprintf('\n Sensitivity or recall: %f\n', TPR);
fprintf('\n Specificity: %f\n',TNR);
fprintf('\n False Acceptance Rate(FAR): %f\n',FAR);
fprintf('\n False Rejection Rate(FRR): %f\n',FRR);
fprintf('\n Precision: %f\n', precision);
fprintf('\n F1 measure: %f\n', Fmeasure);
