# 机器学习算法诊断

## 数据集的划分

- Training Set: 用来训练 60%
- Cross Validation Set: 用来选择参数 20%
- Test Set: 用来评估结果 20%

## 算法可能存在的问题

- high bias problem: underfitting
- high variance problem: overfitting

## 三个诊断工具

- degree和J_cv、J_train的关系图：可以诊断degree是否导致了bias或variance
- lambda和J_cv、J_train的关系图：可以诊断lambda是否导致了bias或variance
- m和J_cv、J_train的关系图（learning curve）:可以诊断是否存在bias或variance

以上，若发现有bias或variance，可改变degree、lambda、m，以使算法的误差变小。即，可改变的变量有：

- degree
	- 增大：Fixes high bias
	- 减少：Fixes high variance
- lambda
	- 增大：Fixes high variance
	- 减少：Fixes high bias
- m
	- 增大：Fixes high variance
- size of feature set
	- 增大：Fixes high bias
	- 减少：Fixes high variance
- number of unit or layer in nerual network
	- 增大：Fixes high bias
	- 减少：Fixes high variance

## Details

[Week 6 Lecture Notes](https://www.coursera.org/learn/machine-learning/resources/LIZza)