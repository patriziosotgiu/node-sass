

sasscpp: sasscpp.cpp context.cpp functions.cpp document.cpp document_parser.cpp eval_apply.cpp node.cpp node_comparisons.cpp values.cpp prelexer.cpp
	g++ -o bin/sasscpp sassc.cpp context.cpp functions.cpp document.cpp document_parser.cpp eval_apply.cpp node.cpp node_comparisons.cpp values.cpp prelexer.cpp

sassc: sassc.o libsass
	gcc -o bin/sassc sassc.o libsass.a -lstdc++

sassc_obj: sassc.c
	gcc -c sassc.c

libsass: sass_interface.o context.o functions.o document.o document_parser.o eval_apply.o node.o node_comparisons.o values.o prelexer.o
	ar rvs libsass.a sass_interface.o context.o functions.o document.o document_parser.o eval_apply.o node.o node_comparisons.o values.o prelexer.o

libsass_objs: sass_interface.cpp context.cpp functions.cpp document.cpp document_parser.cpp eval_apply.cpp node.cpp node_comparisons.cpp values.cpp prelexer.cpp
	g++ -c sass_interface.cpp context.cpp functions.cpp document.cpp document_parser.cpp eval_apply.cpp node.cpp node_comparisons.cpp values.cpp prelexer.cpp

test: sassc
	ruby spec.rb spec/basic/

test_all: sassc
	ruby spec.rb spec/

clean:
	rm -rf *.o
	rm -rf *.a
	rm -rf bin/*