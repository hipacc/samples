cmake_minimum_required(VERSION 3.14)

add_hipacc_sample_dsl()
#add_hipacc_sample_cpu()
add_hipacc_sample_cuda()
if(NOT WIN32)
    add_hipacc_sample_opencl(CPU GPU) # exceeds path length on windows
endif()
	
