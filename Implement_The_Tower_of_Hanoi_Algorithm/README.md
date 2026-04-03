# Implement The Tower of Hanoi Algorithm

使用递归算法解决汉诺塔问题。

## 功能

- `hanoi_solver(n)` - 解决 n 层汉诺塔问题，返回每一步三个杆子的状态

## 算法说明

汉诺塔问题的递归解法：
1. 将 n-1 个盘子从源杆移动到辅助杆
2. 将最大的盘子从源杆移动到目标杆
3. 将 n-1 个盘子从辅助杆移动到目标杆

## 使用示例

```python
result = hanoi_solver(3)
print(result)
```

输出：
```
[3, 2, 1] [] []
[2, 1] [] [3]
[1] [2] [3]
...
```