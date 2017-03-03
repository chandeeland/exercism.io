def encode(msg):
    count = 1
    curr = msg[0]
    code = ''
    for i in range(1, len(msg)):
        global count, curr
        if msg[i] == curr:
            count += 1
        else:
            if count > 1:
                code += str(count)
            code += curr
            curr = msg[i]
            count = 1
    if count > 1:
        code += str(count)
    code += curr

    return code
    
def decode(code):
    return
