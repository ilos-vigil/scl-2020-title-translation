#!/bin/bash

# note
# --dis_most_frequent value should be lower than pre-trained word count
# --emb_dim must match fasttext dimension
# --batch_size can be increased for faster training, but also need to tweak LR

cd ./MUSE
python3 unsupervised.py \
    --src_lang zh \
    --tgt_lang en \
    --src_emb ../data/embedding/train_tcn_aug_300.vec \
    --tgt_emb ../data/embedding/train_en_aug_300.vec \
    --n_refinement 5 \
    --normalize_embeddings center \
    --emb_dim 300 \
    --dis_most_frequent 86679 \
    --max_vocab 300000 \
    --n_epochs 10 \
    --batch_size 64 \
    --exp_path ../data/muse