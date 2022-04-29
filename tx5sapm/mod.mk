# Marlin mod specific definitions.

# Which board.
MARLIN_MOD_BOARD = chitu_f103
# Use the encrypted binary image.
MARLIN_MOD_BIN = ${MARLIN_BUILD_DIR}/${MARLIN_MOD_BOARD}/update.cbd

# 3D printed parts for the mod.
MOD_MODEL = tx5sapm
MOD_MODEL_DIR = ${MOD_DIR}

# For Octoprint.
USE_OCTOPRINT = YES
# USE_OCTOPRINT = NO

# OctoPrint on an Orange PI Zero.
USE_OPIZ = YES
# USE_OPIZ = NO

# OctoPrint on a Raspberry PI 3.
# USE_RPI3 = YES
# USE_RPI3 = NO

# OctoPrint on a Raspberry PI 4.
# USE_RPI4 = YES
# USE_RPI4 = NO

ifeq (${USE_OCTOPRINT},YES)
MODEL_OPTIONS += USE_OCTOPRINT=YES

ifeq (${USE_OPIZ},YES)
# Installation instructions are at:
#  https://daumemo.com/installing-octoprint-on-orangepi-zero-part-1/
MODEL_OPTIONS += USE_OPIZ=YES

# Bullseye is Debian based.
OS_VERSION = Armbian_22.02.1_Orangepizero_bullseye_current_5.15.25

OS_IMAGE = ${OS_VERSION}.img
OS_IMAGE_FILE = ${OS_VERSION}.img.xz
OS_IMAGE_URL = https://redirect.armbian.com/orangepizero/Bullseye_current

UseXz = YES
endif

ifeq (${USE_RPI3},YES)
MODEL_OPTIONS += USE_RPI3=YES

# Pre-configured Raspberry PI OS (Raspian) image.
OS_VERSION = 0.18.0-1.7.3-20220323100241
OS_IMAGE_FILE = octopi-${OS_VERSION}.zip
OS_IMAGE = octopi-${OS_VERSION}.img
OS_IMAGE_URL = https://github.com/OctoPrint/OctoPi-UpToDate/releases/download/${OS_VERSION}/${OS_IMAGE_FILE}

UseZip = YES
endif

ifeq (${USE_RPI4},YES)
MODEL_OPTIONS += USE_RPI4=YES

# Pre-configured Raspberry PI OS (Raspian) image.
OS_VERSION = 0.18.0-1.7.3-20220323100241
OS_IMAGE_FILE = octopi-${OS_VERSION}.zip
OS_IMAGE = octopi-${OS_VERSION}.img
OS_IMAGE_URL = https://github.com/OctoPrint/OctoPi-UpToDate/releases/download/${OS_VERSION}/${OS_IMAGE_FILE}

UseZip = YES
endif

${DOWNLOADS_DIR}/${OS_IMAGE_FILE}:
	mkdir -p $(@D)
	wget -O $@ ${OS_IMAGE_URL}

${OS_IMAGE_DIR}/${OS_IMAGE}: \
  ${DOWNLOADS_DIR}/${OS_IMAGE_FILE}
	mkdir -p $(@D)
    ifeq (${UseZip}, YES)
	  unzip $< -d $(@D)
	  touch $@
    endif
    ifeq (${UseXz}, YES)
	  unxz -c $< > $@
    endif

.PHONY os_image_file:
os_image_file: ${DOWNLOADS_DIR}/${OS_IMAGE_FILE}

.PHONY os_image:
os_image: ${OS_IMAGE_DIR}/${OS_IMAGE}

MOD_DEPS = ${OS_IMAGE_DIR}/${OS_IMAGE}
endif
