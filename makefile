OSG_DIR = /home/capuccinoman/osg/OpenSceneGraph/

CXX = g++-8
CXX_FLAGS = -std=c++17
CXX_FLAGS += -Wuninitialized -Wall -Wextra -Werror -pedantic -Wfatal-errors # source code quality.
CXX_FLAGS += -O3 -ffast-math # fast version.
#CXX_FLAGS += -O0 -g # debug version.

# include paths.
CXX_FLAGS += -I$(OSG_DIR)/include/

LINK_FLAGS = -lstdc++fs # filesystem
LINK_FLAGS += -L$(OSG_DIR)/lib/
LINK_FLAGS += -Wl,-R$(OSG_DIR)/lib/
LINK_FLAGS += -losgViewer
LINK_FLAGS += -losg

SRCS = main.cpp

%.o: %.cpp; $(CXX) $(CXX_FLAGS) -o $@ -c $<

OBJS = $(SRCS:.cpp=.o)

all: $(OBJS); $(CXX) $^ -o square.out $(LINK_FLAGS)

clean: ; rm -rf square.out $(OBJS) *.dSYM
