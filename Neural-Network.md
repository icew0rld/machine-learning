# Neural Network


## Model

神经网络的模型表示：

注：模型即hypothesis function，hypothesis function即模型。

注：模型的关键在于如何表示模型，所谓的表示是指数学表示。具体来说就是hypothesis function这个函数怎么表示。

注：模型，其含义，就是从输入值到输出值的一个数学结构，这个结构是函数，即从值到值的映射。

注：模型的特性，要符合问题的特性。比如逻辑回归模型，适用目标变量为0和1的情况，而线性回归就不一定适用。训练好的模型的参数，则表示某个问题的数学性质的具体的值。放大来说，模型是一个事物的理念，指定了参数的模型是具体的个体。（柏拉图的理念说用过来就是这样？）

- unit
	- 输入
	- 输出
	- bias unit
	- 某层的unit的输出值，等于前一层的所有unit的输出值的线性和，再套上sigmoid函数。（这个等式，是整个模型的关键所在）
	- 输出层的unit的输出即hypothesis function函数的值。可见这个网络本身相当于一个输入特征值到输出值的映射的函数，其中theta作为参数控制这个映射。
- layer
	- 输入层
	- 隐藏层
	- 输出层
- structure
	- 有几层
	- 每层多少个单元

## Cost Function

Cost Function是一个函数，衡量使用模型+训练集的输入值，得到的目标变量值，和实际的目标变量值之间的差距的加总。

因而，当我们改变模型的参数，使总误差最小，我们就可以认为，模型和数据比较好地『拟合 fit』了。这也，我们有理由相信，当新的输入值输入模型时，所产生的目标变量值，和实际将发生的值，之间的误差很可能不大。

**为什么神经网络的cost function和逻辑回归的基本相同？**

为了衡量模型输出的目标变量值，和实际目标变量值之间的误差(error)，对cost function的要求是，error越小，cost function越小，反之亦然。也就是说，只要能满足这个条件的函数，都可以作为cost function。

对于逻辑回归的cost function来说，之所以选择了那样一个函数，首先是满足以上要求，其次，是需要这样的函数，才能使对cost function求偏导数，能够得到一个很简洁的结果。这是和模型本身相关的，特别是sigmoid。我想大概人们为了得到这样一个cost fuction，也是费尽了心机。

那么可见，人们选择这样的函数，作为神经网络的cost function，也必然是发现能够有办法对其求偏导数。也即下文的Back Propagation方法。而为什么是这样的cost function，也应该是因为能有办法求偏导。这时的这个Back Propagation更复杂，要回答cost function为什么这样，应该要从为什么Back Propagation是那样的来解开谜题。而Back Propagation是复杂的，所以这两者之间的关系尚不清楚。

**（半）矢量化形式的cost function：**
部分还需要循环。

核心代码：

```
function h = h(Theta1, Theta2, X)
    m = size(X, 1);
    num_labels = size(Theta2, 1);
    h1 = sigmoid([ones(m, 1) X] * Theta1');
    h = sigmoid([ones(m, 1) h1] * Theta2');% m * num_labels
end

h = h(Theta1, Theta2, X);
for iter = 1:m
    yVec = [1:num_labels]' == y(iter);
    J = J - log(h(iter,:)) * yVec - log(1 - h(iter,:)) * (1 - yVec);
end
J = J / m;

J = J + lambda / (2 * m) * (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2)));

```

## Back Propagation

Back Propagation用来计算Cost Function的对于theta的偏导数，从而能pluggin到梯度下降的高级优化方法(比如fminunc)中。

back propagation为什么能求偏导，原理据说复杂。记住back propagation怎么执行的就好。

核心代码：

```
for iter = 1:m
    a1 = [1 X(iter, :)]';
    a2 = [1; sigmoid(Theta1 * a1)];
    a3 = sigmoid(Theta2 * a2);
    yVec = [1:num_labels]' == y(iter);
    delta3 = a3 - yVec;
    delta2 = Theta2' * delta3 .* a2 .* (1 - a2);
    Theta2_grad = Theta2_grad + delta3 * a2';
    delta2 = delta2(2:end);
    Theta1_grad = Theta1_grad + delta2 * a1';
end
Theta1FirstColZero = Theta1;
Theta1FirstColZero(:,1) = 0;
Theta2FirstColZero = Theta2;
Theta2FirstColZero(:,1) = 0;
Theta1_grad = 1 / m * (Theta1_grad + lambda * Theta1FirstColZero);
Theta2_grad = 1 / m * (Theta2_grad + lambda * Theta2FirstColZero);

```

## Implementation

- unroll and reshape: 针对theta、偏导结果d
- random initialization (symmetry breaking): 针对theta
- gradient checking: 针对偏导结果d
