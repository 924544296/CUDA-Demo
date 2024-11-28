#include "LearnCUDA.cuh"


__global__ void hello_from_gpu()
{
	printf("Hello World from block - (%d %d %d), thread - (%d %d %d)!\n", blockIdx.x, blockIdx.y, blockIdx.z, threadIdx.x, threadIdx.y, threadIdx.z);
}

