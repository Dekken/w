#!/usr/bin/env bash

set -ex

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

swig -python -py3 -c++ -modern -new_repr -I. \
          -outdir $CWD/build \
          -o $CWD/swig_wrap.cpp $CWD/swig.i

g++ -I/usr/include/python3.5m -fPIC -shared  -o build/_swigger.so swig_wrap.cpp