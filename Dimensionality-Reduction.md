# Dimensionality Reduction

## For what

- 数据压缩节约时间、空间
- 数据可视化


## PCA, Principal Component Analysis, (主成分分析？）

关键的过程是投影到低纬度向量组。

最优化目标是min of average of square projection error。求的是低纬度向量组。projection error是点到映射面的垂直距离。

最优化步骤利用现成svd函数，比较简单，但数学证明不容易。

- covariance matrix
- eigenvectors
- Take the first k columns of the U matrix and compute z


重建：从映射结果求原来的值，会有误差，误差就是projection error。重建用到了U的特殊性质，Unitary Matrix的性质，即其逆等于其共轭，而实数矩阵的共轭又是它的转置。



## Detail

[Ng lecture notes of week 8](https://www.coursera.org/learn/machine-learning/resources/kGWsY)

