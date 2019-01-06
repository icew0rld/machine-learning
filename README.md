# Machine Learning

## 打怪升级指南

Step1: 学习吴恩达在Coursera开设的课程《机器学习》，掌握如下部分知识: **(约需要50小时)**

- 掌握7个机器学习算法，能够用Octave语言编程实现这些算法
- 掌握并会应用常用的在不同算法中都可能使用的技术
- 了解大数据情况下应用机器学习所需要的技术
- 了解应用例子：推荐系统和Photo ORC（识别图像中的字符）

Step2: 了解尽可能多（？）的算法，了解的程度只需知道每个算法的适用范围

Step3: 编写一个实际有用的机器学习应用

Step4: 学习深度学习

## 知识大纲

- [Introduction](Introduction.md)
	- 什么是机器学习
	- 什么是监督学习
	- 什么是无监督学习

- 前置数学知识
	- [线性代数](Linear-Algebra.md)：用的最多，但都只是基本的矩阵运算
	- 微积分：导数、偏导数
	- 概率论：高斯分布

- 机器学习领域常用编程语言
	- [Octave](Octave.md) or Matlab：高层，建原型
	- Python：AI常用，大概是最流行？
	- R:?
	- Scala:?
	- Java/C++：需要性能时，结合库

- 机器学习算法列表

Step1需掌握的算法：

|名称|类型|子类型|要点|详情|
|---|---|---|---|---|
|Linear Regression| 监督 | 回归 |假说函数不局限于线性，经过特征映射后，可以是多项式或其它复杂函数|[Detail](Linear-Regression.md)|
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

| 技术                      | 含义                                                         | 详情                                  |
| ------------------------- | ------------------------------------------------------------ | ------------------------------------- |
| Visualization             | 数据可视化                                                   | [detail](Visualization.md)            |
| Vectorization             | 将计算公式矢量化                                             |                                       |
| Feature Normalization     | 特征规范化                                                   | [detail](Feature-Normalization.md)    |
| Feature Mapping           | 特征映射                                                     | [detail](Feature-Mapping.md)          |
| Regularization            | 正则化                                                       |                                       |
| Dimentionality Reduction  | 降维                                                         | [detail](Dimensionality-Reduction.md) |
| 机器学习算法诊断          | 评估算法，给出改进建议                                       | [detail](Diagnostic.md)               |
| 机器学习系统设计          | 关于如何设计机器学习系统的建议                               | [detail](System-Design.md)            |
| Pipeline                  | 多个组件串联构成机器学习整体。Ceiling analysis: 天花板分析，分析改进哪个组件可以最大化整个系统的提升 |                                       |
| Artificial Data Synthesis | 人工数据构造                                                 |                                       |

- Big Data
  - Stochastic/Mini-Batch Gradient Descent
  - MapReduce
- Application Cases
  - 推荐系统
  	- 基于内容的推荐
  	- 协同过滤
  - Photo ORC
- 其他
  - 开源框架：caffe, ncnn, tensorflow，mxnet
  - 实现相关：
  	- linux操作系统
  	- gpu平台cuda，opencl
  	- neon or simd指令

## Useful Resources

课程：

- [Ng斯坦福在coursera的公开课《机器学习》](https://zh.coursera.org/learn/machine-learning)

书：

- [《机器学习实战》 by Peter](https://www.amazon.cn/dp/B00D747PTK/ref=sr_1_1?ie=UTF8&qid=1546095191&sr=8-1&keywords=%E6%9C%BA%E5%99%A8%E5%AD%A6%E4%B9%A0%E5%AE%9E%E6%88%98)
- 《机器学习》周志华
- 《统计学习方法》李航

在线教程：

- [MATLAB Programming Tutorials](https://www.coursera.org/learn/machine-learning/supplement/Mlf3e/more-octave-matlab-resources)

在线帮助文档：

- [Octave doc](http://www.gnu.org/software/octave/doc/interpreter/)
- [Matlab doc](https://www.mathworks.com/help/)

其他有用资源：

- [Userful Resources os 机器学习,coursera课程,Ng](https://www.coursera.org/learn/machine-learning/resources/NrY2G)

学术:

- cvpr,国际计算机视觉与模式识别会议

## Todo

- 理解SVM

