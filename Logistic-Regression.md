# Logistic Regression

Logistic Regression(逻辑回归)，不是回归算法，而是分类算法。Ng说这种命名是历史问题。

Logistic得名于Sinmoid Function也叫Logistic Function。Logistic Function得名于1844，作者并没有说明原因[see Logistic Function wiki]。

逻辑回归用来进行分类。包括2个结果的分类和多个结果的分类。

知识框架：

- Hypothesis Function
- Sigmoid Fuction (Logistic Function)
- Decision Boundary
- Cost Function
- Gradient Descent
- Advanced Optimation
	- Gonjugate gradient
	- BFGS
	- L-BFGS
	- fminunc：Octave函数
- One-vs-all: 多个结果的分类
- Regularization
	- overfitting
	- underfitting
- Feature Mapping: Ng课程的作业中的一种特征映射方法
- 问题
	- 具有什么特征的分类问题，适合使用逻辑回归（@todo）
	- Cost Function的偏导数为什么和线性规划的一样，怎么推导出来的
		- answer1: [derivative of cost function for Logistic Regression](https://math.stackexchange.com/questions/477207/derivative-of-cost-function-for-logistic-regression)
		- anwser2: Week3 Lecture Notes中也有推导
	

[详情见Ng机器学习课程的Week3 Lecture Notes](https://www.coursera.org/learn/machine-learning/resources/Zi29t)
