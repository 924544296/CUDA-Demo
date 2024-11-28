

template<typename T>
__global__ void add_1d(const T* a, const T* b, T* c, const int N)
{
	//
	const int id_element = threadIdx.x + blockIdx.x * blockDim.x;
	//
	if (id_element >= N)
	{
		return;
	}
	c[id_element] = a[id_element] + b[id_element];
}


template<typename T>
__global__ void add_2d(const T* a, const T* b, T* c, const int N)
{
	//
	const int id_block = blockIdx.x + blockIdx.y * gridDim.x;
	const int id_thread = threadIdx.x + threadIdx.y * blockDim.x;
	const int id_element = id_thread + id_block * blockDim.x * blockDim.y;
	//
	if (id_element >= N)
	{
		return;
	}
	c[id_element] = a[id_element] + b[id_element];
}


template<typename T>
__global__ void add_3d(const T* a, const T* b, T* c, const int N)
{
	//
	const int id_block = blockIdx.x + blockIdx.y * gridDim.x + blockIdx.z * gridDim.x * gridDim.y;
	const int id_thread = threadIdx.x + threadIdx.y * blockDim.x + threadIdx.z * blockDim.x * blockDim.y;
	const int id_element = id_thread + id_block * blockDim.x * blockDim.y * blockDim.z;
	//
	if (id_element >= N)
	{
		return;
	}
	c[id_element] = a[id_element] + b[id_element];
}


template<typename T> 
__global__ void add_1d_loop(const T* a, const T* b, T* c, const int N)
{
	//
	int id_element = threadIdx.x + blockIdx.x * blockDim.x;
	//
	while (id_element < N)
	{
		c[id_element] = a[id_element] + b[id_element];
		id_element += blockDim.x * gridDim.x;
	}
}


template<typename T>
__global__ void add_2d_loop(const T* a, const T* b, T* c, const int N)
{
	//
	const int id_block = blockIdx.x + blockIdx.y * gridDim.x;
	const int id_thread = threadIdx.x + threadIdx.y * blockDim.x;
	int id_element = id_thread + id_block * blockDim.x * blockDim.y;
	//
	while (id_element < N)
	{
		c[id_element] = a[id_element] + b[id_element];
		id_element += blockDim.x * blockDim.y * gridDim.x * gridDim.y;
	}
}


template<typename T>
__global__ void add_3d_loop(const T* a, const T* b, T* c, const int N)
{
	//
	const int id_block = blockIdx.x + blockIdx.y * gridDim.x + blockIdx.z * gridDim.x * gridDim.y;
	const int id_thread = threadIdx.x + threadIdx.y * blockDim.x + threadIdx.z * blockDim.x * blockDim.y;
	int id_element = id_thread + id_block * blockDim.x * blockDim.y * blockDim.z;
	//
	while (id_element < N)
	{
		c[id_element] = a[id_element] + b[id_element];
		id_element += blockDim.x * blockDim.y * blockDim.z * gridDim.x * gridDim.y * gridDim.z;
	}
}


template<typename T>
__global__ void dot_product(const T* a, const T* b, T* c, const int N)
{
	//
	const int id_block = blockIdx.x + blockIdx.y * gridDim.x + blockIdx.z * gridDim.x * gridDim.y;
	const int id_thread = threadIdx.x + threadIdx.y * blockDim.x + threadIdx.z * blockDim.x * blockDim.y;
	int id_element = id_thread + id_block * blockDim.x * blockDim.y * blockDim.z;
	//const int id_block = blockIdx.x;
	//const int id_thread = threadIdx.x;
	//int id_element = threadIdx.x + blockIdx.x * blockDim.x;
	//
	T temp = (T)0;
	while (id_element < N)
	{
		temp += a[id_element] * b[id_element];
		id_element += blockDim.x * blockDim.y * blockDim.z * gridDim.x * gridDim.y * gridDim.z;
	}
	//
	//__shared__ T shared_temp[128];
	extern __shared__ T shared_temp[];
	shared_temp[id_thread] = temp;
	__syncthreads();
	//
	int i = blockDim.x * blockDim.y * blockDim.z / 2;
	while (i != 0)
	{
		if (id_thread < i)
		{
			shared_temp[id_thread] += shared_temp[id_thread + i];
		}
		__syncthreads();
		i /= 2;
	}
	//
	if (id_thread == 0)
	{
		c[id_block] = shared_temp[0];
	}
}


template<typename T>
__global__ void reduction1(const T* a, const T* b, T* c, const int N)
{
	//
	const int id_block = blockIdx.x + blockIdx.y * gridDim.x + blockIdx.z * gridDim.x * gridDim.y;
	const int id_thread = threadIdx.x + threadIdx.y * blockDim.x + threadIdx.z * blockDim.x * blockDim.y;
	int id_element = id_thread + id_block * blockDim.x * blockDim.y * blockDim.z;
	//

}