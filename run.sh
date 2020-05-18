#!/bin/bash
echo "downloading the latest data..."
cd COVID-19
git pull
cd ..
git add .
git commit -S -m "updated submodule"
echo "Launching r script..."
Rscript covid19.r && echo "plot generated!"
