
def hello(name='World'):
    if name == '' or name is None:
        name = 'World'
    return 'Hello, ' + name + '!'
