# ����һ��αĿ��
.PHONY:clean rebuilt all

#����ͷ�ļ�
include ./user/src/src.mk

TAG := ./bin/main #ָ�������ļ���·��
#SRC := $(wildcard ./user/src/*.c) #�г���·���µ�����.c�ļ�
OBJ := $(SRC:%.c=%.o) #��.c�ļ��滻��.o�ļ�
OBJS := $(patsubst ./user/src/%.o, ./obj/%.o, $(OBJ)) #��OBJ�е������ַ���para1�е�ģʽ�滻��para2
INC += -I ./user/inc


override CFLAGS += -O2 -g -Wall $(INC) -L./lib #override ����CFLAGS����������make��������

all:$(TAG)	#Makefile ��ִ�е�һ������

$(TAG):$(OBJS)
	$(CC) $(CFLAGS) $(^) -o $(@)

./obj/%.o:./user/src/%.c
	$(CC) $(CFLAGS) -c $(<) -o $(@) 


rebuilt: clean all #����� �ٹ���


clean:
	rm -rf ./bin/* ./obj/*.o
