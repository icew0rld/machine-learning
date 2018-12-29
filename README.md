# Machine Learning

## 学习指南

Step1: 学习Ng在Coursera开设的课程，掌握如下部分知识:

- 掌握机器学习Basics部分算法，能够用Octave或Matlab语言编程实现这些算法
- 掌握并会应用Cross Algorithm Techniques
- 了解大数据情况下应用机器学习所需要的技术
- 了解应用case：推荐系统和Photo ORC

Step2: 编写一个实际有用的ML应用

## 知识大纲

- Introduction
	- 什么是机器学习
	- 什么是监督学习
	- 什么是无监督学习

- 前置数学知识
	- 线性代数：用的最多，但都只是基本的矩阵运算
	- 微积分：导数、偏导数
	- 概率论：高斯分布

- 机器学习领域常用编程语言
	- Octave/Matlab：高层，建原型
	- Python：AI常用，大概是最流行？
	- R:?
	- Java/C++：需要性能时，结合库

- 机器学习算法列表

Basics：

|名称|类型|子类型|要点|详情|
|---|---|---|---|---|
|Linear Regression| 监督 | 回归 ||[Detail](Linear-Regression.md)|
|Logistic Regression | 监督 | 分类 |当需要将特征映射为非线性而得到复杂的hypothesis function时，特征数目将指数式增长，此时使用该方法不实际|[Detail](Logistic-Regression.md)|
|Neural Network | 监督 | 分类|有复杂hypothesis function和许多特征的问题 | [Detail](Neural-Network.md)|
|Support Vector Machine| 监督 | 分类|powerful 'black box' learning algorithm, and by posing a cleverly-chosen optimization objective|[Detail](Support-Vector-Machine.md) |
|Collaborative Filtering| 监督| 回归 |是线性回归的一种变形，用在推荐系统中 |[Detail](https://www.coursera.org/learn/machine-learning/resources/szFCa)|
|K-Means Clustering|无监督| 聚类|从数据集中找出K个聚类 |[Detail](K-Means-Clustering.md)|
|Anomoly Detection|无监督| 非聚类 | 检测异常数据，易理解，使用高斯分布|[Detail](https://www.coursera.org/learn/machine-learning/resources/szFCa) |

More：

|名称|类型|目标变量类型|要点|
|---|---|---|---|
|k-邻近算法| 监督 | 分类||
|决策树| 监督 | 分类||
|基于概率论的分类方法：朴素贝叶斯| 监督 | 分类||
|k-邻近算法| 监督 | 分类||
|预测数值型数据：回归 same?|监督 | 回归||
|树回归 is Linear?|监督 | 回归||
|FP-growth算法|无监督||
|AdaBoost元算法|?|

- Cross Algorithm Techniques: 不同算法有可能都会采用的技术
 	- Visualization: 数据可视化
 	- Vectorization：矢量化
	- Feature Mapping: 特征映射
	- Normalization: 规范化
		- Featurn scaling
		- Mean Normalization
	- Regularization: 正则化
	- [Dimentionality Reduction](Dimensionality-Reduction.md): 降维
	- [机器学习算法诊断](Diagnostic.md)：评估算法，给出改进建议
	- [机器学习系统设计](System-Design.md)：关于如何设计机器学习系统的建议
	- Pipeline: 多个组件串联构成机器学习整体
		- Ceiling analysis: 天花板分析，分析改进哪个组件可以最大化整个系统的提升
	- Artificial Data Synthesis: 人工数据合成

- Big Data
	- Stochastic/Mini-Batch Gradient Descent
	- MapReduce

- Application Cases
	- 推荐系统
		- 基于内容的推荐
		- 协同过滤
	- Photo ORC

- Useful Resources

## Introduction

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

## Octave

音乐里的『八度』也是这个单词。

Octave是一个软件，是一种采用高级编程语言的主要用于数值分析的软件。它和Matlab大部分语法兼容，但Matlab是专有软件，Octave是开源软件。两者相比，Matlab使用更『流畅』一些。和Python、R相比，语言抽象级别较高(未证实)。适合用来写机器学习算法的原型。

- Basic operations
- Moving data around
- Computing on data
- Ploting data
- Control statements
- Functions
- Vertorization

安装（mac）：

- [下载](https://wiki.octave.org/Octave_for_macOS)
- 命令行运行:
```
export PATH=$PATH:/Applications/Octave-4.4.0.app/Contents/Resources/usr/bin
```

## Linear Algebra(线性代数)

线性代数涉及矩阵和矩阵运算，其中的部分知识在机器学习中被用到。

- Matrix
- Vector
- Addition
- Scalar Multiplication
- Matrix-Vector Multiplication
- Matrix-Matrix Multiplication
- Matrix Multiplication Properties
	- Not commutative. A∗B≠B∗A
	- Associative. (A∗B)∗C=A∗(B∗C)
- Inverse
- Transpose

## Useful Resources

课程：

- [Ng斯坦福在coursera课程的公开课《机器学习》](https://zh.coursera.org/learn/machine-learning)

书：

- [《机器学习实战》 by Peter](https://www.amazon.cn/dp/B00D747PTK/ref=sr_1_1?ie=UTF8&qid=1546095191&sr=8-1&keywords=%E6%9C%BA%E5%99%A8%E5%AD%A6%E4%B9%A0%E5%AE%9E%E6%88%98)

在线教程：

- [MATLAB Programming Tutorials](https://www.coursera.org/learn/machine-learning/supplement/Mlf3e/more-octave-matlab-resources)

在线帮助文档：

- [Octave doc](http://www.gnu.org/software/octave/doc/interpreter/)

- [Matlab doc](https://www.mathworks.com/help/)

其他有用资源：

- [Userful Resources os 机器学习,coursera课程,Ng](https://www.coursera.org/learn/machine-learning/resources/NrY2G)

### 学术

cvpr,国际计算机视觉与模式识别会议

## TO DO

- 理解SVM

