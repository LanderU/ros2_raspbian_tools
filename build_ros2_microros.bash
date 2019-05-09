#!/bin/bash

set -euf -o pipefail

PYTHON_MAJOR=3
PYTHON_MINOR=5

export OSPL_HOME=${RASPBERRYPI_CROSS_COMPILE_SYSROOT}home/pi/opensplice-minimal_both
export PATH=$OSPL_HOME/bin:$PATH
export LD_LIBRARY_PATH=$OSPL_HOME/lib:${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/lib/arm-linux-gnueabihf/
#export OSPL_URI=file://$OSPL_HOME/etc/opensplice/config/ospl.xml

cd /agent_ws

echo "RASPBERRYPI_CROSS_COMPILE_SYSROOT " $RASPBERRYPI_CROSS_COMPILE_SYSROOT
echo "RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PATH " $RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PATH
echo "RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PREFIX " $RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PREFIX

#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$OSPL_HOME/lib/armv7l.linux-dev:$OSPL_HOME/lib/x86_64.linux-release
#     --force-cmake-configure \
#     --only-packages hrim_actuator_gripper_msgs hros_actuation_servomotor_hans_lifecycle hros_actuation_servomotor_hebi_lifecycle  hros_actuation_servomotor_m90pal_lifecycle peak_usbcan \

# hrim_sensor_thermometer_msgs
# hrim_ui_rc_msgs



colcon build --merge-install --packages-skip-regex complex_msg_publisher_cpp int32_publisher_cpp int32_subscriber_cpp complex_msg_subscriber_cpp int32_subscriber_cpp rad0_control_cpp string_publisher_cpp string_subscriber_cpp\
    --cmake-args \
    -DBUILD_SHARED_LIBS=ON \
    -DCOMPILING_SERVER=True \
    -DBUILD_TESTING=False \
    -DCMAKE_CXX_STANDARD=14 \
    -DCMAKE_FIND_ROOT_PATH="/agent_ws/install" \
    -DCMAKE_TOOLCHAIN_FILE="/polly/raspberrypi3-cxx14.cmake" \
    -DPYTHON_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}usr/include/python${PYTHON_MAJOR}.${PYTHON_MINOR}m" \
    -DPYTHON_LIBRARY="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}usr/lib/${RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PREFIX}/libpython${PYTHON_MAJOR}.${PYTHON_MINOR}m.so" \
    -DPYTHON_SOABI="cpython-${PYTHON_MAJOR}${PYTHON_MINOR}m-${RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PREFIX}" \
    -DEIGEN3_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}usr/include/eigen3" \
    -DOpenCV_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}usr/share/OpenCV" \
    -DEigen3_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}usr/lib/cmake/eigen3" \
    -DASIO_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}usr/include" \
    -DTINYXML2_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}usr/include" \
    -DTINYXML2_LIBRARY="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}usr/lib/${RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PREFIX}/libtinyxml2.so" \
    -DTinyXML_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}usr/include" \
    -DTinyXML_LIBRARY="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}usr/lib/${RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PREFIX}/libtinyxml.so" \
    -DBOOST_INCLUDEDIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}usr/include/boost/" \
    -DLog4cxx_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}usr/include/log4cxx" \
    -DLog4cxx_LIBRARY="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}usr/lib/${RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PREFIX}/liblog4cxx.so"

    #-DCMAKE_PREFIX_PATH=${RASPBERRYPI_CROSS_COMPILE_SYSROOT}home/pi/opensplice-minimal/share/opensplice/cmake/ \
