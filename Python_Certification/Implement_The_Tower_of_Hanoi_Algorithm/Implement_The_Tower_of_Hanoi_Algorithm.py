def hanoi_solver(n):
    """
    解决汉诺塔问题，返回每一步三个杆子的状态字符串。
    
    参数:
        n (int): 盘子的总数
    
    返回:
        str: 每行一个状态，包含初始状态和每次移动后的状态
    """
    # 初始化三个杆子：第一根杆子从底部到顶部依次为 n, n-1, ..., 1
    rods = [list(range(n, 0, -1)), [], []]
    states = []
    
    # 记录初始状态
    states.append(f"{rods[0]} {rods[1]} {rods[2]}")
    
    def move_disks(num, src, dst, aux):
        """递归移动盘子"""
        if num == 1:
            # 移动一个盘子：从 src 杆顶部弹出，压入 dst 杆
            disk = rods[src].pop()
            rods[dst].append(disk)
            states.append(f"{rods[0]} {rods[1]} {rods[2]}")
        else:
            # 先将 num-1 个盘子从 src 移到 aux
            move_disks(num - 1, src, aux, dst)
            # 移动最大的盘子
            disk = rods[src].pop()
            rods[dst].append(disk)
            states.append(f"{rods[0]} {rods[1]} {rods[2]}")
            # 再将 num-1 个盘子从 aux 移到 dst
            move_disks(num - 1, aux, dst, src)
    
    # 开始移动：将 n 个盘子从杆0 移到杆2，借助杆1
    if n > 0:
        move_disks(n, 0, 2, 1)
    
    return "\n".join(states)