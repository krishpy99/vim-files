import os


for path, subdir, files in os.walk('/'):
    for name in files:
        print(os.path.join(path, name))
