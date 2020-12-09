#!/bin/bash
echo "downloading the latest data..."
cd COVID-19
git reset --hard origin/master
cd ..
git add .
git commit -m "updated submodule"
echo "Launching r script..."
Rscript covid19.r && echo "plot generated!"
