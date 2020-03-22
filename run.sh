#!/bin/bash
echo "downloading the latest data..."
echo ""
git submodule update COVID-19

echo ""
echo "Launching r script..."
Rscript covid19.r && echo "plot generated!"
