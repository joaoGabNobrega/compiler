import sys
from antlr4 import FileStream, CommonTokenStream
from CSubsetLexer import CSubsetLexer
from CSubsetParser import CSubsetParser

def main(argv):
    if len(argv) != 2:
        print("Usage: python main.py <source_file>")
        return

    input_stream = FileStream(argv[1])
    lexer = CSubsetLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = CSubsetParser(stream)

    tree = parser.prog()
    print(tree.toStringTree(recog=parser))

if __name__ == '__main__':
    main(sys.argv)
