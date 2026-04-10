"""
预算应用程序 - freeCodeCamp 认证课程项目
用于管理个人预算，支持分类、存款、取款、转账等功能
"""


class Category:
    """预算分类类，用于表示一个独立的预算类别"""

    def __init__(self, name):
        """
        初始化分类

        参数:
            name: 分类名称（如 Food, Clothing 等）
        """
        self.name = name  # 分类名称
        self.ledger = []  # 账本记录列表，存储交易明细

    def check_funds(self, amount):
        """
        检查是否有足够的余额进行取款或转账

        参数:
            amount: 要检查的金额

        返回:
            bool: 余额充足返回 True，否则返回 False
        """
        if amount <= self.get_balance():
            return True
        else:
            return False

    def deposit(self, amount, description=''):
        """
        存款操作

        参数:
            amount: 存款金额
            description: 交易描述（可选）
        """
        self.ledger.append({'amount': amount, 'description': description})

    def withdraw(self, amount, description=''):
        """
        取款操作

        参数:
            amount: 取款金额
            description: 交易描述（可选）

        返回:
            bool: 取款成功返回 True，余额不足返回 False
        """
        # 检查余额是否充足
        if not self.check_funds(amount):
            return False
        # 金额存储为负数表示支出
        amount = -amount
        self.ledger.append({'amount': amount, 'description': description})
        if self.check_funds(amount):
            return True
        else:
            return False

    def get_balance(self):
        """
        获取当前分类的余额

        返回:
            float: 当前余额（收入为正，支出为负）
        """
        balance = 0
        for item in self.ledger:
            balance += item['amount']
        return balance

    def transfer(self, amount, category):
        """
        转账操作：将金额从当前分类转到目标分类

        参数:
            amount: 转账金额
            category: 目标分类对象

        返回:
            bool: 转账成功返回 True，余额不足返回 False
        """
        if self.check_funds(amount):
            # 从当前分类取款
            self.withdraw(amount, f'Transfer to {category.name}')
            # 向目标分类存款
            category.deposit(amount, f'Transfer from {self.name}')
            return True
        else:
            return False

    def __str__(self):
        """
        自定义字符串输出格式

        返回:
            str: 格式化的分类账单信息
        """
        # 标题居中显示
        title = self.name.center(30, '*')
        items = ''
        total = 0
        # 遍历账本生成每条记录
        for item in self.ledger:
            # 描述左对齐23字符，金额右对齐7字符
            items += f"\n{item['description'][:23].ljust(23)}{format(item['amount'], '.2f').rjust(7)}"
            total += item['amount']
            # 最后一条记录后添加总余额
            if item == self.ledger[-1]:
                balance = self.get_balance()
                items += f"\nTotal: {format(balance, '.2f')}"
        return title + items


def create_spend_chart(categories):
    """
    创建支出百分比图表

    参数:
        categories: Category 对象列表

    返回:
        str: 格式化的 ASCII 柱状图
    """
    # 统计每个分类的总支出
    spending_by_category = []
    for category in categories:
        spending = 0
        for item in category.ledger:
            # amount 为负数表示支出
            if item['amount'] < 0:
                spending += abs(item['amount'])
        spending_by_category.append(spending)

    # 计算总支出
    total_spending = sum(spending_by_category)

    # 计算每个分类的支出百分比（向下取整到10的倍数）
    percentages = []
    for spending in spending_by_category:
        if total_spending > 0:
            percentage = int((spending / total_spending) * 100)
            percentage = (percentage // 10) * 10
        else:
            percentage = 0
        percentages.append(percentage)

    # 图表标题
    chart = "Percentage spent by category\n"

    # 初始化空格列表（用于放置 'o' 标记）
    list_space = [" " for i in range(0, 3 * len(categories) - 1)]

    # 从 100% 到 0%，每行下降 10%
    for label in range(100, -1, -10):
        chart += " " * (3 - len(str(label))) + f'{label}|'
        # 标记达到当前百分比的分类
        for idx, percentage in enumerate(percentages):
            if percentage >= label:
                position = idx * 3 + 1
                list_space[position] = "o"
        chart += "".join(list_space) + " " * 2 + "\n"

    # 添加底部分隔线
    temp_list = list_space.copy()
    temp_list.append('-')
    temp_list.append('-')
    temp_list = ["-" for _ in temp_list]
    chart += "    " + "".join(temp_list) + "\n"

    # 添加分类名称（垂直显示）
    max_name_length = max(len(category.name) for category in categories)
    for i in range(max_name_length):
        chart += "     "
        for j, category in enumerate(categories):
            if i == max_name_length - 1 and j == len(categories) - 1:
                chart += category.name[i] if len(category.name) > i else " "
                chart += "  "
                return chart
            elif j == len(categories) - 1:
                chart += category.name[i] if len(category.name) > i else " "
                chart += "  \n"
            else:
                chart += category.name[i] if len(category.name) > i else " "
                chart += " " * 2

    return chart


# ========== 测试代码 ==========
# 创建 Food 分类
food = Category('Food')
food.deposit(1000, 'initial deposit')  # 存入 1000 元
food.withdraw(10.15, 'groceries')  # 购买杂货
food.withdraw(15.89, 'restaurant and more food for dessert')  # 餐厅消费

# 创建 Clothing 分类
clothing = Category('Clothing')

# 从 Food 分类转账 50 元到 Clothing 分类
food.transfer(50, clothing)

# 打印 Food 分类的账单
print(food)

# 打印支出图表
print(create_spend_chart([food, clothing]))