<<<<<<< Updated upstream:security/Makefile
ENV := $(PWD)/../.env
include $(ENV)

.PHONY: init apply plan clean-state validate

init:
	env AWS_PROFILE=$(TF_AWS_PROFILE) terraform init -input=false \
	-backend-config="bucket=$(TF_S3_BUCKET_NAME)" \
	-backend-config="region=$(TF_AWS_REGION)" \
	-backend-config="key=$(TF_S3_BUCKET_KEY)" \
	-backend-config="dynamodb_table=$(TF_DYNAMODB_TABLE)"
=======
.PHONY: atlantis-init atlantis-apply atlantis-plan clean-state validate

atlantis-init:
	terraform init -input=false
>>>>>>> Stashed changes:Makefile

validate:
	terraform validate

atlantis-plan: validate
	rm -f tfplan && terraform plan -out=tfplan > /dev/null && terraform show tfplan

atlantis-apply:
	terraform tfplan 

upgrade-provider: load-env clean-state
	terraform init -input=false -upgrade

clean-state:
	rm -rf .terraform terraform.tfstate