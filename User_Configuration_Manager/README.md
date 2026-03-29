# Settings Manager

一个简单的 Python 设置管理工具。

## 功能

- **添加设置** (`add_setting`) - 添加新的键值对设置
- **更新设置** (`update_setting`) - 修改已有设置的值
- **删除设置** (`delete_setting`) - 删除指定的设置项
- **查看设置** (`view_settings`) - 显示所有当前设置

## 使用示例

```python
test_settings = {'theme': 'dark', 'notifications': 'enabled'}

# 查看设置
print(view_settings(test_settings))

# 添加新设置
print(add_setting(test_settings, ('language', 'zh')))

# 更新设置
print(update_setting(test_settings, ('theme', 'light')))

# 删除设置
print(delete_setting(test_settings, 'volume'))
```

## 说明

- 设置名称和值会自动转换为小写存储
- 输出时设置名称会转换为首字母大写格式
