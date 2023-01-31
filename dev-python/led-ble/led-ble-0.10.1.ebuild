# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Control a wide range of LED BLE devices"
HOMEPAGE="https://github.com/bluetooth-devices/led-ble https://pypi.org/project/led-ble/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/bleak-0.17.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-1.17.1[${PYTHON_USEDEP}]
	>=dev-python/async-timeout-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/flux-led-0.28.32[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
