# ENV := $(PWD)/../.env
# include $(ENV)

.PHONY: init apply plan clean-state validate

init:
	env AWS_PROFILE=$(TF_AWS_PROFILE) terraform init -input=false

validate:
	terraform validate

plan: validate
	env AWS_PROFILE=$(TF_AWS_PROFILE) terraform plan

apply:
	env AWS_PROFILE=$(TF_AWS_PROFILE) terraform apply 

upgrade-provider: load-env clean-state
	env AWS_PROFILE=$(TF_AWS_PROFILE) terraform init -input=false -upgrade

clean-state:
	rm -rf .terraform terraform.tfstate