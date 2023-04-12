// RUN: %run_test hipify "%s" "%t" %hipify_args 4 --skip-excluded-preprocessor-conditional-blocks --experimental --roc --miopen %clang_args -D__CUDA_API_VERSION_INTERNAL

// CHECK: #include <hip/hip_runtime.h>
#include <cuda_runtime.h>
#include <stdio.h>
// CHECK: #include "miopen/miopen.h"
#include "cudnn.h"

int main() {
  printf("15. cuDNN API to MIOpen API synthetic test\n");

  // CHECK: miopenStatus_t dnnStatus_t;
  // CHECK-NEXT: miopenStatus_t STATUS_SUCCESS = miopenStatusSuccess;
  // CHECK-NEXT: miopenStatus_t STATUS_NOT_INITIALIZED = miopenStatusNotInitialized;
  // CHECK-NEXT: miopenStatus_t STATUS_ALLOC_FAILED = miopenStatusAllocFailed;
  // CHECK-NEXT: miopenStatus_t STATUS_BAD_PARAM = miopenStatusBadParm;
  // CHECK-NEXT: miopenStatus_t STATUS_INTERNAL_ERROR = miopenStatusInternalError;
  // CHECK-NEXT: miopenStatus_t STATUS_INVALID_VALUE = miopenStatusInvalidValue;
  // CHECK-NEXT: miopenStatus_t STATUS_NOT_SUPPORTED = miopenStatusUnsupportedOp;
  cudnnStatus_t dnnStatus_t;
  cudnnStatus_t STATUS_SUCCESS = CUDNN_STATUS_SUCCESS;
  cudnnStatus_t STATUS_NOT_INITIALIZED = CUDNN_STATUS_NOT_INITIALIZED;
  cudnnStatus_t STATUS_ALLOC_FAILED = CUDNN_STATUS_ALLOC_FAILED;
  cudnnStatus_t STATUS_BAD_PARAM = CUDNN_STATUS_BAD_PARAM;
  cudnnStatus_t STATUS_INTERNAL_ERROR = CUDNN_STATUS_INTERNAL_ERROR;
  cudnnStatus_t STATUS_INVALID_VALUE = CUDNN_STATUS_INVALID_VALUE;
  cudnnStatus_t STATUS_NOT_SUPPORTED = CUDNN_STATUS_NOT_SUPPORTED;

  // CHECK: miopenStatus_t status;
  cudnnStatus_t status;

  // CHECK: miopenHandle_t handle;
  cudnnHandle_t handle;

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnCreate(cudnnHandle_t *handle);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenCreate(miopenHandle_t* handle);
  // CHECK: status = miopenCreate(&handle);
  status = cudnnCreate(&handle);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnDestroy(cudnnHandle_t handle);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenDestroy(miopenHandle_t handle);
  // CHECK: status = miopenDestroy(handle);
  status = cudnnDestroy(handle);

  const char* const_ch = nullptr;

  // CUDA: const char *CUDNNWINAPI cudnnGetErrorString(cudnnStatus_t status);
  // MIOPEN: MIOPEN_EXPORT const char* miopenGetErrorString(miopenStatus_t error);
  // CHECK: const_ch = miopenGetErrorString(status);
  const_ch = cudnnGetErrorString(status);

  // CHECK: miopenAcceleratorQueue_t streamId;
  cudaStream_t streamId;

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnSetStream(cudnnHandle_t handle, cudaStream_t streamId);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenSetStream(miopenHandle_t handle, miopenAcceleratorQueue_t streamID);
  // CHECK: status = miopenSetStream(handle, streamId);
  status = cudnnSetStream(handle, streamId);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnGetStream(cudnnHandle_t handle, cudaStream_t *streamId);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenGetStream(miopenHandle_t handle, miopenAcceleratorQueue_t* streamID);
  // CHECK: status = miopenGetStream(handle, &streamId);
  status = cudnnGetStream(handle, &streamId);

  // CHECK: miopenTensorDescriptor_t tensorDescriptor;
  // CHECK-NEXT: miopenTensorDescriptor_t filterDescriptor;
  cudnnTensorDescriptor_t tensorDescriptor;
  cudnnFilterDescriptor_t filterDescriptor;

  // CHECK: miopenConvolutionDescriptor_t convolutionDescriptor;
  cudnnConvolutionDescriptor_t convolutionDescriptor;

  // CHECK: miopenPoolingDescriptor_t poolingDescriptor;
  cudnnPoolingDescriptor_t poolingDescriptor;

  // CHECK: miopenLRNDescriptor_t LRNDescriptor;
  cudnnLRNDescriptor_t LRNDescriptor;

  // CHECK: miopenActivationDescriptor_t activationDescriptor;
  cudnnActivationDescriptor_t activationDescriptor;

  // CHECK: miopenRNNDescriptor_t RNNDescriptor;
  cudnnRNNDescriptor_t RNNDescriptor;

  // CHECK: miopenCTCLossDescriptor_t CTCLossDescriptor;
  cudnnCTCLossDescriptor_t CTCLossDescriptor;

  // CHECK: miopenDropoutDescriptor_t DropoutDescriptor;
  cudnnDropoutDescriptor_t DropoutDescriptor;

  // CHECK: miopenReduceTensorDescriptor_t ReduceTensorDescriptor;
  cudnnReduceTensorDescriptor_t ReduceTensorDescriptor;

  // CHECK: miopenDataType_t dataType;
  // CHECK-NEXT: miopenDataType_t DATA_FLOAT = miopenFloat;
  // CHECK-NEXT: miopenDataType_t DATA_DOUBLE = miopenDouble;
  // CHECK-NEXT: miopenDataType_t DATA_HALF = miopenHalf;
  // CHECK-NEXT: miopenDataType_t DATA_INT8 = miopenInt8;
  // CHECK-NEXT: miopenDataType_t DATA_INT32 = miopenInt32;
  // CHECK-NEXT: miopenDataType_t DATA_INT8x4 = miopenInt8x4;
  // CHECK-NEXT: miopenDataType_t DATA_BFLOAT16 = miopenBFloat16;
  cudnnDataType_t dataType;
  cudnnDataType_t DATA_FLOAT = CUDNN_DATA_FLOAT;
  cudnnDataType_t DATA_DOUBLE = CUDNN_DATA_DOUBLE;
  cudnnDataType_t DATA_HALF = CUDNN_DATA_HALF;
  cudnnDataType_t DATA_INT8 = CUDNN_DATA_INT8;
  cudnnDataType_t DATA_INT32 = CUDNN_DATA_INT32;
  cudnnDataType_t DATA_INT8x4 = CUDNN_DATA_INT8x4;
  cudnnDataType_t DATA_BFLOAT16 = CUDNN_DATA_BFLOAT16;

  // CHECK: miopenRNNMode_t RNNMode;
  // CHECK-NEXT: miopenRNNMode_t RNN_RELU = miopenRNNRELU;
  // CHECK-NEXT: miopenRNNMode_t RNN_TANH = miopenRNNTANH;
  // CHECK-NEXT: miopenRNNMode_t LSTM = miopenLSTM;
  // CHECK-NEXT: miopenRNNMode_t GRU = miopenGRU;
  cudnnRNNMode_t RNNMode;
  cudnnRNNMode_t RNN_RELU = CUDNN_RNN_RELU;
  cudnnRNNMode_t RNN_TANH = CUDNN_RNN_TANH;
  cudnnRNNMode_t LSTM = CUDNN_LSTM;
  cudnnRNNMode_t GRU = CUDNN_GRU;

  // CHECK: miopenTensorOp_t tensorOp;
  // CHECK-NEXT: miopenTensorOp_t OP_TENSOR_ADD = miopenTensorOpAdd;
  // CHECK-NEXT: miopenTensorOp_t OP_TENSOR_MUL = miopenTensorOpMul;
  // CHECK-NEXT: miopenTensorOp_t OP_TENSOR_MIN = miopenTensorOpMin;
  // CHECK-NEXT: miopenTensorOp_t OP_TENSOR_MAX = miopenTensorOpMax;
  cudnnOpTensorOp_t tensorOp;
  cudnnOpTensorOp_t OP_TENSOR_ADD = CUDNN_OP_TENSOR_ADD;
  cudnnOpTensorOp_t OP_TENSOR_MUL = CUDNN_OP_TENSOR_MUL;
  cudnnOpTensorOp_t OP_TENSOR_MIN = CUDNN_OP_TENSOR_MIN;
  cudnnOpTensorOp_t OP_TENSOR_MAX = CUDNN_OP_TENSOR_MAX;

  // CHECK: miopenConvolutionMode_t convolutionMode;
  cudnnConvolutionMode_t convolutionMode;

  // CHECK: miopenPoolingMode_t poolingMode;
  // CHECK-NEXT: miopenPoolingMode_t POOLING_MAX = miopenPoolingMax;
  cudnnPoolingMode_t poolingMode;
  cudnnPoolingMode_t POOLING_MAX = CUDNN_POOLING_MAX;

  // CHECK: miopenRNNInputMode_t RNNInputMode;
  // CHECK-NEXT: miopenRNNInputMode_t LINEAR_INPUT = miopenRNNlinear;
  // CHECK-NEXT: miopenRNNInputMode_t SKIP_INPUT = miopenRNNskip;
  cudnnRNNInputMode_t RNNInputMode;
  cudnnRNNInputMode_t LINEAR_INPUT = CUDNN_LINEAR_INPUT;
  cudnnRNNInputMode_t SKIP_INPUT = CUDNN_SKIP_INPUT;

  // CHECK: miopenRNNAlgo_t RNNAlgo;
  // CHECK-NEXT: miopenRNNAlgo_t RNN_ALGO_STANDARD = miopenRNNdefault;
  cudnnRNNAlgo_t RNNAlgo;
  cudnnRNNAlgo_t RNN_ALGO_STANDARD = CUDNN_RNN_ALGO_STANDARD;

  // CHECK: miopenRNNBiasMode_t RNNBiasMode;
  // CHECK-NEXT: miopenRNNBiasMode_t RNN_NO_BIAS = miopenRNNNoBias;
  // CHECK-NEXT: miopenRNNBiasMode_t RNN_SINGLE_INP_BIAS = miopenRNNwithBias;
  // CHECK-NEXT: miopenRNNBiasMode_t RNN_DOUBLE_BIAS = miopenRNNwithBias;
  // CHECK-NEXT: miopenRNNBiasMode_t RNN_SINGLE_REC_BIAS = miopenRNNwithBias;
  cudnnRNNBiasMode_t RNNBiasMode;
  cudnnRNNBiasMode_t RNN_NO_BIAS = CUDNN_RNN_NO_BIAS;
  cudnnRNNBiasMode_t RNN_SINGLE_INP_BIAS = CUDNN_RNN_SINGLE_INP_BIAS;
  cudnnRNNBiasMode_t RNN_DOUBLE_BIAS = CUDNN_RNN_DOUBLE_BIAS;
  cudnnRNNBiasMode_t RNN_SINGLE_REC_BIAS = CUDNN_RNN_SINGLE_REC_BIAS;

  // CHECK: miopenLRNMode_t LRNMode;
  // CHECK-NEXT: miopenLRNMode_t LRN_CROSS_CHANNEL_DIM1 = miopenLRNCrossChannel;
  cudnnLRNMode_t LRNMode;
  cudnnLRNMode_t LRN_CROSS_CHANNEL_DIM1 = CUDNN_LRN_CROSS_CHANNEL_DIM1;

  // CHECK: miopenBatchNormMode_t batchNormMode;
  // CHECK-NEXT: miopenBatchNormMode_t BATCHNORM_PER_ACTIVATION = miopenBNPerActivation;
  // CHECK-NEXT: miopenBatchNormMode_t BATCHNORM_SPATIAL = miopenBNSpatial;
  cudnnBatchNormMode_t batchNormMode;
  cudnnBatchNormMode_t BATCHNORM_PER_ACTIVATION = CUDNN_BATCHNORM_PER_ACTIVATION;
  cudnnBatchNormMode_t BATCHNORM_SPATIAL = CUDNN_BATCHNORM_SPATIAL;

  // CHECK: miopenActivationMode_t activationMode;
  // CHECK-NEXT: miopenActivationMode_t ACTIVATION_RELU = miopenActivationRELU;
  // CHECK-NEXT: miopenActivationMode_t ACTIVATION_TANH = miopenActivationTANH;
  // CHECK-NEXT: miopenActivationMode_t ACTIVATION_CLIPPED_RELU = miopenActivationCLIPPEDRELU;
  // CHECK-NEXT: miopenActivationMode_t ACTIVATION_ELU = miopenActivationELU;
  // CHECK-NEXT: miopenActivationMode_t ACTIVATION_IDENTITY = miopenActivationPASTHRU;
  cudnnActivationMode_t activationMode;
  cudnnActivationMode_t ACTIVATION_RELU = CUDNN_ACTIVATION_RELU;
  cudnnActivationMode_t ACTIVATION_TANH = CUDNN_ACTIVATION_TANH;
  cudnnActivationMode_t ACTIVATION_CLIPPED_RELU = CUDNN_ACTIVATION_CLIPPED_RELU;
  cudnnActivationMode_t ACTIVATION_ELU = CUDNN_ACTIVATION_ELU;
  cudnnActivationMode_t ACTIVATION_IDENTITY = CUDNN_ACTIVATION_IDENTITY;

  // CHECK: miopenSoftmaxAlgorithm_t softmaxAlgorithm;
  // CHECK-NEXT: miopenSoftmaxAlgorithm_t SOFTMAX_FAST = MIOPEN_SOFTMAX_FAST;
  // CHECK-NEXT: miopenSoftmaxAlgorithm_t SOFTMAX_ACCURATE = MIOPEN_SOFTMAX_ACCURATE;
  // CHECK-NEXT: miopenSoftmaxAlgorithm_t SOFTMAX_LOG = MIOPEN_SOFTMAX_LOG;
  cudnnSoftmaxAlgorithm_t softmaxAlgorithm;
  cudnnSoftmaxAlgorithm_t SOFTMAX_FAST = CUDNN_SOFTMAX_FAST;
  cudnnSoftmaxAlgorithm_t SOFTMAX_ACCURATE = CUDNN_SOFTMAX_ACCURATE;
  cudnnSoftmaxAlgorithm_t SOFTMAX_LOG = CUDNN_SOFTMAX_LOG;

  // CHECK: miopenSoftmaxMode_t softmaxMode;
  // CHECK-NEXT: miopenSoftmaxMode_t SOFTMAX_MODE_INSTANCE = MIOPEN_SOFTMAX_MODE_INSTANCE;
  // CHECK-NEXT: miopenSoftmaxMode_t SOFTMAX_MODE_CHANNEL = MIOPEN_SOFTMAX_MODE_CHANNEL;
  cudnnSoftmaxMode_t softmaxMode;
  cudnnSoftmaxMode_t SOFTMAX_MODE_INSTANCE = CUDNN_SOFTMAX_MODE_INSTANCE;
  cudnnSoftmaxMode_t SOFTMAX_MODE_CHANNEL = CUDNN_SOFTMAX_MODE_CHANNEL;

  // CHECK: miopenReduceTensorOp_t reduceTensorOp;
  // CHECK-NEXT: miopenReduceTensorOp_t REDUCE_TENSOR_ADD = MIOPEN_REDUCE_TENSOR_ADD;
  // CHECK-NEXT: miopenReduceTensorOp_t REDUCE_TENSOR_MUL = MIOPEN_REDUCE_TENSOR_MUL;
  // CHECK-NEXT: miopenReduceTensorOp_t REDUCE_TENSOR_MIN = MIOPEN_REDUCE_TENSOR_MIN;
  // CHECK-NEXT: miopenReduceTensorOp_t REDUCE_TENSOR_MAX = MIOPEN_REDUCE_TENSOR_MAX;
  // CHECK-NEXT: miopenReduceTensorOp_t REDUCE_TENSOR_AMAX = MIOPEN_REDUCE_TENSOR_AMAX;
  // CHECK-NEXT: miopenReduceTensorOp_t REDUCE_TENSOR_AVG = MIOPEN_REDUCE_TENSOR_AVG;
  // CHECK-NEXT: miopenReduceTensorOp_t REDUCE_TENSOR_NORM1 = MIOPEN_REDUCE_TENSOR_NORM1;
  // CHECK-NEXT: miopenReduceTensorOp_t REDUCE_TENSOR_NORM2 = MIOPEN_REDUCE_TENSOR_NORM2;
  cudnnReduceTensorOp_t reduceTensorOp;
  cudnnReduceTensorOp_t REDUCE_TENSOR_ADD = CUDNN_REDUCE_TENSOR_ADD;
  cudnnReduceTensorOp_t REDUCE_TENSOR_MUL = CUDNN_REDUCE_TENSOR_MUL;
  cudnnReduceTensorOp_t REDUCE_TENSOR_MIN = CUDNN_REDUCE_TENSOR_MIN;
  cudnnReduceTensorOp_t REDUCE_TENSOR_MAX = CUDNN_REDUCE_TENSOR_MAX;
  cudnnReduceTensorOp_t REDUCE_TENSOR_AMAX = CUDNN_REDUCE_TENSOR_AMAX;
  cudnnReduceTensorOp_t REDUCE_TENSOR_AVG = CUDNN_REDUCE_TENSOR_AVG;
  cudnnReduceTensorOp_t REDUCE_TENSOR_NORM1 = CUDNN_REDUCE_TENSOR_NORM1;
  cudnnReduceTensorOp_t REDUCE_TENSOR_NORM2 = CUDNN_REDUCE_TENSOR_NORM2;

  // CHECK: miopenConvFwdAlgorithm_t convolutionFwdAlgo;
  // CHECK-NEXT: miopenConvFwdAlgorithm_t CONVOLUTION_FWD_ALGO_IMPLICIT_GEMM = miopenConvolutionFwdAlgoImplicitGEMM;
  // CHECK-NEXT: miopenConvFwdAlgorithm_t CONVOLUTION_FWD_ALGO_GEMM = miopenConvolutionFwdAlgoGEMM;
  // CHECK-NEXT: miopenConvFwdAlgorithm_t CONVOLUTION_FWD_ALGO_DIRECT = miopenConvolutionFwdAlgoDirect;
  // CHECK-NEXT: miopenConvFwdAlgorithm_t CONVOLUTION_FWD_ALGO_FFT = miopenConvolutionFwdAlgoFFT;
  // CHECK-NEXT: miopenConvFwdAlgorithm_t CONVOLUTION_FWD_ALGO_WINOGRAD = miopenConvolutionFwdAlgoWinograd;
  cudnnConvolutionFwdAlgo_t convolutionFwdAlgo;
  cudnnConvolutionFwdAlgo_t CONVOLUTION_FWD_ALGO_IMPLICIT_GEMM = CUDNN_CONVOLUTION_FWD_ALGO_IMPLICIT_GEMM;
  cudnnConvolutionFwdAlgo_t CONVOLUTION_FWD_ALGO_GEMM = CUDNN_CONVOLUTION_FWD_ALGO_GEMM;
  cudnnConvolutionFwdAlgo_t CONVOLUTION_FWD_ALGO_DIRECT = CUDNN_CONVOLUTION_FWD_ALGO_DIRECT;
  cudnnConvolutionFwdAlgo_t CONVOLUTION_FWD_ALGO_FFT = CUDNN_CONVOLUTION_FWD_ALGO_FFT;
  cudnnConvolutionFwdAlgo_t CONVOLUTION_FWD_ALGO_WINOGRAD = CUDNN_CONVOLUTION_FWD_ALGO_WINOGRAD;

  // CHECK: miopenNanPropagation_t nanPropagation_t;
  // CHECK-NEXT: miopenNanPropagation_t NOT_PROPAGATE_NAN = MIOPEN_NOT_PROPAGATE_NAN;
  // CHECK-NEXT: miopenNanPropagation_t PROPAGATE_NAN = MIOPEN_PROPAGATE_NAN;
  cudnnNanPropagation_t nanPropagation_t;
  cudnnNanPropagation_t NOT_PROPAGATE_NAN = CUDNN_NOT_PROPAGATE_NAN;
  cudnnNanPropagation_t PROPAGATE_NAN = CUDNN_PROPAGATE_NAN;

  // CHECK: miopenReduceTensorIndices_t reduceTensorIndices;
  // CHECK-NEXT: miopenReduceTensorIndices_t REDUCE_TENSOR_NO_INDICES = MIOPEN_REDUCE_TENSOR_NO_INDICES;
  // CHECK-NEXT: miopenReduceTensorIndices_t REDUCE_TENSOR_FLATTENED_INDICES = MIOPEN_REDUCE_TENSOR_FLATTENED_INDICES;
  cudnnReduceTensorIndices_t reduceTensorIndices;
  cudnnReduceTensorIndices_t REDUCE_TENSOR_NO_INDICES = CUDNN_REDUCE_TENSOR_NO_INDICES;
  cudnnReduceTensorIndices_t REDUCE_TENSOR_FLATTENED_INDICES = CUDNN_REDUCE_TENSOR_FLATTENED_INDICES;

  // CHECK: miopenIndicesType_t indicesType;
  // CHECK-NEXT: miopenIndicesType_t _32BIT_INDICES = MIOPEN_32BIT_INDICES;
  // CHECK-NEXT: miopenIndicesType_t _64BIT_INDICES = MIOPEN_64BIT_INDICES;
  // CHECK-NEXT: miopenIndicesType_t _16BIT_INDICES = MIOPEN_16BIT_INDICES;
  // CHECK-NEXT: miopenIndicesType_t _8BIT_INDICES = MIOPEN_8BIT_INDICES;
  cudnnIndicesType_t indicesType;
  cudnnIndicesType_t _32BIT_INDICES = CUDNN_32BIT_INDICES;
  cudnnIndicesType_t _64BIT_INDICES = CUDNN_64BIT_INDICES;
  cudnnIndicesType_t _16BIT_INDICES = CUDNN_16BIT_INDICES;
  cudnnIndicesType_t _8BIT_INDICES = CUDNN_8BIT_INDICES;

  // CHECK: miopenConvBwdDataAlgorithm_t ConvolutionBwdDataAlgo_t;
  // CHECK-NEXT: miopenConvBwdDataAlgorithm_t CONVOLUTION_BWD_DATA_ALGO_0 = miopenConvolutionBwdDataAlgoGEMM;
  // CHECK-NEXT: miopenConvBwdDataAlgorithm_t CONVOLUTION_BWD_DATA_ALGO_1 = miopenConvolutionBwdDataAlgoDirect;
  // CHECK-NEXT: miopenConvBwdDataAlgorithm_t CONVOLUTION_BWD_DATA_ALGO_FFT = miopenConvolutionBwdDataAlgoFFT;
  // CHECK-NEXT: miopenConvBwdDataAlgorithm_t CONVOLUTION_BWD_DATA_ALGO_WINOGRAD = miopenConvolutionBwdDataAlgoWinograd;
  cudnnConvolutionBwdDataAlgo_t ConvolutionBwdDataAlgo_t;
  cudnnConvolutionBwdDataAlgo_t CONVOLUTION_BWD_DATA_ALGO_0 = CUDNN_CONVOLUTION_BWD_DATA_ALGO_0;
  cudnnConvolutionBwdDataAlgo_t CONVOLUTION_BWD_DATA_ALGO_1 = CUDNN_CONVOLUTION_BWD_DATA_ALGO_1;
  cudnnConvolutionBwdDataAlgo_t CONVOLUTION_BWD_DATA_ALGO_FFT = CUDNN_CONVOLUTION_BWD_DATA_ALGO_FFT;
  cudnnConvolutionBwdDataAlgo_t CONVOLUTION_BWD_DATA_ALGO_WINOGRAD = CUDNN_CONVOLUTION_BWD_DATA_ALGO_WINOGRAD;

  // CHECK: miopenConvAlgoPerf_t ConvolutionFwdAlgoPerf_t;
  // CHECK-NEXT: miopenConvAlgoPerf_t ConvolutionFwdAlgoPerfStruct;
  cudnnConvolutionFwdAlgoPerf_t ConvolutionFwdAlgoPerf_t;
  cudnnConvolutionFwdAlgoPerfStruct ConvolutionFwdAlgoPerfStruct;

  // CHECK: miopenConvAlgoPerf_t ConvolutionBwdDataAlgoPerf_t;
  // CHECK-NEXT: miopenConvAlgoPerf_t ConvolutionBwdDataAlgoPerfStruct;
  cudnnConvolutionBwdDataAlgoPerf_t ConvolutionBwdDataAlgoPerf_t;
  cudnnConvolutionBwdDataAlgoPerfStruct ConvolutionBwdDataAlgoPerfStruct;

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnCreateTensorDescriptor(cudnnTensorDescriptor_t* tensorDesc);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenCreateTensorDescriptor(miopenTensorDescriptor_t* tensorDesc);
  // CHECK: status = miopenCreateTensorDescriptor(&tensorDescriptor);
  status = cudnnCreateTensorDescriptor(&tensorDescriptor);

  // TODO: cudnnSetTensor4dDescriptor -> miopenSet4dTensorDescriptor: different signatures
  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnSetTensor4dDescriptor(cudnnTensorDescriptor_t tensorDesc, cudnnTensorFormat_t format, cudnnDataType_t dataType, int n, int c, int h, int w);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenSet4dTensorDescriptor(miopenTensorDescriptor_t tensorDesc, miopenDataType_t dataType, int n, int c, int h, int w);

  int n = 0;
  int c = 0;
  int h = 0;
  int w = 0;
  int nStride = 0;
  int cStride = 0;
  int hStride = 0;
  int wStride = 0;

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnSetTensor4dDescriptorEx(cudnnTensorDescriptor_t tensorDesc, cudnnDataType_t dataType, int n, int c, int h, int w, int nStride, int cStride, int hStride, int wStride);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenSet4dTensorDescriptorEx(miopenTensorDescriptor_t tensorDesc, miopenDataType_t dataType, int n, int c, int h, int w, int nStride, int cStride, int hStride, int wStride);
  // CHECK: status = miopenSet4dTensorDescriptorEx(tensorDescriptor, dataType, n, c, h, w, nStride, cStride, hStride, wStride);
  status = cudnnSetTensor4dDescriptorEx(tensorDescriptor, dataType, n, c, h, w, nStride, cStride, hStride, wStride);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnGetTensor4dDescriptor(const cudnnTensorDescriptor_t tensorDesc, cudnnDataType_t* dataType, int* n, int* c, int* h, int* w, int* nStride, int* cStride, int* hStride, int* wStride);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenGet4dTensorDescriptor(miopenTensorDescriptor_t tensorDesc, miopenDataType_t* dataType, int* n, int* c, int* h, int* w, int* nStride, int* cStride, int* hStride, int* wStride);
  // CHECK: status = miopenGet4dTensorDescriptor(tensorDescriptor, &dataType, &n, &c, &h, &w, &nStride, &cStride, &hStride, &wStride);
  status = cudnnGetTensor4dDescriptor(tensorDescriptor, &dataType, &n, &c, &h, &w, &nStride, &cStride, &hStride, &wStride);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnDestroyTensorDescriptor(cudnnTensorDescriptor_t tensorDesc);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenDestroyTensorDescriptor(miopenTensorDescriptor_t tensorDesc);
  // CHECK: status = miopenDestroyTensorDescriptor(tensorDescriptor);
  status = cudnnDestroyTensorDescriptor(tensorDescriptor);

  // CHECK: miopenTensorDescriptor_t aD;
  // CHECK-NEXT: miopenTensorDescriptor_t bD;
  // CHECK-NEXT: miopenTensorDescriptor_t cD;
  // CHECK-NEXT: miopenTensorDescriptor_t xD;
  // CHECK-NEXT: miopenTensorDescriptor_t yD;
  // CHECK-NEXT: miopenTensorDescriptor_t wD;
  // CHECK-NEXT: miopenTensorDescriptor_t zD;
  // CHECK-NEXT: miopenTensorDescriptor_t inputD;
  // CHECK-NEXT: miopenTensorDescriptor_t dbD;
  // CHECK-NEXT: miopenTensorDescriptor_t dxD;
  // CHECK-NEXT: miopenTensorDescriptor_t dyD;
  // CHECK-NEXT: miopenTensorDescriptor_t biasD;
  cudnnTensorDescriptor_t aD;
  cudnnTensorDescriptor_t bD;
  cudnnTensorDescriptor_t cD;
  cudnnTensorDescriptor_t xD;
  cudnnTensorDescriptor_t yD;
  cudnnTensorDescriptor_t wD;
  cudnnTensorDescriptor_t zD;
  cudnnTensorDescriptor_t inputD;
  cudnnTensorDescriptor_t dbD;
  cudnnTensorDescriptor_t dxD;
  cudnnTensorDescriptor_t dyD;
  cudnnTensorDescriptor_t biasD;
  void* A = nullptr;
  void* B = nullptr;
  void* C = nullptr;
  void* alpha = nullptr;
  void* alpha1 = nullptr;
  void* alpha2 = nullptr;
  void* beta = nullptr;
  void* x = nullptr;
  void* dx = nullptr;
  void* y = nullptr;
  void* z = nullptr;
  void* dy = nullptr;
  void* W = nullptr;
  void* db = nullptr;
  void* bias = nullptr;
  int groupCount = 0;
  int requestedAlgoCount = 0;
  int returnedAlgoCount = 0;
  void* workSpace = nullptr;
  size_t workSpaceSizeInBytes = 0;

  // TODO: cudnnOpTensor -> miopenOpTensor: different signatures: cudnnOpTensorDescriptor_t != miopenTensorOp_t
  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnOpTensor(cudnnHandle_t handle, const cudnnOpTensorDescriptor_t opTensorDesc, const void* alpha1, const cudnnTensorDescriptor_t aDesc, const void* A, const void* alpha2, const cudnnTensorDescriptor_t bDesc, const void* B, const void* beta, const cudnnTensorDescriptor_t cDesc, void* C);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenOpTensor(miopenHandle_t handle, miopenTensorOp_t tensorOp, const void* alpha1, const miopenTensorDescriptor_t aDesc, const void* A, const void* alpha2, const miopenTensorDescriptor_t bDesc, const void* B, const void* beta, const miopenTensorDescriptor_t cDesc, void* C);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnSetTensor(cudnnHandle_t handle, const cudnnTensorDescriptor_t yDesc, void* y, const void* valuePtr);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenSetTensor(miopenHandle_t handle, const miopenTensorDescriptor_t yDesc, void* y, const void* alpha);
  // CHECK: status = miopenSetTensor(handle, tensorDescriptor, y, alpha);
  status = cudnnSetTensor(handle, tensorDescriptor, y, alpha);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnScaleTensor(cudnnHandle_t handle, const cudnnTensorDescriptor_t yDesc, void* y, const void* alpha);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenScaleTensor(miopenHandle_t handle, const miopenTensorDescriptor_t yDesc, void* y, const void* alpha);
  // CHECK: status = miopenScaleTensor(handle, tensorDescriptor, y, alpha);
  status = cudnnScaleTensor(handle, tensorDescriptor, y, alpha);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnTransformTensor(cudnnHandle_t handle, const void* alpha, const cudnnTensorDescriptor_t xDesc, const void* x, const void* beta, const cudnnTensorDescriptor_t yDesc, void* y);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenTransformTensor(miopenHandle_t handle, const void* alpha, const miopenTensorDescriptor_t xDesc, const void* x, const void* beta, const miopenTensorDescriptor_t yDesc, void* y);
  // CHECK: status = miopenTransformTensor(handle, alpha, xD, x, beta, yD, y);
  status = cudnnTransformTensor(handle, alpha, xD, x, beta, yD, y);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnCreateConvolutionDescriptor(cudnnConvolutionDescriptor_t* convDesc);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenCreateConvolutionDescriptor(miopenConvolutionDescriptor_t* convDesc);
  // CHECK: status = miopenCreateConvolutionDescriptor(&convolutionDescriptor);
  status = cudnnCreateConvolutionDescriptor(&convolutionDescriptor);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnSetConvolutionGroupCount(cudnnConvolutionDescriptor_t convDesc, int groupCount);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenSetConvolutionGroupCount(miopenConvolutionDescriptor_t convDesc, int groupCount);
  // CHECK: status = miopenSetConvolutionGroupCount(convolutionDescriptor, groupCount);
  status = cudnnSetConvolutionGroupCount(convolutionDescriptor, groupCount);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnGetConvolution2dForwardOutputDim(const cudnnConvolutionDescriptor_t convDesc, const cudnnTensorDescriptor_t inputTensorDesc, const cudnnFilterDescriptor_t filterDesc, int* n, int* c, int* h, int* w);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenGetConvolutionForwardOutputDim(miopenConvolutionDescriptor_t convDesc, const miopenTensorDescriptor_t inputTensorDesc, const miopenTensorDescriptor_t filterDesc, int* n, int* c, int* h, int* w);
  // CHECK: status = miopenGetConvolutionForwardOutputDim(convolutionDescriptor, inputD, filterDescriptor, &n, &c, &h, &w);
  status = cudnnGetConvolution2dForwardOutputDim(convolutionDescriptor, inputD, filterDescriptor, &n, &c, &h, &w);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnDestroyConvolutionDescriptor(cudnnConvolutionDescriptor_t convDesc);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenDestroyConvolutionDescriptor(miopenConvolutionDescriptor_t convDesc);
  // CHECK: status = miopenDestroyConvolutionDescriptor(convolutionDescriptor);
  status = cudnnDestroyConvolutionDescriptor(convolutionDescriptor);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnFindConvolutionForwardAlgorithmEx(cudnnHandle_t handle, const cudnnTensorDescriptor_t xDesc, const void* x, const cudnnFilterDescriptor_t wDesc, const void* w, const cudnnConvolutionDescriptor_t convDesc, const cudnnTensorDescriptor_t yDesc, void* y, const int requestedAlgoCount, int* returnedAlgoCount, cudnnConvolutionFwdAlgoPerf_t* perfResults, void* workSpace, size_t workSpaceSizeInBytes);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenFindConvolutionForwardAlgorithm(miopenHandle_t handle, const miopenTensorDescriptor_t xDesc, const void* x, const miopenTensorDescriptor_t wDesc, const void* w, const miopenConvolutionDescriptor_t convDesc, const miopenTensorDescriptor_t yDesc, void* y, const int requestAlgoCount, int* returnedAlgoCount, miopenConvAlgoPerf_t* perfResults, void* workSpace, size_t workSpaceSize, bool exhaustiveSearch);
  // CHECK: status = miopenFindConvolutionForwardAlgorithm(handle, xD, x, filterDescriptor, W, convolutionDescriptor, yD, y, requestedAlgoCount, &returnedAlgoCount, &ConvolutionFwdAlgoPerf_t, workSpace, workSpaceSizeInBytes, true);
  status = cudnnFindConvolutionForwardAlgorithmEx(handle, xD, x, filterDescriptor, W, convolutionDescriptor, yD, y, requestedAlgoCount, &returnedAlgoCount, &ConvolutionFwdAlgoPerf_t, workSpace, workSpaceSizeInBytes);

  // TODO: swap 2 and 3 arguments (const miopenTensorDescriptor_t wDesc and const miopenTensorDescriptor_t xDesc)
  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnGetConvolutionForwardWorkspaceSize(cudnnHandle_t handle, const cudnnTensorDescriptor_t xDesc, const cudnnFilterDescriptor_t wDesc, const cudnnConvolutionDescriptor_t convDesc, const cudnnTensorDescriptor_t yDesc, cudnnConvolutionFwdAlgo_t algo, size_t* sizeInBytes);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenConvolutionForwardGetWorkSpaceSize(miopenHandle_t handle, const miopenTensorDescriptor_t wDesc, const miopenTensorDescriptor_t xDesc, const miopenConvolutionDescriptor_t convDesc, const miopenTensorDescriptor_t yDesc, size_t* workSpaceSize);
  // CHECK: status = miopenConvolutionForwardGetWorkSpaceSize(handle, xD, filterDescriptor, convolutionDescriptor, yD,  &workSpaceSizeInBytes);
  status = cudnnGetConvolutionForwardWorkspaceSize(handle, xD, filterDescriptor, convolutionDescriptor, yD, convolutionFwdAlgo, &workSpaceSizeInBytes);

  // TODO: swap correctly last 5 arguments
  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnConvolutionForward(cudnnHandle_t handle, const void* alpha, const cudnnTensorDescriptor_t xDesc, const void* x, const cudnnFilterDescriptor_t wDesc, const void* w, const cudnnConvolutionDescriptor_t convDesc, cudnnConvolutionFwdAlgo_t algo, void* workSpace, size_t workSpaceSizeInBytes, const void* beta, const cudnnTensorDescriptor_t yDesc, void* y);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenConvolutionForward(miopenHandle_t handle, const void* alpha, const miopenTensorDescriptor_t xDesc, const void* x, const miopenTensorDescriptor_t wDesc, const void* w, const miopenConvolutionDescriptor_t convDesc, miopenConvFwdAlgorithm_t algo, const void* beta, const miopenTensorDescriptor_t yDesc, void* y, void* workSpace, size_t workSpaceSize);
  // CHECK: status = miopenConvolutionForward(handle, alpha, xD, x, filterDescriptor, W, convolutionDescriptor, convolutionFwdAlgo, workSpace, workSpaceSizeInBytes, beta, yD, y);
  status = cudnnConvolutionForward(handle, alpha, xD, x, filterDescriptor, W, convolutionDescriptor, convolutionFwdAlgo, workSpace, workSpaceSizeInBytes, beta, yD, y);

  // TODO: swap 2 and 3 arguments
  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnGetConvolutionBackwardDataWorkspaceSize(cudnnHandle_t handle, const cudnnFilterDescriptor_t wDesc, const cudnnTensorDescriptor_t dyDesc, const cudnnConvolutionDescriptor_t convDesc, const cudnnTensorDescriptor_t dxDesc, cudnnConvolutionBwdDataAlgo_t algo, size_t* sizeInBytes);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenConvolutionBackwardDataGetWorkSpaceSize(miopenHandle_t handle, const miopenTensorDescriptor_t dyDesc, const miopenTensorDescriptor_t wDesc, const miopenConvolutionDescriptor_t convDesc, const miopenTensorDescriptor_t dxDesc, size_t* workSpaceSize);
  // CHECK: status = miopenConvolutionBackwardDataGetWorkSpaceSize(handle, filterDescriptor, yD, convolutionDescriptor, xD,  &workSpaceSizeInBytes);
  status = cudnnGetConvolutionBackwardDataWorkspaceSize(handle, filterDescriptor, yD, convolutionDescriptor, xD, ConvolutionBwdDataAlgo_t, &workSpaceSizeInBytes);

  // TODO: swap correctly all args, starting from 3rd
  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnConvolutionBackwardData(cudnnHandle_t handle, const void* alpha, const cudnnFilterDescriptor_t wDesc, const void* w, const cudnnTensorDescriptor_t dyDesc, const void* dy, const cudnnConvolutionDescriptor_t convDesc, cudnnConvolutionBwdDataAlgo_t algo, void* workSpace, size_t workSpaceSizeInBytes, const void* beta, const cudnnTensorDescriptor_t dxDesc, void* dx);
  // MIOPEN MIOPEN_EXPORT miopenStatus_t miopenConvolutionBackwardData(miopenHandle_t handle, const void* alpha, const miopenTensorDescriptor_t dyDesc, const void* dy, const miopenTensorDescriptor_t wDesc, const void* w, const miopenConvolutionDescriptor_t convDesc, miopenConvBwdDataAlgorithm_t algo, const void* beta, const miopenTensorDescriptor_t dxDesc, void* dx, void* workSpace, size_t workSpaceSize);
  // CHECK: status = miopenConvolutionBackwardData(handle, alpha, filterDescriptor, W, yD, dy, convolutionDescriptor, ConvolutionBwdDataAlgo_t, workSpace, workSpaceSizeInBytes, beta, xD, dx);
  status = cudnnConvolutionBackwardData(handle, alpha, filterDescriptor, W, yD, dy, convolutionDescriptor, ConvolutionBwdDataAlgo_t, workSpace, workSpaceSizeInBytes, beta, xD, dx);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnConvolutionBackwardBias(cudnnHandle_t handle, const void* alpha, const cudnnTensorDescriptor_t dyDesc, const void* dy, const void* beta, const cudnnTensorDescriptor_t dbDesc, void* db);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenConvolutionBackwardBias(miopenHandle_t handle, const void* alpha, const miopenTensorDescriptor_t dyDesc, const void* dy, const void* beta, const miopenTensorDescriptor_t dbDesc, void* db);
  // CHECK: status = miopenConvolutionBackwardBias(handle, alpha, yD, dy, beta, dbD, db);
  status = cudnnConvolutionBackwardBias(handle, alpha, yD, dy, beta, dbD, db);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnCreatePoolingDescriptor(cudnnPoolingDescriptor_t* poolingDesc);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenCreatePoolingDescriptor(miopenPoolingDescriptor_t* poolDesc);
  // CHECK: status = miopenCreatePoolingDescriptor(&poolingDescriptor);
  status = cudnnCreatePoolingDescriptor(&poolingDescriptor);

  // CHECK: miopenNanPropagation_t maxpoolingNanOpt;
  cudnnNanPropagation_t maxpoolingNanOpt;
  int wH = 0;
  int wW = 0;
  int pad_h = 0;
  int pad_w = 0;
  int stride_h = 0;
  int stride_w = 0;

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnSetPooling2dDescriptor(cudnnPoolingDescriptor_t poolingDesc, cudnnPoolingMode_t mode, cudnnNanPropagation_t maxpoolingNanOpt, int windowHeight, int windowWidth, int verticalPadding, int horizontalPadding, int verticalStride, int horizontalStride);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenSet2dPoolingDescriptor(miopenPoolingDescriptor_t poolDesc, miopenPoolingMode_t mode, int windowHeight, int windowWidth, int pad_h, int pad_w, int stride_h, int stride_w);
  // CHECK: status = miopenSet2dPoolingDescriptor(poolingDescriptor, poolingMode,  wH, wW, pad_h, pad_w, stride_h, stride_w);
  status = cudnnSetPooling2dDescriptor(poolingDescriptor, poolingMode, maxpoolingNanOpt, wH, wW, pad_h, pad_w, stride_h, stride_w);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnGetPooling2dDescriptor(const cudnnPoolingDescriptor_t poolingDesc, cudnnPoolingMode_t* mode, cudnnNanPropagation_t* maxpoolingNanOpt, int* windowHeight, int* windowWidth, int* verticalPadding, int* horizontalPadding, int* verticalStride, int* horizontalStride);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenGet2dPoolingDescriptor(const miopenPoolingDescriptor_t poolDesc, miopenPoolingMode_t* mode, int* windowHeight, int* windowWidth, int* pad_h, int* pad_w, int* stride_h, int* stride_w);
  // CHECK: status = miopenGet2dPoolingDescriptor(poolingDescriptor, &poolingMode,  &wH, &wW, &pad_h, &pad_w, &stride_h, &stride_w);
  status = cudnnGetPooling2dDescriptor(poolingDescriptor, &poolingMode, &maxpoolingNanOpt, &wH, &wW, &pad_h, &pad_w, &stride_h, &stride_w);

  int nbDims = 0;
  int nbDimsRequested = 0;
  int* windowDimA = nullptr;
  int* padA = nullptr;
  int* stridesA = nullptr;
  int* tensorDimArr = nullptr;

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnGetPooling2dForwardOutputDim(const cudnnPoolingDescriptor_t poolingDesc, const cudnnTensorDescriptor_t inputTensorDesc, int* n, int* c, int* h, int* w);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenGetPoolingForwardOutputDim(const miopenPoolingDescriptor_t poolDesc, const miopenTensorDescriptor_t tensorDesc, int* n, int* c, int* h, int* w);
  // CHECK: status = miopenGetPoolingForwardOutputDim(poolingDescriptor, tensorDescriptor, &n, &c, &h, &w);
  status = cudnnGetPooling2dForwardOutputDim(poolingDescriptor, tensorDescriptor, &n, &c, &h, &w);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnGetPoolingNdForwardOutputDim(const cudnnPoolingDescriptor_t poolingDesc, const cudnnTensorDescriptor_t inputTensorDesc, int nbDims, int outputTensorDimA[]);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenGetPoolingNdForwardOutputDim(const miopenPoolingDescriptor_t poolDesc, const miopenTensorDescriptor_t tensorDesc, int dims, int* tensorDimArr);
  // CHECK: status = miopenGetPoolingNdForwardOutputDim(poolingDescriptor, tensorDescriptor, nbDims, tensorDimArr);
  status = cudnnGetPoolingNdForwardOutputDim(poolingDescriptor, tensorDescriptor, nbDims, tensorDimArr);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnSetPoolingNdDescriptor(cudnnPoolingDescriptor_t poolingDesc, const cudnnPoolingMode_t mode, const cudnnNanPropagation_t maxpoolingNanOpt, int nbDims, const int windowDimA[], const int paddingA[], const int strideA[]);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenSetNdPoolingDescriptor(miopenPoolingDescriptor_t poolDesc, const miopenPoolingMode_t mode, int nbDims, int* windowDimA, int* padA, int* stridesA);
  // CHECK: status = miopenSetNdPoolingDescriptor(poolingDescriptor, poolingMode, nbDims, windowDimA, padA, stridesA);
  status = cudnnSetPoolingNdDescriptor(poolingDescriptor, poolingMode, maxpoolingNanOpt, nbDims, windowDimA, padA, stridesA);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnGetPoolingNdDescriptor(const cudnnPoolingDescriptor_t poolingDesc, int nbDimsRequested, cudnnPoolingMode_t* mode, cudnnNanPropagation_t* maxpoolingNanOpt, int* nbDims, int windowDimA[], int paddingA[], int strideA[]);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenGetNdPoolingDescriptor(const miopenPoolingDescriptor_t poolDesc, int nbDimsRequested, miopenPoolingMode_t* mode, int* nbDims, int* windowDimA, int* padA, int* stridesA);
  // CHECK: status = miopenGetNdPoolingDescriptor(poolingDescriptor, nbDimsRequested, &poolingMode,  &nbDims, windowDimA, padA, stridesA);
  status = cudnnGetPoolingNdDescriptor(poolingDescriptor, nbDimsRequested, &poolingMode, &maxpoolingNanOpt, &nbDims, windowDimA, padA, stridesA);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnDestroyPoolingDescriptor(cudnnPoolingDescriptor_t poolingDesc);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenDestroyPoolingDescriptor(miopenPoolingDescriptor_t poolDesc);
  // CHECK: status = miopenDestroyPoolingDescriptor(poolingDescriptor);
  status = cudnnDestroyPoolingDescriptor(poolingDescriptor);

  unsigned lrnN = 0;
  double lrnAlpha = 0.0f;
  double lrnBeta = 0.0f;
  double lrnK = 0.0f;

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnCreateLRNDescriptor(cudnnLRNDescriptor_t* normDesc);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenCreateLRNDescriptor(miopenLRNDescriptor_t* lrnDesc);
  // CHECK: status = miopenCreateLRNDescriptor(&LRNDescriptor);
  status = cudnnCreateLRNDescriptor(&LRNDescriptor);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnSetLRNDescriptor(cudnnLRNDescriptor_t normDesc, unsigned lrnN, double lrnAlpha, double lrnBeta, double lrnK);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenSetLRNDescriptor(const miopenLRNDescriptor_t lrnDesc, miopenLRNMode_t mode, unsigned int lrnN, double lrnAlpha, double lrnBeta, double lrnK);
  // CHECK: status = miopenSetLRNDescriptor(LRNDescriptor, miopenLRNCrossChannel, lrnN, lrnAlpha, lrnBeta, lrnK);
  status = cudnnSetLRNDescriptor(LRNDescriptor, lrnN, lrnAlpha, lrnBeta, lrnK);

  // TODO: add a referrence to miopenLRNMode_t as a 2nd arg
  // TODO: [feature] Add a new type of transformation by declaring a var before the function call to add that var reference as an arg to the below function call
  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnGetLRNDescriptor(cudnnLRNDescriptor_t normDesc, unsigned* lrnN, double* lrnAlpha, double* lrnBeta, double* lrnK);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenGetLRNDescriptor(const miopenLRNDescriptor_t lrnDesc, miopenLRNMode_t* mode, unsigned int* lrnN, double* lrnAlpha, double* lrnBeta, double* lrnK);
  // CHECK: status = miopenGetLRNDescriptor(LRNDescriptor, &lrnN, &lrnAlpha, &lrnBeta, &lrnK);
  status = cudnnGetLRNDescriptor(LRNDescriptor, &lrnN, &lrnAlpha, &lrnBeta, &lrnK);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnDestroyLRNDescriptor(cudnnLRNDescriptor_t lrnDesc);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenDestroyLRNDescriptor(miopenLRNDescriptor_t lrnDesc);
  // CHECK: status = miopenDestroyLRNDescriptor(LRNDescriptor);
  status = cudnnDestroyLRNDescriptor(LRNDescriptor);

  // CHECK: miopenTensorDescriptor_t bnScaleBiasMeanVarDesc;
  // CHECK: miopenTensorDescriptor_t bnScaleBiasDiffDesc;
  cudnnTensorDescriptor_t bnScaleBiasMeanVarDesc;
  cudnnTensorDescriptor_t bnScaleBiasDiffDesc;
  void *bnScale = nullptr;
  void *bnBias = nullptr;
  double expAvgFactor = 0.0f;
  void *resultRunningMean = nullptr;
  void *resultRunningVariance = nullptr;
  double epsilon = 0.0f;
  void *resultSaveMean = nullptr;
  void *resultSaveInvVariance = nullptr;
  void *estimatedMean = nullptr;
  void *estimatedVariance = nullptr;
  void *alphaDataDiff = nullptr;
  void *betaDataDiff = nullptr;
  void *alphaParamDiff = nullptr;
  void *betaParamDiff = nullptr;
  void *resultBnScaleDiff = nullptr;
  void *resultBnBiasDiff = nullptr;
  void *savedMean = nullptr;
  void *savedInvVariance = nullptr;

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnDeriveBNTensorDescriptor(cudnnTensorDescriptor_t derivedBnDesc, const cudnnTensorDescriptor_t xDesc, cudnnBatchNormMode_t mode);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenDeriveBNTensorDescriptor(miopenTensorDescriptor_t derivedBnDesc, const miopenTensorDescriptor_t xDesc, miopenBatchNormMode_t bn_mode);
  // CHECK: status = miopenDeriveBNTensorDescriptor(tensorDescriptor, xD, batchNormMode);
  status = cudnnDeriveBNTensorDescriptor(tensorDescriptor, xD, batchNormMode);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnBatchNormalizationForwardTraining(cudnnHandle_t handle, cudnnBatchNormMode_t mode, const void* alpha, const void* beta, const cudnnTensorDescriptor_t xDesc, const void* x, const cudnnTensorDescriptor_t yDesc, void* y, const cudnnTensorDescriptor_t bnScaleBiasMeanVarDesc, const void* bnScale, const void* bnBias, double exponentialAverageFactor, void* resultRunningMean, double epsilon, void* resultSaveMean, void* resultSaveInvVariance);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenBatchNormalizationForwardTraining(miopenHandle_t handle, miopenBatchNormMode_t bn_mode, void* alpha, void* beta, const miopenTensorDescriptor_t xDesc, const void* x, const miopenTensorDescriptor_t yDesc, void* y, const miopenTensorDescriptor_t bnScaleBiasMeanVarDesc, void* bnScale, void* bnBias, double expAvgFactor, void* resultRunningMean, void* resultRunningVariance, double epsilon, void* resultSaveMean, void* resultSaveInvVariance);
  // CHECK: status = miopenBatchNormalizationForwardTraining(handle, batchNormMode, alpha, beta, xD, x, yD, y, bnScaleBiasMeanVarDesc, bnScale, bnBias, expAvgFactor, resultRunningMean, resultRunningVariance, epsilon, resultSaveMean, resultSaveInvVariance);
  status = cudnnBatchNormalizationForwardTraining(handle, batchNormMode, alpha, beta, xD, x, yD, y, bnScaleBiasMeanVarDesc, bnScale, bnBias, expAvgFactor, resultRunningMean, resultRunningVariance, epsilon, resultSaveMean, resultSaveInvVariance);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnBatchNormalizationForwardInference(cudnnHandle_t handle, cudnnBatchNormMode_t mode, const void* alpha, const void* beta, const cudnnTensorDescriptor_t xDesc, const void* x, const cudnnTensorDescriptor_t yDesc, void* y, const cudnnTensorDescriptor_t bnScaleBiasMeanVarDesc, const void* bnScale, const void* bnBias, const void* estimatedMean, const void* estimatedVariance, double epsilon);
  // MIOPEN: miopenBatchNormalizationForwardInference(miopenHandle_t handle, miopenBatchNormMode_t bn_mode, void* alpha, void* beta, const miopenTensorDescriptor_t xDesc, const void* x, const miopenTensorDescriptor_t yDesc, void* y, const miopenTensorDescriptor_t bnScaleBiasMeanVarDesc, void* bnScale, void* bnBias, void* estimatedMean, void* estimatedVariance, double epsilon);
  // CHECK: status = miopenBatchNormalizationForwardInference(handle, batchNormMode, alpha, beta, xD, x, yD, y, bnScaleBiasMeanVarDesc, bnScale, bnBias, estimatedMean, estimatedVariance, epsilon);
  status = cudnnBatchNormalizationForwardInference(handle, batchNormMode, alpha, beta, xD, x, yD, y, bnScaleBiasMeanVarDesc, bnScale, bnBias, estimatedMean, estimatedVariance, epsilon);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnBatchNormalizationBackward(cudnnHandle_t handle, cudnnBatchNormMode_t mode, const void* alphaDataDiff, const void* betaDataDiff, const void* alphaParamDiff, const void* betaParamDiff, const cudnnTensorDescriptor_t xDesc, const void* x, const cudnnTensorDescriptor_t dyDesc, const void* dy, const cudnnTensorDescriptor_t dxDesc, void* dx, const cudnnTensorDescriptor_t dBnScaleBiasDesc, const void* bnScale, void* dBnScaleResult, void* dBnBiasResult, double epsilon, const void* savedMean, const void* savedInvVariance);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenBatchNormalizationBackward(miopenHandle_t handle, miopenBatchNormMode_t bn_mode, const void* alphaDataDiff, const void* betaDataDiff, const void* alphaParamDiff, const void* betaParamDiff, const miopenTensorDescriptor_t xDesc, const void* x, const miopenTensorDescriptor_t dyDesc, const void* dy, const miopenTensorDescriptor_t dxDesc, void* dx, const miopenTensorDescriptor_t bnScaleBiasDiffDesc, const void* bnScale, void* resultBnScaleDiff, void* resultBnBiasDiff, double epsilon, const void* savedMean, const void* savedInvVariance);
  // CHECK: status = miopenBatchNormalizationBackward(handle, batchNormMode, alphaDataDiff, betaDataDiff, alphaParamDiff, betaParamDiff, xD, x, yD, y, dxD, dx, bnScaleBiasDiffDesc, bnScale, resultBnScaleDiff, resultBnBiasDiff, epsilon, savedMean, savedInvVariance);
  status = cudnnBatchNormalizationBackward(handle, batchNormMode, alphaDataDiff, betaDataDiff, alphaParamDiff, betaParamDiff, xD, x, yD, y, dxD, dx, bnScaleBiasDiffDesc, bnScale, resultBnScaleDiff, resultBnBiasDiff, epsilon, savedMean, savedInvVariance);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnCreateActivationDescriptor(cudnnActivationDescriptor_t* activationDesc);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenCreateActivationDescriptor(miopenActivationDescriptor_t* activDesc);
  // CHECK: status = miopenCreateActivationDescriptor(&activationDescriptor);
  status = cudnnCreateActivationDescriptor(&activationDescriptor);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnDestroyActivationDescriptor(cudnnActivationDescriptor_t activationDesc);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenDestroyActivationDescriptor(miopenActivationDescriptor_t activDesc);
  // CHECK: status = miopenDestroyActivationDescriptor(activationDescriptor);
  status = cudnnDestroyActivationDescriptor(activationDescriptor);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnActivationForward(cudnnHandle_t handle, cudnnActivationDescriptor_t activationDesc, const void* alpha, const cudnnTensorDescriptor_t xDesc, const void* x, const void* beta, const cudnnTensorDescriptor_t yDesc, void* y);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenActivationForward(miopenHandle_t handle, const miopenActivationDescriptor_t activDesc, const void* alpha, const miopenTensorDescriptor_t xDesc, const void* x, const void* beta, const miopenTensorDescriptor_t yDesc, void* y);
  // CHECK: status = miopenActivationForward(handle, activationDescriptor, alpha, xD, x, beta, yD, y);
  status = cudnnActivationForward(handle, activationDescriptor, alpha, xD, x, beta, yD, y);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnActivationBackward(cudnnHandle_t handle, cudnnActivationDescriptor_t activationDesc, const void* alpha, const cudnnTensorDescriptor_t yDesc, const void* y, const cudnnTensorDescriptor_t dyDesc, const void* dy, const cudnnTensorDescriptor_t xDesc, const void* x, const void* beta, const cudnnTensorDescriptor_t dxDesc, void* dx);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenActivationBackward(miopenHandle_t handle, const miopenActivationDescriptor_t activDesc, const void* alpha, const miopenTensorDescriptor_t yDesc, const void* y, const miopenTensorDescriptor_t dyDesc, const void* dy, const miopenTensorDescriptor_t xDesc, const void* x, const void* beta, const miopenTensorDescriptor_t dxDesc, void* dx);
  // CHECK: status = miopenActivationBackward(handle, activationDescriptor, alpha, yD, y, dyD, dy, xD, x, beta, dxD, dx);
  status = cudnnActivationBackward(handle, activationDescriptor, alpha, yD, y, dyD, dy, xD, x, beta, dxD, dx);

  // TODO: Move args: 1 to 7, 2 to 8
  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnSoftmaxForward(cudnnHandle_t handle, cudnnSoftmaxAlgorithm_t algo, cudnnSoftmaxMode_t mode, const void* alpha, const cudnnTensorDescriptor_t xDesc, const void* x, const void* beta, const cudnnTensorDescriptor_t yDesc, void* y);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenSoftmaxForward_V2(miopenHandle_t handle, const void* alpha, const miopenTensorDescriptor_t xDesc, const void* x, const void* beta, const miopenTensorDescriptor_t yDesc, void* y, miopenSoftmaxAlgorithm_t algorithm, miopenSoftmaxMode_t mode);
  // CHECK: status = miopenSoftmaxForward_V2(handle, softmaxAlgorithm, softmaxMode, alpha, xD, x, beta, yD, y);
  status = cudnnSoftmaxForward(handle, softmaxAlgorithm, softmaxMode, alpha, xD, x, beta, yD, y);

  // TODO: Move args: 1 to 7, 2 to 8
  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnSoftmaxBackward(cudnnHandle_t handle, cudnnSoftmaxAlgorithm_t algo, cudnnSoftmaxMode_t mode, const void* alpha, const cudnnTensorDescriptor_t yDesc, const void* y, const cudnnTensorDescriptor_t dyDesc, const void* dy, const void* beta, const cudnnTensorDescriptor_t dxDesc, void* dx);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenSoftmaxBackward_V2(miopenHandle_t handle, const void* alpha, const miopenTensorDescriptor_t yDesc, const void* y, const miopenTensorDescriptor_t dyDesc, const void* dy, const void* beta, const miopenTensorDescriptor_t dxDesc, void* dx, miopenSoftmaxAlgorithm_t algorithm, miopenSoftmaxMode_t mode);
  // CHECK: status = miopenSoftmaxBackward_V2(handle, softmaxAlgorithm, softmaxMode, alpha, yD, y, dyD, dy, beta, dxD, dx);
  status = cudnnSoftmaxBackward(handle, softmaxAlgorithm, softmaxMode, alpha, yD, y, dyD, dy, beta, dxD, dx);

  // CUDA: cudnnStatus_t CUDNNWINAPI cudnnConvolutionBiasActivationForward(cudnnHandle_t handle, const void* alpha1, const cudnnTensorDescriptor_t xDesc, const void* x, const cudnnFilterDescriptor_t wDesc, const void* w, const cudnnConvolutionDescriptor_t convDesc, cudnnConvolutionFwdAlgo_t algo, void* workSpace, size_t workSpaceSizeInBytes, const void* alpha2, const cudnnTensorDescriptor_t zDesc, const void* z, const cudnnTensorDescriptor_t biasDesc, const void* bias, const cudnnActivationDescriptor_t activationDesc, const cudnnTensorDescriptor_t yDesc, void* y);
  // MIOPEN: MIOPEN_EXPORT miopenStatus_t miopenConvolutionBiasActivationForward(miopenHandle_t handle, const void* alpha1, const miopenTensorDescriptor_t xDesc, const void* x, const miopenTensorDescriptor_t wDesc, const void* w, const miopenConvolutionDescriptor_t convDesc, miopenConvFwdAlgorithm_t algo, void* workspace, size_t workspaceSizeInBytes, const void* alpha2, const miopenTensorDescriptor_t zDesc, const void* z, const miopenTensorDescriptor_t biasDesc, const void* bias, const miopenActivationDescriptor_t activationDesc, const miopenTensorDescriptor_t yDesc, void* y);
  // CHECK: status = miopenConvolutionBiasActivationForward(handle, alpha1, xD, x, filterDescriptor, W, convolutionDescriptor, convolutionFwdAlgo, workSpace, workSpaceSizeInBytes, alpha2, zD, z, biasD, bias, activationDescriptor, yD, y);
  status = cudnnConvolutionBiasActivationForward(handle, alpha1, xD, x, filterDescriptor, W, convolutionDescriptor, convolutionFwdAlgo, workSpace, workSpaceSizeInBytes, alpha2, zD, z, biasD, bias, activationDescriptor, yD, y);

  return 0;
}
