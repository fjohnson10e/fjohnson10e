from functools import lru_cache
import sys

OUTPUT_IN_FILE = False


@lru_cache  # save return of graycode(n) for next calls
def gray_code(n):
    if n == 1:
        return ["0", "1"]   # Gray code of size 1

    size_lower_gray_code = gray_code(n - 1)                             # to generate the Gray code of size n, we get the Gray code of size n-1
    size_lower_gray_code_mirror = reversed(size_lower_gray_code.copy()) # the reflected Gray code of size n-1

    # return list with elements from size_lower_gray_code with "0" in front and
    # size_lower_gray_code_mirror with "1" in front
    return list(map(lambda x: "0" + x, size_lower_gray_code)) + list(map(lambda x: "1" + x, size_lower_gray_code_mirror))


def main():
    for i in range(1, 6):   # print gray codes of sizes from 1 to 5
        print(*gray_code(i))


if __name__ == "__main__":
    if OUTPUT_IN_FILE:
        with open("output.txt", "w") as sys.stdout:  # output in output.txt
            main()
    else:
        main()