# Linear Regression

$$a + b$$

![](http://latex.codecogs.com/gif.latex?\\frac{1}{1+sin(x)})

分类：

- With One Variable
- With Multiple Variables

key concepts:

- Model
- Hypothesis Function
- Cost Function
- Gradient Descent
	- Feature Normalization: Feature Scaling and mean normalization
	- Polynomial regression
- Normal Equation

## Gradient Descent

```
theta = theta - (alpha / m) * X' * (X * theta - y);
```

## Normal Equation

对J(theta)求偏导，另其等于0，求出theta。即：

```
X' * (X * theta - y) = 0向量

得

theta = pinv(X' * X) * X' * y

```