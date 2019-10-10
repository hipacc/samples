cmake_minimum_required(VERSION 3.14)

if(WIN32)
    add_hipacc_sample_cpu()
    add_hipacc_sample_cuda()
    add_hipacc_sample_opencl(CPU GPU)
endif()
