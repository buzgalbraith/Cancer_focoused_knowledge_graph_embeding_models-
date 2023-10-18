#!/bin/bash 
## bash script to run, data geneaioon and preprocessing files
# Generate data for training and testing
DATA_PATH='./data'

CODE_PATH="./codes/triplet_generation"
echo "Generating triplets ..."

#python $CODE_PATH'/triplet_generation_script.py' 
echo "done"

echo "Pre-processing data ..."
python $CODE_PATH'/generate_entity_relations.py'
echo "done "

echo "moving data"
rm -r $DATA_PATH'/MSK'
cp -r $CODE_PATH'/generated_triplets' $DATA_PATH'/MSK'
cd $DATA_PATH'/MSK/all_triplets'
mv ./* ..
cd ..
rm -r ./all_triplets
mv ./cancer_to_drug_triplets.txt ./cancer_to_drug/
mv ./cancer_to_gene_triplets.txt ./cancer_to_gene/
mv ./cancer_to_treatment_triplets.txt ./cancer_to_treatment/
mv ./gene_to_up_regulate_to_cancer_triplets.txt ./gene_to_up_regulate_to_cancer/
echo "done"