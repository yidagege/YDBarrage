#!/bin/sh
#默认ARCH=Release KEEP_INCLUDE_DIR="" [KeepDir]
CONFIG_FILE="$HOME/path.conf"
XBUILD="/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild"
PROJECT_ROOT=$(dirname $(pwd -P $0)/${0#\.\/})
PROJECT="$PROJECT_ROOT/YDBarrage.xcodeproj"
TARGET="YDBarrage"
PRODUCT="$PROJECT_ROOT/product"
ARCH="Release"
KEEP_INCLUDE_DIR=""

echo $PROJECT_ROOT
echo $PROJECT


if [[ -f $CONFIG_FILE ]]
then
	echo 'path file is OK'
	. $CONFIG_FILE
else
	echo 'trunk_path="$HOME/"' > $CONFIG_FILE
	echo '请修改~/:你的trunk工程对应的路径'
	sleep 2
	nano $CONFIG_FILE
	echo "请重新运行此脚本"
	exit 0
fi

#update first
git pull --rebase

#check input parameters
if [ $# -gt 0 ]; then
	if [ "$1" = "Debug" ]; then
		ARCH="$1"
	elif [ "$1" = "Release" ]; then
		ARCH="$1"
	else
		ARCH="Release"
	fi
	
	if [ "$1" = "KeepDir" ]; then
		KEEP_INCLUDE_DIR=$1
	fi
	if [ "$2" = "KeepDir" ]; then
		KEEP_INCLUDE_DIR=$2
	fi
fi

mkdir -p "$PRODUCT"

#all: QYBarrage.a
#libi386.a:
$XBUILD -project $PROJECT -target $TARGET -sdk iphonesimulator -configuration $ARCH clean build
cp $PROJECT_ROOT/build/$ARCH-iphonesimulator/lib$TARGET.a "./lib_i386.a"

#libArmv7.a:
$XBUILD -project $PROJECT -target $TARGET -sdk iphoneos -arch armv7 -configuration $ARCH clean build
cp $PROJECT_ROOT/build/$ARCH-iphoneos/lib$TARGET.a "./lib_armv7.a"

#libArm64.a:
$XBUILD -project $PROJECT -target $TARGET -sdk iphoneos -arch arm64 -configuration $ARCH clean build
cp $PROJECT_ROOT/build/$ARCH-iphoneos/lib$TARGET.a "./lib_arm64.a"

rm "${PRODUCT}/libYDBarrage.a"

#libUniversal.a: libi386.a libArmv7.a libArm64.a
lipo -create "./lib_i386.a"  "./lib_armv7.a"  "./lib_arm64.a" -output "${PRODUCT}/libYDBarrage.a"
rm lib_i386.a
rm lib_armv7.a
rm lib_arm64.a
echo "清理删除完成"
#cp headers 
rm -Rf "$PRODUCT/include"
mkdir -p "$PRODUCT/include"

find $PROJECT_ROOT/build/$ARCH-iphonesimulator/ -iname "*.h" -exec cp {} "$PRODUCT/include" \;

echo "拷贝完成"
