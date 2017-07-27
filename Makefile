CC=	gcc
LIBS= -pthread -lm lib/zlib/libz.a -lm lib/jemalloc/lib/libjemalloc.a -lm lib/hdf5/lib/libhdf5-static.a  -lm lib/hdf5/lib/libhdf5_hl-static.a -ldl -lm lib/libdivsufsort/lib/libdivsufsort64.a
CFLAGS=	-fgnu89-inline -O2 -D USE_JEMALLOC -D DEBUG
Hera:	
	mkdir -p build/
	$(CC) $(CFLAGS) src/xxhash.c src/bgzf.c src/hash_align.c src/EM.c src/bam_write.c src/fusion.c src/fmindex.c src/genome_map.c src/assembly.c src/main.c $(LIBS) -o build/hera
	cp src/hera_build build/hera_build
	chmod +x build/hera_build
clean:
	rm -f *.o
	rm -rf build
	rm -rf lib
