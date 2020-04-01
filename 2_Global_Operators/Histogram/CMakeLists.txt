cmake_minimum_required(VERSION 3.14)
# add_hipacc_sample_cpu()
if(WIN32)
add_hipacc_sample_cuda()
endif()
# add_hipacc_sample_opencl(CPU GPU)

