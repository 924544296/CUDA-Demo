cmake_minimum_required (VERSION 3.8)

# Enable Hot Reload for MSVC compilers if supported.
if (POLICY CMP0141)
  cmake_policy(SET CMP0141 NEW)
  set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<IF:$<AND:$<C_COMPILER_ID:MSVC>,$<CXX_COMPILER_ID:MSVC>>,$<$<CONFIG:Debug,RelWithDebInfo>:EditAndContinue>,$<$<CONFIG:Debug,RelWithDebInfo>:ProgramDatabase>>")
endif()

project ("LearnCUDA" LANGUAGES CXX CUDA)


###
set(CMAKE_CUDA_STANDARD 17)
set(CMAKE_CXX_STANDARD 17)
# opencv
#set(OpenCV_DIR "D:/software/opencv/opencv490/build")
#find_package(OpenCV REQUIRED)
#include_directories(${OpenCV_INCLUDE_DIRS})
#include_directories("D:/software/opencv/opencv490/build/include"
#                    "D:/software/opencv/opencv490/build/include/opencv2")
#link_directories("D:/software/opencv/opencv490/build/x64/vc16/lib")
# libtorch
#set(Torch_DIR "D:/software/libtorch/share/cmake/Torch")
#find_package(Torch REQUIRED)
#include_directories("D:/software/libtorch/include"
#                    "D:/software/libtorch/include/torch/csrc/api/include")
#link_directories("D:/software/libtorch/lib")
# CUDA
include_directories("D:\\software\\CUDA\\CUDA12_6\\include")
link_directories("D:\\software\\CUDA\\CUDA12_6\\lib\\x64")
# TensorRT
#include_directories("D:\\software\\TensorRT\\TensorRT-10.2.0.19.Windows.win10.cuda-12.5\\include")
#link_directories("D:\\software\\TensorRT\\TensorRT-10.2.0.19.Windows.win10.cuda-12.5\\lib")
###


# Add source to this project's executable.
add_executable (LearnCUDA "LearnCUDA.cu" "LearnCUDA.cuh" "main.cu")

if (CMAKE_VERSION VERSION_GREATER 3.12)
  set_property(TARGET LearnCUDA PROPERTY CXX_STANDARD 20)
endif()

# TODO: Add tests and install targets if needed.
# opencv
#target_link_libraries(Generation ${OpenCV_LIBS})
#target_link_libraries(LearnCUDA opencv_world490d)
# libtorch
#target_link_libraries(LearnCUDA ${TORCH_LIBRARIES})
#target_link_libraries(LearnCUDA torch torch_cuda torch_cpu c10_cuda c10 fbgemm asmjit)
# CUDA
target_link_libraries(LearnCUDA cudart)
# TensorRT
#target_link_libraries(LearnCUDA nvinfer nvinfer_plugin nvonnxparser)
#target_link_libraries(LearnCUDA nvinfer_10 nvinfer_plugin_10 nvonnxparser_10)