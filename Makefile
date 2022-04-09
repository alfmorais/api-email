.PHONY: all test clean

build:
	# @sudo gpasswd -a $USER docker
	# @newgrp docker
	@docker-compose up -d --build

check-pep257:
	@prospector --with-tool pep257

create-requirements:
	@pip-compile requirements.in

freeze:
	@pip freeze

format:
	@blue .
	@isort .

install-requirements:
	@pip install -r requirements.txt

lint:
	@blue . --check
	@isort . --check

test:
	@python -m pytest tests/

update-requirements:
	@rm requirements.txt
	@pip-compile requirements.in

run:
	@docker-compose up
