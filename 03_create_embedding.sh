#!/bin/bash

# note
# we use fastText CLI because we need .vec file (plain text format), which not provided by fastText Python library

cd fastText/
# ./fasttext skipgram \
#     -input ../data/txt/train_tcn.txt \
#     -output ../data/embedding/train_tcn \
#     -verbose 2 \
#     -lrUpdateRate 90 \
#     -dim 300 \
#     -epoch 20 \
#     -thread 12 \
#     -seed 42
# ./fasttext skipgram \
#     -input ../data/txt/train_en.txt \
#     -output ../data/embedding/train_en \
#     -verbose 2 \
#     -lrUpdateRate 90 \
#     -dim 300 \
#     -epoch 20 \
#     -thread 12 \
#     -seed 42
./fasttext skipgram \
    -input ../data/txt/train_tcn_aug.txt \
    -output ../data/embedding/train_tcn_aug_300 \
    -verbose 2 \
    -minCount 4 \
    -wordNgrams 3 \
    -lrUpdateRate 90 \
    -dim 300 \
    -epoch 20 \
    -thread 11 \
    -seed 42
./fasttext skipgram \
    -input ../data/txt/train_en_aug.txt \
    -output ../data/embedding/train_en_aug_300 \
    -verbose 2 \
    -minCount 4 \
    -wordNgrams 3 \
    -lrUpdateRate 90 \
    -dim 300 \
    -epoch 20 \
    -thread 11 \
    -seed 42