#BSUB -o out/pdfrate_stable_no_acc0.96_brendel.%J
#BSUB -e out/pdfrate_stable_no_acc0.96_brendel.err.%J
#BSUB -N
#BSUB -R '(!gpu)'
#BSUB -R "rusage[mem=10]"
#BSUB -J hidost_brendel

cd ~/codnn
source env/bin/activate

python attack.py brendel \
  -d pdfrate -i models/pdfrate_stable_no_acc0.96.h5:custom_sigmoid \
  --all -o attack_data/pdfrate_stable_no_acc0.96_brendel.json -m pdf
