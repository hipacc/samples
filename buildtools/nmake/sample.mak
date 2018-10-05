all: cpu

cpu: main_cpu.exe
  $**

cuda: main_cuda.exe
  $**

main_cpu.cc: src\main.cpp
  "%HIPACC_PATH%\bin\hipacc.exe" -emit-cpu %HIPACC_OPTS% -o "$@" -I ../../common "$**"

main_cpu.exe: main_cpu.cc
  cl.exe /Ox /W0 /EHsc $** /I "%HIPACC_PATH%\include" /I ..\..\common $(CXX_FLAGS_OPENCV)

main_cuda.cc: src\main.cpp
  "%HIPACC_PATH%\bin\hipacc.exe" -emit-cuda %HIPACC_OPTS% -o "$@" -I ../../common "$**"

main_cuda.exe: main_cuda.cc
  "%CUDA_PATH%\bin\nvcc.exe" -O2 -x cu "$**" -o "$@" -I"%HIPACC_PATH%\include" -I ..\..\common -lcuda -lcudart -lnvrtc $(NVCC_FLAGS_OPENCV)

clean:
  del *.cc *.cu *.cubin *.obj *.jpg >nul 2>&1

distclean: clean
  del main_*.exe >nul 2>&1
