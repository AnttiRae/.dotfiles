#!/bin/bash

git clone $1 $2

cd $2 && rm .git -rfv

git init

