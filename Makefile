.PHONY: atlantis-init atlantis-apply atlantis-plan clean-state validate

atlantis-init:
	terraform init -input=false

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