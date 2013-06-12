all: deploy

deploy: tests
	./xtreme restart

tests: 
	prove t/xtreme.t
