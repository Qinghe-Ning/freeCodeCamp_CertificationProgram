class HashTable:
    def __init__(self):
        self.collection = {}  # 使用字典存储哈希表数据

    def hash(self, key):
        # 简单的哈希函数：返回键所有字符的ASCII码之和
        return sum(ord(char) for char in key)

    def add(self, key, value):
        hash_key = self.hash(key)  # 计算哈希值
        if hash_key not in self.collection:  # 如果哈希槽不存在，创建新的字典
            self.collection[hash_key] = {}
        self.collection[hash_key][key] = value  # 存储键值对
        return hash_key

    def remove(self, key):
        hash_key = self.hash(key)  # 计算哈希值
        if hash_key in self.collection and key in self.collection[hash_key]:  # 检查键是否存在
            del self.collection[hash_key][key]  # 删除键值对
            if not self.collection[hash_key]:  # 如果哈希槽为空，清理该槽
                del self.collection[hash_key]
            return True
        return False

    def lookup(self, key):
        hash_key = self.hash(key)  # 计算哈希值
        if hash_key in self.collection and key in self.collection[hash_key]:  # 检查键是否存在
            return self.collection[hash_key][key]  # 返回对应的值
        return None