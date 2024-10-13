PROJECT=gtest-test.a

IDIR=.
CXX=g++
CXXFLAGS=-I$(IDIR)

ODIR=obj
LDIR =../lib

LIBS=-lm

TESTLIBS=-lgtest -lgtest_main -lpthread

DEPS = democlass.h


OBJ = democlass.o

.PHONY: default

default: all;

%.o: %.cpp $(DEPS) #Перекомпилируем исходник, если изменился он сам или любой из заголовков
	$(CXX) -c -o $@ $< $(CXXFLAGS)

$(PROJECT): $(OBJ)
	ar rsv $@ $^ #Демонстрация сборки статической библиотеки

#.PRECIOUS: test-%.o #Раскомментировать, если нужно изучить объектный файл теста

test-%.o: test-%.cpp $(DEPS)
	$(CXX) -c -o $@ $< $(CXXFLAGS) #Компиляция теста. Несмотря на однофайловую структуру, тест нельзя собирать неявно

test-%: test-%.o $(PROJECT)
	$(CXX) -o $@ $<  $(CXXFLAGS) -L. -l:$(PROJECT) $(TESTLIBS) #Сборка теста указываем для линковки библиотеку проекта и зависимости gtest
	./$@

.PHONY: test #Цель для сборки всех тестов

test: $(PROJECT) $(basename $(wildcard test-*.cpp));


all: $(PROJECT)

.PHONY: clean

clean:
	rm -f *.o *~ core $(INCDIR)/*~

cleanall: clean
	rm -f $(PROJECT)
	rm -f $(basename $(wildcard test-*.cpp))
