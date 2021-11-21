export WANDB_PROJECT=1018_lw

cd "/cluster/home/nzl/1025_cifar_venom/git_repo"

[ -z "$commit" ] && commit=$branch # -z 判断 变量的值，是否为空；
git checkout $commit
git reset --hard HEAD

[ -d data ] || ln -s /cluster/home/nzl/1025_cifar_venom/data_new data # 或操作执行前面那个
# -d 如果data目录存在
export commit=$(git rev-parse HEAD)
echo checkout commit $commit

srun -J lw -N 1 -p $cluster --gres gpu:$gpus \
python3 train.py \
--en_wandb \
 $exp_args ${@}