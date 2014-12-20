
all: ../data/biblio.json

bibfile := ../data/biblio.bib

../data/biblio.json: $(bibfile) ./cv-process-pub.ls
	./cv-process-pub.ls -- -m > $@

clean: 
	rm ../data/biblio.json

