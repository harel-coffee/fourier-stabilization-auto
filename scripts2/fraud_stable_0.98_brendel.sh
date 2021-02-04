#BSUB -o out/fraud_stable_0.98_brendel.%J
#BSUB -e out/fraud_stable_0.98_brendel.err.%J
#BSUB -N
#BSUB -R '(!gpu)'
#BSUB -R "rusage[mem=10]"
#BSUB -J fraud_stable_0.98_brendel

cd ~/codnn
source env/bin/activate

python attack.py brendel \
  -d fraud -i models/fraud_stable_0.98.h5:custom_sigmoid \
  --all -o attack_data2/fraud_stable_0.98_brendel.json -m pdf
