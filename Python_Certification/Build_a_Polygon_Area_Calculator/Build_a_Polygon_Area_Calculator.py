"""
多边形面积计算器 - freeCodeCamp 认证课程项目
提供矩形和正方形的面积、周长、对角线计算等功能
"""


class Rectangle:
    """矩形类，提供基本的几何计算功能"""

    def __init__(self, width, height):
        """
        初始化矩形

        参数:
            width: 矩形宽度
            height: 矩形高度
        """
        self.width = width   # 矩形宽度
        self.height = height  # 矩形高度

    def set_width(self, width):
        """
        设置矩形宽度

        参数:
            width: 新的宽度值
        """
        self.width = width

    def set_height(self, height):
        """
        设置矩形高度

        参数:
            height: 新的高度值
        """
        self.height = height

    def get_area(self):
        """
        计算矩形面积

        返回:
            int/float: 面积（宽 × 高）
        """
        return self.width * self.height

    def get_perimeter(self):
        """
        计算矩形周长

        返回:
            int/float: 周长（2 × 宽 + 2 × 高）
        """
        return 2 * (self.width + self.height)

    def get_diagonal(self):
        """
        计算矩形对角线长度

        返回:
            float: 对角线长度（勾股定理）
        """
        return (self.width ** 2 + self.height ** 2) ** 0.5

    def get_picture(self):
        """
        生成矩形的 ASCII 图形表示

        返回:
            str: 用 '*' 组成的矩形图案，超大尺寸返回提示信息
        """
        # 限制最大尺寸，防止生成过大图形
        if self.width > 50 or self.height > 50:
            return "Too big for picture."
        picture = ""
        # 每行生成宽度个 '*'
        for i in range(self.height):
            picture += "*" * self.width + "\n"
        return picture

    def get_amount_inside(self, shape):
        """
        计算当前矩形能容纳多少个指定形状

        参数:
            shape: 另一个 Rectangle 或 Square 对象

        返回:
            int: 能容纳的数量
        """
        # 横向能容纳的数量
        width_fit = self.width // shape.width
        # 纵向能容纳的数量
        height_fit = self.height // shape.height
        return width_fit * height_fit

    def __repr__(self):
        """
        自定义字符串表示

        返回:
            str: 矩形的字符串描述
        """
        return f"Rectangle(width={self.width}, height={self.height})"


class Square(Rectangle):
    """正方形类，继承自 Rectangle，边长相等"""

    def __init__(self, side):
        """
        初始化正方形

        参数:
            side: 正方形边长
        """
        # 调用父类构造函数，宽高相等
        super().__init__(side, side)

    def set_width(self, width):
        """
        设置正方形边长（重写父类方法）

        参数:
            width: 新的边长
        """
        self.width = width
        self.height = width  # 保持正方形特性

    def set_height(self, height):
        """
        设置正方形边长（重写父类方法）

        参数:
            height: 新的边长
        """
        self.width = height
        self.height = height  # 保持正方形特性

    def set_side(self, side):
        """
        设置正方形边长（专用方法）

        参数:
            side: 新的边长
        """
        self.width = side
        self.height = side

    def __repr__(self):
        """
        自定义字符串表示

        返回:
            str: 正方形的字符串描述
        """
        return f"Square(side={self.width})"
