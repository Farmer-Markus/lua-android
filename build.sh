#!/bin/bash

NDK="$HOME/Android/Sdk/ndk/25.1.8937393"

mkdir -p build/lib/armeabi-v7a

cd build/lib/armeabi-v7a

echo "Configuring for "armeabi-v7a""

cmake -DCMAKE_TOOLCHAIN_FILE=$NDK/build/cmake/android.toolchain.cmake -DANDROID_ABI=armeabi-v7a -DCMAKE_C_COMPILER=$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/clang -DCMAKE_CXX_COMPILER=$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ ../../../

if [ $? -eq 0 ]; then
    echo "CMake configuration successful."
    # Run the build command
    cmake --build .
else
    echo "CMake configuration failed."
    exit
fi

cd ..

mkdir arm64-v8a

cd arm64-v8a

echo "Configuring for "arm64-v8a""

cmake -DCMAKE_TOOLCHAIN_FILE=$NDK/build/cmake/android.toolchain.cmake -DANDROID_ABI=arm64-v8a -DCMAKE_C_COMPILER=$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/clang -DCMAKE_CXX_COMPILER=$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ ../../../

if [ $? -eq 0 ]; then
    echo "CMake configuration successful."
    # Run the build command
    cmake --build .
else
    echo "CMake configuration failed."
    exit
fi

cd ..

echo "Configuring for "x86""

mkdir x86

cd x86

cmake -DCMAKE_TOOLCHAIN_FILE=$NDK/build/cmake/android.toolchain.cmake -DANDROID_ABI=x86 -DCMAKE_C_COMPILER=$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/clang -DCMAKE_CXX_COMPILER=$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ ../../../

if [ $? -eq 0 ]; then
    echo "CMake configuration successful."
    # Run the build command
    cmake --build .
else
    echo "CMake configuration failed."
    exit
fi


cd ..

mkdir x86_64

cd x86_64

echo "Configuring for "x86_64""

cmake -DCMAKE_TOOLCHAIN_FILE=$NDK/build/cmake/android.toolchain.cmake -DANDROID_ABI=x86_64 -DCMAKE_C_COMPILER=$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/clang -DCMAKE_CXX_COMPILER=$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ ../../../

if [ $? -eq 0 ]; then
    echo "CMake configuration successful."
    # Run the build command
    cmake --build .
else
    echo "CMake configuration failed."
    exit
fi

echo "Build for target "armeabi-v7a" "arm64-v8a" "x86" "x86_64""
