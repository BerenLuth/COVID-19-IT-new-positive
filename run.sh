#!/bin/bash
echo "downloading the latest data..."
git submodule update COVID-19
echo "Launching r script..."
Rscript covid19.r && echo "plot generated!"
