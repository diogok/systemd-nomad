

render-cloud-init-server:
	@terraform apply -var server=true -var server_bootstrap=true > /dev/null
	@terraform output cloud-init

render-cloud-init-client:
	@terraform apply -var server=false -var join=$(join) > /dev/null
	@terraform output cloud-init

launch-server:
	make render-cloud-init-server | multipass launch --name=server --cloud-init=-

launch-client:
	make render-cloud-init-client join=$$(multipass info server --format=table | grep IP | awk '{print $$2}') | multipass launch --name=client --cloud-init=-

info:
	multipass info --all

shell-server:
	multipass shell server

shell-client:
	multipass shell client

stop:
	multipass stop --all

clean: stop
	multipass delete --all
	multipass purge

