all: dedup svgclean 
dedup_dryrun:
	rdfind . 
dedup:
	rdfind -makesymlinks true .
	symlinks -crv .
svgclean: 
	mkdir -p release
	cp -r Obsidian* release/
	fd -t f -g '*.svg' | parallel 'svgcleaner {} release/{}'
	rm -r Obsidian*
	mv release/Obsidian* ./
	rmdir release
clean:
	rm -r release
