#pragma once


#include <iostream>
#include <cuda_runtime.h>
//#include <stdio.h>
#include "LearnCUDA.inl"


#define CHECK(call)\
do\
{\
    const cudaError_t error = call;\
    if (error != cudaSuccess)\
    {\
        std::cerr << std::endl << "--> Error at file: " << __FILE__ << ", line: " << __LINE__ << std::endl;\
        std::cerr << "Error code: " << error << std::endl;\
        std::cerr << "Error name: " << cudaGetErrorName(error) << std::endl;\
        std::cerr << "Error text: " << cudaGetErrorString(error) << std::endl;\
        exit(-1);\
    }\
} while(0)


__global__ void hello_from_gpu();
template<typename T> __global__ void add_1d(const T * a, const T * b, T * c, const int N);
template<typename T> __global__ void add_2d(const T * a, const T * b, T * c, const int N);
template<typename T> __global__ void add_3d(const T * a, const T * b, T * c, const int N);
template<typename T> __global__ void add_1d_loop(const T * a, const T * b, T * c, const int N);
template<typename T> __global__ void add_2d_loop(const T * a, const T * b, T * c, const int N);
template<typename T> __global__ void add_3d_loop(const T * a, const T * b, T * c, const int N);
template<typename T> __global__ void dot_product(const T * a, const T * b, T * c, const int N);
template<typename T> __global__ void reduction1(const T * a, const T * b, T * c, const int N);
template<typename T> __global__ void reduction2(const T * a, const T * b, T * c, const int N);
template<typename T> __global__ void reduction3(const T * a, const T * b, T * c, const int N);
template<typename T> __global__ void reduction4(const T * a, const T * b, T * c, const int N);
template<typename T> __global__ void reduction5(const T * a, const T * b, T * c, const int N);