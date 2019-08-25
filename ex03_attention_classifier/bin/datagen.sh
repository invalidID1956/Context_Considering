#!/usr/bin/env bash

PROBLEM=transformer_t2t
MODEL=transformer
HPARAMS=hparam_transformer_t2t

cd ..
BASEDIR=$(pwd)

EX_HOME=$(cat config_ex03.json | jq .EX_HOME)
EX_HOME=${EX_HOME:1:-1}

DATA_DIR=$(cat config_ex03.json | jq .DATA_HOME)
TMP_DIR=${EX_HOME}/tmp_data

mkdir -p $DATA_DIR $TMP_DIR $TRAIN_DIR $DATASET_DIR

FILECNT=$(ls $DATASET_DIR | wc -l)

if [ $FILECNT = 0 ] ; then
    echo '>>>> Start Datagen for Training.'

    python datagen.py \
      --data_dir=$DATA_DIR \
      --tmp_dir=$TMP_DIR \
      --problem=$PROBLEM

    echo '>>>> End Datagen for Training.'   # data_dir 아래에 만들어지나?
else
    echo '>>>> Dataset files are already exist in target dir. Check and try datagen again.'
fi