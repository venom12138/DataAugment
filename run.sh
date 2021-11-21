export exp_name=1027_training
export exp_args="--dataset cifar10 --layers 56" # 一组实验很多个run
export branch= master # 1025_local_module_train

# export cluster=TITANXP
# export cluster=RTX2080Ti
export gpus=1
stage = 2
aux_config = 0c2f
export run_name="stage=$stage,aux_config=$aux_config"
bash mybase.sh --stage $stage --aux_config $aux_config --finetuning --

# for stage in {1,2,}; do
#   for aux_config in {0c1f,0c2f,1c1f,1c2f,1c3f,2c2f}; do
#     export run_name="stage=$stage,aux_config=$aux_config"
#     bash base.sh --stage $stage --aux_config $aux_config &
#     sleep 2
#   done
#   wait
# done