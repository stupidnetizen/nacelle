.PHONY: docs

help:
	@echo "docs - generate Sphinx HTML documentation, including API docs"
	@echo "install-devenv - install backend development dependencies from pip"
	@echo "test - run all of the app's tests and print a coverage report"

clean-docs:
	rm -f docs/nacelle.*
	rm -f docs/modules.rst
	$(MAKE) -C docs clean

clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

docs: clean-docs
	$(MAKE) -C docs html
	xdg-open docs/_build/html/index.html

install-devenv:
	pip install -r nacelle/requirements.txt

test:
	cd example; $(MAKE) test
