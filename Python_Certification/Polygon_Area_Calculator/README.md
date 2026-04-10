# Polygon Area Calculator

freeCodeCamp 认证课程 - 多边形面积计算器

## 功能

### Rectangle 类（矩形）
- **set_width / set_height** - 设置宽高
- **get_area** - 计算面积
- **get_perimeter** - 计算周长
- **get_diagonal** - 计算对角线长度
- **get_picture** - 生成 ASCII 图形
- **get_amount_inside** - 计算能容纳的形状数量

### Square 类（正方形）
- 继承自 Rectangle
- **set_side** - 设置边长
- 自动保持正方形特性

## 使用示例

```python
# 创建矩形
rect = Rectangle(10, 5)
print(rect.get_area())          # 50
print(rect.get_perimeter())     # 30
print(rect.get_diagonal())      # 11.18...

# 创建正方形
square = Square(9)
print(square.get_area())        # 81

# 图形输出
rect2 = Rectangle(4, 6)
print(rect2.get_picture())
# ****
# ****
# ****
# ****
# ****
# ****

# 计算容纳数量
rect3 = Rectangle(10, 10)
rect4 = Rectangle(2, 2)
print(rect3.get_amount_inside(rect4))  # 25
```

## 项目结构

- `Rectangle` 类：矩形几何计算
- `Square` 类：正方形类，继承自 Rectangle
