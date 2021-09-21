.PHONY: env init plan
.DEFAULT_GOAL := help
SHELL := /bin/bash

init:
  @terraform init

plan:
  @terraform plan