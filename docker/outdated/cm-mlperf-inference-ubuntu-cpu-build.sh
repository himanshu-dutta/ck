#! /bin/bash

# ubuntu [18.04 ; 20.04 ; 22.04]
# debian [9 ; 10]

#export CM_CACHE="--no-cache"

#export CM_OS_NAME="debian"
#export CM_OS_VERSION="10"

export CM_OS_NAME="ubuntu"
export CM_OS_VERSION="22.04"

# onnxruntime; pytorch; transformers; tensorflow; tvm-onnx; tvm-pip-install-onnx
export CM_ML_ENGINE="onnxruntime"
export CM_ML_ENGINE_VERSION="1.12.1"
export CM_ML_MODEL="resnet50"
export CM_MLPERF_IMPLEMENTATION="python"

time docker build -f cm-mlperf-inference-ubuntu-cpu.Dockerfile \
   -t ckrepo/cm-mlperf-inference-ubuntu-cpu:${CM_OS_NAME}-${CM_OS_VERSION} \
   --build-arg cm_os_name=${CM_OS_NAME} \
   --build-arg cm_os_version=${CM_OS_VERSION} \
   --build-arg cm_version="" \
   --build-arg cm_automation_repo="ctuning@mlcommons-ck" \
   --build-arg cm_automation_checkout="" \
   --build-arg cm_python_version="3.10.7" \
   --build-arg cm_mlperf_inference_loadgen_version="" \
   --build-arg cm_mlperf_inference_src_tags="_octoml" \
   --build-arg cm_mlperf_inference_src_version="" \
   --build-arg cm_ml_engine=${CM_ML_ENGINE} \
   --build-arg cm_ml_engine_version=${CM_ML_ENGINE_VERSION} \
   --build-arg cm_mlperf_implementation=${CM_MLPERF_IMPLEMENTATION} \
  ${CM_CACHE} .
