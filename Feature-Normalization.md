# Feature Normalization

目的：

将所有特征的大小变成相同规模的。

如果不同特征的值大小差别很大，小的会快速收敛，大的则会慢。慢的将会使梯度下降收敛的慢。

## Feature Scaling 

- 除以xMax - xMin，或
- 除以标准差

标准差：

standard deviation

测量一组数值的离散程度

![sd](/Users/acer/project/machine-learning/屏幕快照 2019-01-06 13.27.36.png)

样本的标准差:

![sd](/Users/acer/project/machine-learning/屏幕快照 2019-01-06 13.33.14.png)

```matlab
sigma = std(X);%除的是n-1，对X的列进行计算
```



## Mean Normalization

- 减去平均值

## 两者都应用

![fn](/Users/acer/project/machine-learning/屏幕快照 2019-01-06 13.41.54.png)

```matlab
function [X_norm, mu, sigma] = featureNormalize(X)
mu = mean(X);%按列求平均
X_norm = bsxfun(@minus, X, mu);
%bsxfun:将二元函数element-by-element地应用到两个数组，X会被展开成单维数组

sigma = std(X_norm);%按列求样本标准差
X_norm = bsxfun(@rdivide, X_norm, sigma);
end
```





