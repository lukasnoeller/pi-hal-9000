#!/bin/bash
.venv/bin/python3 -m wyoming_openwakeword --uri "tcp://127.0.0.1:10400" --custom-model-dir wake-words --threshold 0.75 --trigger-level 2 --debug
