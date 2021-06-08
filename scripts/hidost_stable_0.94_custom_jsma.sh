#BSUB -o out/hidost_stable_0.94_custom_jsma.%J
#BSUB -e out/hidost_stable_0.94_custom_jsma.err.%J
#BSUB -N
#BSUB -R '(!gpu)'
#BSUB -R "rusage[mem=10]"
#BSUB -J hidost_brendel

cd ~/codnn
source env/bin/activate

python attack.py brendel \
  -d hidost_scaled -i models/hidost_stable_0.94.h5:custom_sigmoid \
  --all -o attack_data/hidost_stable_0.94_custom_jsma.json -m pdf
