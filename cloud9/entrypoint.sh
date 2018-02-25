#!/bin/bash
set -e

if [ ! -e ~/data ]; then
   ln -s /data ~/
fi 

if [ ! -e ~/tutorials ]; then
   git clone https://github.com/datadrivenag/tutorials.git ~/tutorials
fi 

nodejs /cloud9/server.js -p 80 -w /workspace -a : --listen 0.0.0.0
