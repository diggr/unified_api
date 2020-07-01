.PHONY: check_name
check_name:
ifeq ($(name),)
	@echo "You need to give a name either name=koerby or name=daft. Exiting."
	@exit 1
endif

.PHONY: build
build: check_name	
	cd $(name)_api; docker build --no-cache -t "ubl:$(name)api" .

.PHONY: save
save: check_name
	docker save ubl:$(name)api > ubl_$(name)api.tar

.PHONY: load
load: check_name
	docker load < ubl_$(name)api.tar

