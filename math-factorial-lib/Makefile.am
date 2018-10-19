AM_CXXFLAGS = -std=c++11

#   fact

bin_PROGRAMS = fact

fact_SOURCES = main.cpp

fact_DEPENDENCIES = libfactorial.la

fact_LDADD = $(fact_DEPENDENCIES)

#   libfactorial.so

# redefine default $(libdir)/math-factorial
pkglibdir = $(libdir)

pkglib_LTLIBRARIES = libfactorial.la

libfactorial_la_SOURCES = factorial.cpp

libfactorial_la_LDFLAGS = -module -version-info 2:0:0

include_HEADERS = factorial.h
