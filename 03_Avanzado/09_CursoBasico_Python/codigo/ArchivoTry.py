def read():
    try:
        with open('./files/numbers.txt', 'r', encoding='utf-8') as file:
            return [int(l) for l in file]
    finally:
        file.close()

def write(read):
    try:
        with open('./files/numbers-sqr.txt', 'w', encoding='utf-8') as file:
            file.writelines([
                '     x    |  f(x) = x^2    \n',
                '---------------------------\n'
            ])
            for n in read:
                file.writelines([
                    '     {row}    |    {sqr}    \n'.format(row=n, sqr=n**2),
                    '---------------------------\n',
                ])
    finally:
        file.close()

def run():
    res = read()
    write(res)

if __name__ == "__main__":
    run()