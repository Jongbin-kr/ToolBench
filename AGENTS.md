# ToolBench Agent Guide

## Build/Run Commands
- **Setup**: `pip install -r requirements.txt` or `pip install -r toolbench/tooleval/requirements.txt` (for ToolEval only)
- **Training**: `export PYTHONPATH=./; torchrun --nproc_per_node=2 --master_port=20001 toolbench/train/train_mem.py [args]`
- **Training (LoRA)**: `export PYTHONPATH=./; deepspeed --master_port=20001 toolbench/train/train_lora.py [args]`
- **Inference**: `export PYTHONPATH=./; python toolbench/inference/qa_pipeline.py --tool_root_dir data/toolenv/tools/ [args]`
- **Evaluation**: `python toolbench/tooleval/eval_pass_rate.py --converted_answer_path [path] --test_ids [path] [args]`
- **No test framework**: This project does not use pytest/unittest. Testing done via inference scripts.

## Code Style
- **Python 3.9+** required
- **Imports**: Standard library first, then third-party (torch, transformers, etc.), then local imports (`toolbench.*`)
- **Naming**: Snake_case for functions/variables, PascalCase for classes
- **Types**: Uses dataclasses for arguments, type hints minimal (legacy codebase style)
- **Formatting**: Standard Python, 4-space indentation
- **Error handling**: Simple try-except patterns where needed
- **Key utilities**: `toolbench/utils.py` contains `standardize()`, `change_name()`, `get_gpu_memory()`
- **Environment**: Always set `export PYTHONPATH=./` before running scripts
- **Data paths**: Expects `data/` directory at repo root with specific structure
- **API keys**: Use environment variables (`TOOLBENCH_KEY`, `OPENAI_KEY`, `RAPIDAPI_KEY`)
