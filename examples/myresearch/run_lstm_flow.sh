#!/bin/bash

TOOLS=../../build/tools

export HDF5_DISABLE_VERSION_CHECK=1
export PYTHONPATH=.
#for debugging python layer
GLOG_logtostderr=1  $TOOLS/caffe train -solver lstm_solver_flow.prototxt -weights snapshots_singleFrame_flow_iter_50000.caffemodel  
echo "Done."