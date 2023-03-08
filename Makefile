
PYTHON ?= python3
PIP ?= pip3
PYTEST ?= pytest

DOC_ROOT = doc
EXAMPLES = examples

.PHONY: clean
clean: doc-clean
	find . -name '*.pyc' -delete
	find . -name '*~' -delete
	rm -rf *.egg-info
	rm -f .coverage
	rm -f coverage.xml
	rm -rf build

.PHONY: test
test:
	$(PYTEST)

.PHONY: test-coverage
test-coverage:
	rm -f .coverage
	rm -f coverage.xml
	$(PYTEST) --cov=./ --cov-report=xml 

.PHONY: install
install:
	#PYTHONPATH=. $(PYTHON) setup.py install <-- wrong! Use newer tools!
	$(PIP) install .

.PHONY: doc-html
doc-html:
	(cd $(DOC_ROOT); make html)

.PHONY: doc-clean
doc-clean:
	(cd $(DOC_ROOT); make clean)

.PHONY: examples
examples:
	PYTHONPATH=. $(PYTHON) examples/cairo_example.py
	PYTHONPATH=. $(PYTHON) examples/pcb_example.py

