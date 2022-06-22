# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Python Bluetooth LE (Low Energy) and GATT Library"
HOMEPAGE="https://github.com/peplin/pygatt https://pypi.org/project/pygatt/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/enum-compat[${PYTHON_USEDEP}]"
BDEPEND="dev-python/nose[${PYTHON_USEDEP}]
	dev-python/coverage[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
