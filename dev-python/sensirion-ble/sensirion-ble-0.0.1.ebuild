# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Manage Sensirion BLE devices"
HOMEPAGE="https://github.com/akx/sensirion-ble/ https://pypi.org/project/sensirion-ble/"
COMMIT="71ee4a1720b9409d25d57bcb7d05637615be6639"
SRC_URI="https://github.com/akx/sensirion-ble/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/bluetooth-data-tools-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-bluetooth-1.6.0[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
