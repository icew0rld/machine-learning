# Visualization

## plot

![](屏幕快照 2019-01-06 13.48.45.png)

```matlab
function plotData(x, y)
figure;
plot(x, y, 'rx', 'MarkerSize', 3);
xlabel('Population of City in 10,1000s');
ylabel('Profit in $10,0000s');
end
```



![](屏幕快照 2019-01-06 13.47.57.png)

```matlab
plot(x, y, '-');%-画线
```

## surf

![](屏幕快照 2019-01-06 13.49.02.png)

```matlab
surf(x, y, Z);
```



## contour

![](屏幕快照 2019-01-06 13.49.07.png)

```matlab
contour(x, y, Z);
```

