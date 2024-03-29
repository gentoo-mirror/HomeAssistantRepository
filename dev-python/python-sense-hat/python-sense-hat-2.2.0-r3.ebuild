# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="Raspberry Pi Sense HAT python library"
HOMEPAGE="https://github.com/astro-pi/python-sense-hat"
SRC_URI="https://github.com/astro-pi/python-sense-hat/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/rtimulib[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"
