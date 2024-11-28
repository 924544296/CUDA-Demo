#include "LearnCUDA.cuh"


//#define T int
using T = long long;


int main()
{
	/* 打印CUDA版本 */
	int runtimeVersion = 0;
	CHECK(cudaRuntimeGetVersion(&runtimeVersion)); 
	int driverVersion = 0;
	CHECK(cudaDriverGetVersion(&driverVersion));
	std::cout << "CUDA Runtime Version: " << runtimeVersion / 1000 << "." << (runtimeVersion % 1000) / 10 << std::endl; 
	std::cout << "CUDA Driver Version: " << driverVersion / 1000 << "." << (driverVersion % 1000) / 10 << std::endl;
	std::cout << "CUDA Compiler Version: " << __CUDACC_VER_MAJOR__ << "." << __CUDACC_VER_MINOR__ << std::endl;



	/* 核函数中打印信息 */
	const dim3 grid_size(2, 3, 4);
	const dim3 block_size(1, 1, 2);
	//hello_from_gpu <<<1, block_size>>>();
	//hello_from_gpu <<<grid_size, 1>>> ();
	hello_from_gpu <<<grid_size, block_size >>> ();
	CHECK(cudaGetLastError());
	CHECK(cudaDeviceSynchronize());
	cudaDeviceSynchronize();



	/* 两数组相加 */
	//const int N = 100000000;
	//const int M = sizeof(T) * N;
	//T* h_a = (T*)malloc(M);
	//T* h_b = (T*)malloc(M);
	//T* h_c = (T*)malloc(M);

	//for (int n = 0; n < N; n++)
	//{
	//	h_a[n] = (T)n;
	//	h_b[n] = 2 * (T)n;
	//}

	//T *d_a, *d_b, *d_c;
	////cudaMalloc((void**)&d_a, M);
	////cudaMalloc((void**)&d_b, M);
	////cudaMalloc((void**)&d_c, M);
	//cudaMalloc(&d_a, M);
	//cudaMalloc(&d_b, M);
	//cudaMalloc(&d_c, M);

	//cudaMemcpy(d_a, h_a, M, cudaMemcpyHostToDevice);
	//cudaMemcpy(d_b, h_b, M, cudaMemcpyHostToDevice);

	//const dim3 grid_size(N / 1024, 4, 2);
	//const dim3 block_size(16, 4, 2);
	////add_1d<<<grid_size, block_size>>>(d_a, d_b, d_c, N);
	////add_2d<<<grid_size, block_size>>>(d_a, d_b, d_c, N);
	////add_3d<<<grid_size, block_size>>>(d_a, d_b, d_c, N);
	////add_1d_loop<<<grid_size, block_size>>>(d_a, d_b, d_c, N);
	////add_2d_loop<<<grid_size, block_size>>>(d_a, d_b, d_c, N);
	//add_3d_loop<<<grid_size, block_size>>>(d_a, d_b, d_c, N);
	//CHECK(cudaGetLastError());
	//CHECK(cudaDeviceSynchronize());

	//cudaMemcpy(h_c, d_c, M, cudaMemcpyDeviceToHost);
	//std::cout << "h_c[0] = " << h_c[0] << std::endl;
	//std::cout << "h_c[N-1] = " << h_c[N-1] << std::endl;

	//free(h_a);
	//free(h_b);
	//free(h_c);
	//cudaFree(d_a);
	//cudaFree(d_b);
	//cudaFree(d_c);



	/* 点积 */
	//const int N = 10000;
	//dim3 grid_size(64, 1, 1);
	//dim3 block_size(128, 1, 1);
	//T *h_a, *h_b, *h_c, *d_a, *d_b, *d_c, h_c_sum;

	//h_a = new T[N];
	//h_b = new T[N];
	//h_c = new T[grid_size.x * grid_size.y * grid_size.z];

	//CHECK(cudaMalloc((void**)&d_a, N * sizeof(T)));
	//CHECK(cudaMalloc((void**)&d_b, N * sizeof(T)));
	//CHECK(cudaMalloc((void**)&d_c, grid_size.x * grid_size.y * grid_size.z * sizeof(T)));

	//for (int i = 0; i < N; i++)
	//{
	//	h_a[i] = (T)i;
	//	h_b[i] = (T)i*2;
	//}

	//CHECK(cudaMemcpy(d_a, h_a, N * sizeof(T), cudaMemcpyHostToDevice));
	//CHECK(cudaMemcpy(d_b, h_b, N * sizeof(T), cudaMemcpyHostToDevice));

	//dot_product<<<grid_size, block_size, block_size.x * block_size.y * block_size.z * sizeof(T)>>>(d_a, d_b, d_c, N);
	//CHECK(cudaGetLastError());
	//CHECK(cudaDeviceSynchronize());
	//cudaDeviceSynchronize();

	//CHECK(cudaMemcpy(h_c, d_c, grid_size.x * grid_size.y * grid_size.z * sizeof(T), cudaMemcpyDeviceToHost));

	//std::cout << "h_c[0] = " << h_c[0] << std::endl;
	//std::cout << "h_c[N-1] = " << h_c[grid_size.x * grid_size.y * grid_size.z - 1] << std::endl;
	//h_c_sum = 0;
	//for (int i = 0; i < grid_size.x * grid_size.y * grid_size.z; i++)
	//{
	//	//std::cout << "h_c[" << i << "] = " << h_c[i] << std::endl;
	//	h_c_sum += h_c[i];
	//}
	//std::cout << "h_c_sum = " << h_c_sum << std::endl;

	//CHECK(cudaFree(d_a));
	//CHECK(cudaFree(d_b));
	//CHECK(cudaFree(d_c));
	//delete[] h_a;
	//delete[] h_b;
	//delete[] h_c;


	/* 归约 */


	std::cout << std::endl << "---->Done." << std::endl;
	return 0;
}