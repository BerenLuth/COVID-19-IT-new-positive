#!/bin/bash
cd COVID-19
echo "downloading the latest data..."
echo ""
git pull
cd ..

echo ""
echo "Launching r script..."
Rscript covid19.r && echo "plot generated!"
