#!/bin/bash
export PYTHONPATH=./

MODEL_PATH="ToolBench/ToolBench_IR_bert_based_uncased"
DATASET_PATH="data/retrieval/G1"
EXPERIMENT_NAME="G1_ft"
LOGFILE="logs/${EXPERIMENT_NAME}_$(date +'%Y%m%d_%H%M%S').log"
exec > "$LOGFILE" 2>&1
set -x  # (선택) 실행되는 명령어도 로그에 기록됨


echo "Running retriever inference evaluation..."
echo "Model: $MODEL_PATH"
echo "Dataset: $DATASET_PATH"
echo ""

python toolbench/retrieval/inference_example.py \
    --model_path $MODEL_PATH \
    --dataset_path $DATASET_PATH

echo ""
echo "Results saved to top5_results_with_matches.json"
