#!/bin/bash

sudo swapoff -a

JOIN=\$(tail -n 2 /vagrant_data/output | tr -d \'\\\\\\n')
sudo \$JOIN

