import os
import sys

def analyze(file_path, option = None):
  try:
    
    match option:
      case '-c':
        return f'{__get_bytes(file_path)} {file_path}'
      case '-l':
        return f'{__get_number_of_lines(file_path)} {file_path}'
      case '-w':
        return f'{__get_number_of_words(file_path)} {file_path}'
      case '-m':
        return f'{__get_number_of_characters(file_path)} {file_path}'
      case None:
        return f'{__get_bytes(file_path)} {__get_number_of_lines(file_path)} {__get_number_of_words(file_path)} {__get_number_of_characters(file_path)} {file_path}'
      case _: 
        raise "Invalid option"
  except FileNotFoundError:
        print('There is no such file or directory')
        sys.exit()  
    
def __get_bytes(file):
  st = os.stat(file)
  
  return st.st_size


def __get_number_of_lines(f):
  number_of_lines = 0
  with open(f, 'r') as fp:
    number_of_lines = len(fp.readlines())
  
  return number_of_lines


def __get_number_of_words(f):
  number_of_words = 0
  with open(f,'r') as file:
    data = file.read()
    lines = data.split()
    number_of_words += len(lines)
    
  return number_of_words
  
def __get_number_of_characters(f):
  number_of_characters = 0
  with open(f, 'r') as f:
    for line in f:
      for letter in line:
        for i in letter:
          if(i !=" " and i !="\n"):
            number_of_characters += 1
  return number_of_characters
