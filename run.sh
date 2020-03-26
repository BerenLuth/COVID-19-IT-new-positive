#!/bin/bash
echo "downloading the latest data..."
git submodule update
echo "Launching r script..."
Rscript covid19.r && echo "plot generated!"
