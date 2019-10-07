cmake_minimum_required(VERSION 3.14)

get_filename_component(SAMPLE_NAME "${CMAKE_CURRENT_LIST_DIR}" NAME)

project(${SAMPLE_NAME})

add_hipacc_sample_cpu()
add_hipacc_sample_cuda(HIDE) # unstable
