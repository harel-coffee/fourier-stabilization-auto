#BSUB -o out/hatespeech_stable_0.86_custom_jsma.%J
#BSUB -e out/hatespeech_stable_0.86_custom_jsma.err.%J
#BSUB -N
#BSUB -R '(!gpu)'
#BSUB -R "rusage[mem=10]"
#BSUB -J hidost_brendel

cd ~/codnn
source env/bin/activate

python attack.py brendel \
  -d hatespeech -i models/hatespeech_stable_0.86.h5:custom_sigmoid \
  --all -o attack_data/hatespeech_stable_0.86_custom_jsma.json -m pdf
