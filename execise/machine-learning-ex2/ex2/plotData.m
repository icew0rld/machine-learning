function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%


% 注：用find函数比以下循环更简洁

positiveX = [];
negativeX = [];
for iter = 1:numel(y)
    if y(iter) == 1
        positiveX = [positiveX; X(iter, :)];
    else 
        negativeX = [negativeX; X(iter, :)];
    end
end

plot(positiveX(:, 1), positiveX(:, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(negativeX(:, 1), negativeX(:, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);



% =========================================================================



hold off;

end
