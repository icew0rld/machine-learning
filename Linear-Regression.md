# Linear Regression

## Hypothesis Function

线性回归的假说函数，是一个线性函数，如下：

![hTheta](屏幕快照 2019-01-06 12.08.19.png)

```matlab
h = theta' * x;
```



![X](屏幕快照 2019-01-06 12.09.56.png)



![hX](屏幕快照 2019-01-06 12.10.21.png)

```matlab
h = X * theta;
```

## Cost Function

代价函数是计算假说函数求出的值和实际值之间的误差的总和：

![jTheta](屏幕快照 2019-01-06 12.43.44.png)

```matlab
function J = computeCostMulti(X, y, theta)
	m = length(y); 
	J = (X * theta - y)' * (X * theta - y) / (2 * m);
end
```

正则化：

```matlab
function J = computeCostMultiReg(X, y, theta, lambda)
	m = length(y); 
	J = (X * theta - y)' * (X * theta - y) / (2 * m);
	J = J + lambda / (2 * m) * theta(2:end)' * theta(2:end);
end
```

## Gradient Descent

![theta](屏幕快照 2019-01-06 12.47.04.png)

![theta](屏幕快照 2019-01-06 12.47.21.png)

```matlab
function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
	m = length(y); 
	J_history = zeros(num_iters, 1);

    for iter = 1:num_iters
        theta = theta - (alpha / m) * X' * (X * theta - y);
        J_history(iter) = computeCostMulti(X, y, theta);
    end
end
```

正则化：

```matlab
grad = 1 / m * X' * (X * theta - y) + lambda / m * [0;theta(2:end)];
```



## Normal Equation

代价函数对theta求偏导，最小值是偏导等于0时的theta，因而可以直接计算theta，而不用梯度下降。

![nf](屏幕快照 2019-01-06 12.55.10.png)

```matlab
function [theta] = normalEqn(X, y)
	theta = zeros(size(X, 2), 1);
	theta = pinv(X' * X) * X' * y;
end
```

正则化：

![](屏幕快照 2019-01-06 16.13.44.png)

```matlab
function [theta] = normalEqn(X, y, lambda)
	L = eye(size(X,2));
	L(1,1) = 0;
	theta = pinv(X' * X + lambda * L) * X' * y;
end
```



## 解法的选择

![choose](屏幕快照 2019-01-06 12.57.11.png)

## Polynomial Regression

对线性回归进行特指映射，算法就变成多项式回归。

![](屏幕快照 2019-01-06 14.01.14.png)

[Feature Mapping](Feature-Mapping.md)

## Advanced Optimization

``` matlab 
function [J, grad] = costFunctionReg(theta, X, y, lambda)
m = length(y);
J = (X * theta - y)' * (X * theta - y) / (2 * m);
J = J + lambda / (2 * m) * theta(2:end)' * theta(2:end);
grad = 1 / m * X' * (X * theta - y) + lambda / m * [0;theta(2:end)];
end
```

```matlab
[m, n] = size(X);
X = [ones(m, 1) X];
initial_theta = zeros(n + 1, 1);
lambda = 1;
[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);

initial_theta = zeros(n + 1, 1);
lambda = 1;
options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);
```

