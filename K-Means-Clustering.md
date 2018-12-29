# K-Means Clustering

流行、使用广泛。

## 算法计算步骤

- 计算x_m中每个x_i到u_K中每个u_j的距离，最小的那个距离对于的j，表示x_i的cluster
- 更新u_j为每个属于j的cluster的x的评价值

迭代以上2个步骤

关键的观察在于，每迭代一次，Cost Function的值不会增加，而是减小。（请想想看）

这个算法理解起来比价容易，比Ng讲的svm云里雾里好接受。

## Cost Function

所有x_m到对应的u_j的距离的平均值。

## 实现

- Random Initialization
	- 随机选x_m中的k个example作为初始cluster centroid是一个好的选择
	- 会发生local optima，应随机运行多次，求最小J对于的结果
- K的选择
	- 一般是by hand，没有太好办法
	- Elbow method，不怎么有用
	- downstream purpose

## Detail

[Ng lecture notes of week 8](https://www.coursera.org/learn/machine-learning/resources/kGWsY)