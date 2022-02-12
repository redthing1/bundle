CXX=clang++
CPPFLAGS+=-Dunix --std=c++0x
# CPPFLAGS+=NOJIT
CXXFLAGS=-O3 -march=native
LFLAGS=-Wl,--whole-archive -lpthread -Wl,--no-whole-archive
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/share/man

all: libbundle.a demo

demo: libbundle.a demo.cc
	$(CXX) -static $(CPPFLAGS) $(CXXFLAGS) -o $@ demo.cc -L. -lbundle $(LFLAGS)

bundle.o: bundle.cpp bundle.h
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c bundle.cpp -pthread

libbundle.a: bundle.o
	ar rcs libbundle.a $^
