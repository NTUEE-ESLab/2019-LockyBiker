class IO():
    def __init__(self):
        with open('/home/jeopardy/final_project/key', 'r') as f:
            self.key = f.read()
        with open('/home/jeopardy/final_project/mac_addr', 'r') as f:
            self.addr = f.read()

    def getKey(self):
        return self.key
    
    def setKey(self, key):
        self.key = key
        with open('/home/jeopardy/final_project/key', 'w') as f:
            f.write(key)
    
    def getAddr(self):
        return self.addr
    
    def setAddr(self, addr):
        self.addr = addr
        with open('/home/jeopardy/final_project/mac_addr', 'w') as f:
            f.write(addr)