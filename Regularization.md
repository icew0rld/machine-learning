# Regularization

目的：

通过降低theta的影响而矫正过度拟合

## overfitting or high variance

即过度拟合

a hypothesis function that fits the available data but does not generalize well to predict new data.

原因：

- 特征冗余
- 模型复杂

解法：

- 减少特征
- 选择更合适模型
- Regularization

## underfitting or high bias

即拟合差

hypothesis function h maps poorly to the trend of the data.

原因：

- 特征少
- 模型简单

解法：

- 增加特征

- 选择更复杂的模型

## Regularization

对于线性回归和逻辑回归，通过在代价函数中添加：

![](/Users/acer/project/machine-learning/屏幕快照 2019-01-06 15.04.57.png)

以实行Regularization。