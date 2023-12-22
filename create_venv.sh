#!/usr/bin/env bash
#
# Creates a virtual environment that handles Python module dependencies for all packages necessary to run the planner
#
SCRIPT_DIR=$(realpath $(dirname $0))

cd $SCRIPT_DIR
virtualenv --python="python2.7" .venv
source .venv/bin/activate

# Make sure that installing with python into the venv: https://stackoverflow.com/a/5979776
# Valid setup consists of Python 2.7.17 and pip 20.3.4
VENV_PYTHON=$SCRIPT_DIR/.venv/bin/python2.7
VENV_PIP=$SCRIPT_DIR/.venv/bin/pip2.7

$VENV_PIP install --upgrade pip

# installing package dependencies
$VENV_PIP install ipython==5.7
$VENV_PIP install ipykernel==4.10

# Link to .whl taken from https://pypi.org/project/tensorflow/#files,
# specifically, the newest version with Python 2.7 support that runs without multiple warnings,
# i.e., https://pypi.org/project/tensorflow/1.12.0/#files
# Other versions checked: 1.15.0, 1.14.0, 1.13.1, 1.12.3; versions >2.0.0 won't work
$VENV_PIP install https://files.pythonhosted.org/packages/bd/68/ec26b2cb070a5760707ec8d9491a24e5be72f4885f265bb04abf70c0f9f1/tensorflow-1.12.0-cp27-cp27mu-manylinux1_x86_64.whl
$VENV_PIP install matplotlib==2.2.3
$VENV_PIP install rospkg==1.5.0
$VENV_PIP install pyyaml==5.4.1
$VENV_PIP install numpy==1.16.6

deactivate
