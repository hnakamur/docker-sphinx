#!/bin/sh
rm -rf ./*
my-sphinx-quickstart -p hello -a 'Hiroaki Nakamura' -r 1.0
make livehtml
