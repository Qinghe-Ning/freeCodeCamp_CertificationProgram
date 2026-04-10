def add_setting(settings, setting):
    """
    添加新的设置项

    参数:
        settings: 存储设置的字典
        setting: 元组，包含设置名称和值 (key, value)

    返回:
        表示操作结果的字符串消息
    """
    # 将设置名称和值转换为小写，统一格式
    lower_setting = (setting[0].lower(), setting[1].lower())
    # 检查设置是否已存在
    if lower_setting[0] in settings:
        return f"Setting 'theme' already exists! Cannot add a new setting with this name."
    else:
        # 使用 setdefault 仅在键不存在时添加
        settings.setdefault(lower_setting[0], lower_setting[1])
        return f"Setting '{setting[0]}' added with value '{setting[1]}' successfully!"


def update_setting(settings, setting):
    """
    更新已有的设置项

    参数:
        settings: 存储设置的字典
        setting: 元组，包含设置名称和值 (key, value)

    返回:
        表示操作结果的字符串消息
    """
    # 将设置名称和值转换为小写
    lower_setting = (setting[0].lower(), setting[1].lower())
    # 检查设置是否存在
    if lower_setting[0] in settings:
        # 更新设置值
        settings[lower_setting[0]] = lower_setting[1]
        return f"Setting '{setting[0]}' updated to '{setting[1]}' successfully!"
    else:
        return f"Setting '{setting[0]}' does not exist! Cannot update a non-existing setting."


def delete_setting(settings, key):
    """
    删除指定的设置项

    参数:
        settings: 存储设置的字典
        key: 要删除的设置名称

    返回:
        表示操作结果的字符串消息
    """
    # 将键转换为小写以匹配
    lower_key = key.lower()
    # 检查设置是否存在
    if lower_key in settings:
        # 删除设置项
        del settings[lower_key]
        return f"Setting '{lower_key}' deleted successfully!"
    else:
        return f"Setting not found!"


def view_settings(settings):
    """
    查看所有当前设置

    参数:
        settings: 存储设置的字典

    返回:
        格式化的设置列表字符串，如果没有设置则返回提示信息
    """
    # 检查设置字典是否为空
    if not settings:
        return "No settings available."
    # 格式化输出所有设置，键使用首字母大写格式
    return "Current User Settings:\n" + '\n'.join(f"{key.title()}: {value}" for key, value in settings.items()) + '\n'


# 测试代码
# 初始化测试用的设置字典
test_settings = {'theme': 'dark', 'notifications': 'enabled', 'volume': 'high'}
# 调用查看设置函数
operation = view_settings(test_settings)
# 打印结果
print(operation)