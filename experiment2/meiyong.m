prior_prob1 = 0.6;
prior_prob2 = 0.3;
prior_prob3 = 0.1;
decision_cost = [0 1 8; 3 0 3; 6 1 0];
% Generate dataset and plot
mean1_init = [-2 -3.5];
cov1_init = [1 0.5; 0.5 2];
mean2_init = [-1 4];
cov2_init = [2 0; 0 1];
mean3_init = [1.5, -1];
cov3_init = [1 0; 0 1];
w1 = mvnrnd(mean1_init, cov1_init, 50);
w2 = mvnrnd(mean2_init, cov2_init, 50);
w3 = mvnrnd(mean3_init, cov3_init, 50);
figure(1)
hold on
plot(w1(:, 1), w1(:, 2), '.b')
plot(w2(:, 1), w2(:, 2), 'ok')
plot(w3(:, 1), w3(:, 2), '*r')
title('Dataset')
% Init grid
[x, y] = meshgrid(-5 : 0.1 : 5);
figure(1)
hold on
% Conditional probability parameters and plot
mean1 = mean(w1);
cov1 = cov(w1(:, 1), w1(:, 2));
mean2 = mean(w2);
cov2 = cov(w2(:, 1), w2(:, 2));
mean3 = mean(w3);
cov3 = cov(w3(:, 1), w3(:, 2));
figure(2)
cond_prob1 = reshape(mvnpdf([x(:), y(:)], mean1, cov1), size(x));
cond_prob2 = reshape(mvnpdf([x(:), y(:)], mean2, cov2), size(x));
cond_prob3 = reshape(mvnpdf([x(:), y(:)], mean3, cov3), size(x));
surf(x, y, cond_prob1);
hold on;
surf(x, y, cond_prob2);
surf(x, y, cond_prob3)
title('Conditional Probability')