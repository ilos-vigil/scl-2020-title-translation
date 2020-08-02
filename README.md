# Shopee Code League 2020 - Title/Product Translation

## Disclaimer

* This is work of Cocoa team, we **DO NOT** represent any organization.
* There's no reproducibility guarantee
* Although we use License "The Unlicense", dataset and generated dataset falls under Shopee Terms and Conditions which can be seen on [Kaggle](https://www.kaggle.com/c/student-shopee-code-league-product-translation/rules)

## Environment

All of the notebook are run on local envrionment with specification :

* Ryzen 5 1600
* 16GB RAM (w/ 16GB swapfile)
* Nvidia GTX 1060 6GB
* GNU/Linux distribution based on Debian 10 Buster

## Notebook & script description

| Filename                 | Description                             |
| ------------------------ | --------------------------------------- |
| 01_preprocess.ipynb      | Clean dataset                           |
| 02_augment.ipynb         | Perform text augmentation               |
| 03_create_embedding.sh   | Create FastText vector                  |
| 04_train_unsupervised.sh | Align Fasttext vector                   |
| 05_hybrid.ipynb          | Translate text with wiki and our vector |

## Generated Dataset

| Filename/directory path             | Created by               |
| ----------------------------------- | ------------------------ |
| data/text/train_en.txt              | 01_preprocess.ipynb      |
| data/text/train_zh.txt              |                          |
| data/text/train_en_aug.txt          | 02_augment.ipynb         |
| data/text/train_zh_aug.txt          |                          |
| data/embedding/train_en_aug_300.vec | 03_create_embedding.sh   |
| data/embedding/train_zh_aug_300.vec |                          |
| data/muse/debug/*                   | 04_train_unsupervised.sh |
| log*.log                            | 05_hybrid.ipynb          |
| submission*.log                     |                          |

## Guide

1. Clone this repository

```
git clone https://github.com/ilos-vigil/scl-2020-title-translation.git
cd scl-2020-title-translation
```

3. Clone MUSE repository

```
git clone https://github.com/facebookresearch/MUSE.git
```

4. Download MUSE evaluation data

```
cd MUSE/data
bash get_evaluation.sh
cd ../..
```

5. Clone fastText repository from source code

```
git clone https://github.com/facebookresearch/fastText.git
```

6. Compile fastText from source code

```
cd fastText
make -j 12 # replace 12 with total core/thread of your CPU
cd ..
```

7. Download `wiki.en.align.vec` and `wiki.zh.align.vec`

For reference, here are SHA-256 of aligned Wiki vector that we use

| Filename          | SHA-256 Hash                                                     |
| ----------------- | ---------------------------------------------------------------- |
| wiki.en.align.vec | 76af17da608b1c1b961905cd3a326d622bdeff4edc6fd7818a261cc827a6c807 |
| wiki.zh.align.vec | b763d0a79a2a74c2d3f1e723adfa37a97b676dd758b0ae5f96dddd4a8758d510 |

```
cd data/wikivec
wget https://dl.fbaipublicfiles.com/fasttext/vectors-aligned/wiki.en.align.vec
wget https://dl.fbaipublicfiles.com/fasttext/vectors-aligned/wiki.zh.align.vec
```

8. Install required library

```
```

9. Run `01_preprocess.ipynb`
10. Run `02_augment.ipynb`
11. Execute `bash 03_create_embedding.sh`

Output of the script

```
Read 83M words
Number of words:  309334
Number of labels: 0
Progress: 100.0% words/sec/thread:   30646 lr:  0.000000 avg.loss:  0.255820 ETA:   0h 0m 0s
Read 24M words
Number of words:  86679
Number of labels: 0
Progress: 100.0% words/sec/thread:   41147 lr:  0.000000 avg.loss:  0.797964 ETA:   0h 0m 0s
```

12. Execute `bash 04_train_unsupervised.sh`

Output of the script can be seen on train.log

13. Run `05_hybrid.ipynb`  
