clc;
clear all;

% Read matrix from file
M = readmatrix('neighborhoodMatrix.csv', Delimiter=',');
% Get the size
[m, n] = size(M);

% Thirsd dimension
k = 30;

% Initial U and V
U = rand(m, k);
V = rand(k, n);

learnignRate = 0.01;

for episode = 1:1000
    for i = 1:m
        for j = 1:n
            % Compute the gradient for U and V (Selected vectors)
            gu = -2 * V(:,j) * (M(i,j) - (U(i,:) * V(:,j)));
            gv = -2 * U(i,:) * (M(i,j) - (U(i,:) * V(:,j)));
            
            % Update the U and V (Selected vectors)
            U(i,:) = U(i,:) - transpose(learnignRate * gu);
            V(:,j) = V(:,j) - transpose(learnignRate * gv);   
        end
    end
    % Break condition
    if norm(M - (U * V)) <= 10e-5
        break
    end
end

% To check the result
% Compute the U * V
Q = U * V;

minQ = min(min(Q));
maxQ = max(max(Q));
zz = (minQ + maxQ) / 2;


% Change the U * V result to 0 and 1
for w = 1:m
    for ww = 1:n
        if Q(w, ww) >= zz
            Q(w, ww) = 1;
        else
            Q(w, ww) = 0;
        end
    end
end

% Compute the error amount
error = norm(M - Q);
disp(error);

test = M == Q;
disp('Not equal count = ');
disp(sum(~test(:)));

