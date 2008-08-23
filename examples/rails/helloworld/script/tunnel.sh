#! /bin/bash

exec ssh -C -v -o TCPKeepAlive=true beautypk@61.172.255.117 -R5100:127.0.0.1:3003
