# Neural Network


## Model Representation

神经网络的模型表示：

注：模型即hypothesis function，hypothesis function即模型。

注：模型的关键在于如何表示模型，所谓的表示是指数学表示。具体来说就是hypothesis function这个函数怎么表示。

注：模型，其含义，就是从输入值到输出值的一个数学结构，这个结构是函数，即从值到值的映射。

注：模型的特性，要符合问题的特性。比如逻辑回归模型，适用目标变量为0和1的情况，而线性回归就不一定适用。训练好的模型的参数，则表示某个问题的数学性质的具体的值。放大来说，模型是一个事物的理念，指定了参数的模型是具体的个体。（柏拉图的理念说用过来就是这样？）

- unit
  - 输入
  - 输出
  - bias unit
  - 某层的unit的输出值，等于前一层的所有unit的输出值的线性和，再套上sigmoid函数。（这个等式，是整个模型的关键所在）
  - 输出层的unit的输出即hypothesis function函数的值。可见这个网络本身相当于一个输入特征值到输出值的映射的函数，其中theta作为参数控制这个映射。
- layer
  - 输入层
  - 隐藏层
  - 输出层
- structure
  - 有几层
  - 每层多少个单元

![](/Users/acer/project/machine-learning/屏幕快照 2019-01-06 17.38.53.png)

a(j+1) = g(bigTheta(j) * a(j)) ，bigTheta是一个s_j+1 * (1 + s_j)的矩阵。

## Forward Propagation

从输入计算输出的过程

```matlab
function p = predict(Theta1, Theta2, X)
%Theta1 = s2 * (s1 + 1), 每行是s1的一系列系数
%Theta2 = s3 * (s2 + 1)
m = size(X, 1);%X的行是example数目
num_labels = size(Theta2, 1);%Theta2的行是分类数
p = zeros(size(X, 1), 1);
a1 = [ones(m, 1) X];%每行是一个example
a2 = sigmoid(a1 * Theta1');%每行是一个example对应的a2
a2 = [ones(m, 1) a2];
a3 = sigmoid(a2 * Theta2');%每行是一个example对应的a2
[w, p] = max(a3, [], 2);%每行求最大值的index存到p，对应一个example的分类
end
```

## Cost Function

![](/Users/acer/project/machine-learning/屏幕快照 2019-01-06 17.56.02.png)

- k是输出层单元数

- t是example数

- l是层数

- i是sl层的节点数

- j是sl+1层的节点数

注意正则化式子的bigTheta的列i从1开始到sl，不包含第一列bias unit对应的theta。

```matlab

function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
% nn_params: Theta1和Theta2的展开,即[Theta1(:) ; Theta2(:)];
% y是[1 1 2 2 3 3 ...]'这样的，每个元素是分类，共m个

% Theta1的size = hidden_layer_size * (input_layer_size + 1)
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

% Theta2的size = num_labels * (hidden_layer_size + 1)
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
                 
m = size(X, 1);
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% forward
function h = h(Theta1, Theta2, X)
    m = size(X, 1);
    num_labels = size(Theta2, 1);
    h1 = sigmoid([ones(m, 1) X] * Theta1');
    h = sigmoid([ones(m, 1) h1] * Theta2');% 每行是一个example对应的输入，szie = m * num_labels
end

h = h(Theta1, Theta2, X);
for iter = 1:m
    yVec = [1:num_labels]' == y(iter); % 把y的第iter个值转化为向量
    J = J - log(h(iter,:)) * yVec - log(1 - h(iter,:)) * (1 - yVec);
end
J = J / m; % 没有正则化的cost function的值

J = J + lambda / (2 * m) * (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2))); % 把Theta1和Theta2出去第一列外的元素平方后求和

% 以下部分是Back Propagation
for iter = 1:m
    a1 = [1 X(iter, :)]';
    a2 = [1; sigmoid(Theta1 * a1)];
    a3 = sigmoid(Theta2 * a2);
    yVec = [1:num_labels]' == y(iter);
    delta3 = a3 - yVec;
    delta2 = Theta2' * delta3 .* a2 .* (1 - a2);
    Theta2_grad = Theta2_grad + delta3 * a2';
    delta2 = delta2(2:end);
    Theta1_grad = Theta1_grad + delta2 * a1';
end
Theta1FirstColZero = Theta1;
Theta1FirstColZero(:,1) = 0;
Theta2FirstColZero = Theta2;
Theta2FirstColZero(:,1) = 0;
Theta1_grad = 1 / m * (Theta1_grad + lambda * Theta1FirstColZero);
Theta2_grad = 1 / m * (Theta2_grad + lambda * Theta2FirstColZero);

grad = [Theta1_grad(:) ; Theta2_grad(:)];
end
```

## Back Propagation

Back Propagation用来计算Cost Function的对于bitTheta的偏导数:

![](/Users/acer/project/machine-learning/屏幕快照 2019-01-06 19.51.41.png)

计算过程：

![](/Users/acer/project/machine-learning/屏幕快照 2019-01-06 19.59.53.png)

代码示例见上一节。

## Training

```matlab
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);

initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];



options = optimset('MaxIter', 100);

lambda = 1;

costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
```

## Predict

```matlab
function p = predict(Theta1, Theta2, X)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
[dummy, p] = max(h2, [], 2);

end
```

## Implementation

- unroll and reshape: 针对bigTheta、代价函数对bigTheta的偏导

unroll:

```matlab
grad = [Theta1_grad(:) ; Theta2_grad(:)];
```

reshape:

```matlab
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
```

- random initialization (symmetry breaking): 针对bitTheta

```matlab
function W = randInitializeWeights(L_in, L_out)
W = zeros(L_out, 1 + L_in);
epsilon_init = 0.12;
% rand产生的值在0、1之间
W = rand(L_out, 1 + L_in) * 2 * epsilon_init - epsilon_init;
end
```

- gradient checking: 针对代价函数对bigTheta的偏导

检查偏导是否计算正确

![](/Users/acer/project/machine-learning/屏幕快照 2019-01-06 20.11.49.png)

```matlab
% 求近似偏导
function numgrad = computeNumericalGradient(J, theta)
numgrad = zeros(size(theta));
perturb = zeros(size(theta));
e = 1e-4;
for p = 1:numel(theta)
    % Set perturbation vector
    perturb(p) = e;
    loss1 = J(theta - perturb);
    loss2 = J(theta + perturb);
    % Compute Numerical Gradient
    numgrad(p) = (loss2 - loss1) / (2*e);
    perturb(p) = 0;
end
end

% 计算差异程度，norm表示范数
diff = norm(numgrad-grad)/norm(numgrad+grad);
```

