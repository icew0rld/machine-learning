# Introduction

什么是机器学习：

- computer program
- without being explicitly programmed
- to task T, meatured by P, learn from E

什么是Supervised Learning(监督学习)：

- 有right answer，即一个input对应的output是确定的，这个output值也叫作label
- 监督学习算法所解决的问题可分为：
	- Regression(回归)：输出值是连续的
	- Classification(分类)：输出值是离散的

什么是Unsupervised Learning(无监督学习):

- 数据no labels，不知道结果是什么样的。即(X, y)只有X没有y。
- 非监督学习算法所解决的问题包括：
	- Clustering(聚类)
	- Non-clustering(非聚类)
- 无监督学习，是要找到数据中的结构，其中一种结构是cluster,要找cluster的算法就叫Clustering。比如social network analysis,要找出属于相同cluster的人群。
- 所谓监督，就是有目标变量值y，在训练模型参数时，提供『监督』。
- 无监督学习再概念上似乎比较高级，但其算法的难度不一定比监督学习高，比如K-means clustering算法，就能比较直观地理解。