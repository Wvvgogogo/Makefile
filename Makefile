# 声明一下伪目标
.PHONY:clean rebuilt all

#包含头文件
include ./user/src/src.mk

TAG := ./bin/main #指明生成文件与路径
#SRC := $(wildcard ./user/src/*.c) #列出该路径下的所有.c文件
OBJ := $(SRC:%.c=%.o) #将.c文件替换成.o文件
OBJS := $(patsubst ./user/src/%.o, ./obj/%.o, $(OBJ)) #将OBJ中的所有字符以para1中的模式替换成para2
INC += -I ./user/inc


override CFLAGS += -O2 -g -Wall $(INC) -L./lib #override 保护CFLAGS不被命令行make参数串改

all:$(TAG)	#Makefile 会执行第一条命令

$(TAG):$(OBJS)
	$(CC) $(CFLAGS) $(^) -o $(@)

./obj/%.o:./user/src/%.c
	$(CC) $(CFLAGS) -c $(<) -o $(@) 


rebuilt: clean all #先清空 再构建


clean:
	rm -rf ./bin/* ./obj/*.o
