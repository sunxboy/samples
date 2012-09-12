#!/bin/sh
APP="website-admin"
ADDR=":8086"
PWD=`pwd`/..
GO_PWD=${PWD}/../..

if [ ! -d ${PWD}/src/add-on/src/golanger.com ]; then
    mkdir -p ${PWD}/src/add-on/src/golanger.com
    cp -R ${GO_PWD}/framework/* ${PWD}/src/add-on/src/golanger.com/
fi

echo "Golanger Web Framework"
echo "Golanger is a lightweight framework for writing web applications in Golang."
export GOPATH=${GO_PWD}/framework:${PWD}/src/add-on:${PWD}
cd ${PWD}/src

if [ -f ${APP} ]; then
    rm ${APP}
fi

echo "Building ${APP}"
go build .

if [ -f src ]; then
    mv ./src ${APP}
    echo "Runing ${APP}"
    ./$APP -addr=${ADDR}
fi