# Makefile
Makefile_template

# 结构
.
├── bin
│   └── main
├── lib
├── Makefile
├── obj
│   ├── beep.o
│   ├── main.o
│   ├── tcp_client.o
│   └── uart.o
└── user
    ├── inc
    │   ├── beep.h
    │   ├── includes.h
    │   ├── my_define.h
    │   ├── tcp_client.h
    │   └── uart.h
    └── src
        ├── beep.c
        ├── main.c
        ├── src.mk
        ├── tcp_client.c
        └── uart.c

# 注意
src下的.mk是将每个源文件的路径加入变量SRC
