#BSUB -o out/fraud_stable_0.93_brendel.%J
#BSUB -e out/fraud_stable_0.93_brendel.err.%J
#BSUB -N
#BSUB -R '(!gpu)'
#BSUB -R "rusage[mem=10]"
#BSUB -J hidost_brendel

cd ~/codnn
source env/bin/activate

python attack.py brendel \
  -d fraud -i models/fraud_stable_0.93.h5:custom_sigmoid \
  --all -o attack_data/fraud_stable_0.93_brendel.json -m pdf
