# Budget Application

freeCodeCamp 认证课程 - Python 预算管理应用

## 功能

- **分类管理** - 创建不同的预算类别（如 Food, Clothing 等）
- **存款** - 向分类中添加收入
- **取款** - 从分类中支出（自动检查余额）
- **转账** - 在不同分类之间转移资金
- **账单查看** - 以格式化方式查看分类账目
- **支出图表** - 生成 ASCII 柱状图显示各类别支出占比

## 使用示例

```python
# 创建分类
food = Category('Food')
food.deposit(1000, 'initial deposit')
food.withdraw(10.15, 'groceries')

clothing = Category('Clothing')

# 转账
food.transfer(50, clothing)

# 查看账单
print(food)

# 生成支出图表
print(create_spend_chart([food, clothing]))
```

## 输出示例

```
************* Food *************
initial deposit             1000.00
groceries                     -10.15
restaurant and more foo     -15.89
Total: 973.96
```

## 项目结构

- `Category` 类：核心预算分类实现
- `create_spend_chart` 函数：生成支出百分比图表
