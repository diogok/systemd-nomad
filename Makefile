

render-cloud-init-manager:
	@terraform apply -var manager=true -var manager_bootstrap=true > /dev/null
	@terraform output cloud-init

render-cloud-init-client:
	@terraform apply -var manager=false -var join=$(join) > /dev/null
	@terraform output cloud-init

launch-manager:
	make render-cloud-init-manager | multipass launch --name=manager --cloud-init=-

launch-client:
	make render-cloud-init-client join=$$(multipass info manager --format=table | grep IP | awk '{print $$2}') | multipass launch --name=client --cloud-init=-

info:
	multipass info --all

shell-manager:
	multipass shell manager

shell-client:
	multipass shell client

stop:
	multipass stop --all

clean: stop
	multipass delete --all
	multipass purge

