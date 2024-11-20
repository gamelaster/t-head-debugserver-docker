FROM ubuntu:22.04

WORKDIR /tool

RUN apt update && apt install --yes sudo wget && \
    wget https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource//1698310757460/T-Head-DebugServer-linux-x86_64-V5.18.0-20230926.sh.tar.gz && \
    tar xf T-Head-DebugServer-linux-x86_64-V5.18.0-20230926.sh.tar.gz && \
    yes YES | ./T-Head-DebugServer-linux-x86_64-V5.18.0-20230926.sh -i

WORKDIR /tool/T-HEAD_DebugServer/

ENTRYPOINT [ "/tool/T-HEAD_DebugServer/DebugServerConsole.elf" ]
EXPOSE 1025