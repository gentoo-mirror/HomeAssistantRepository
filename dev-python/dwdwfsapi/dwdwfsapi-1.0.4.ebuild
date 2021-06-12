# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Python client to retrieve data provided by DWD via their geoserver WFS API"
HOMEPAGE="https://github.com/stephan192/dwdwfsapi https://pypi.org/project/dwdwfsapi/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.md"

RDEPEND=">=dev-python/requests-2.23.0[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/ciso8601-2.1.3[${PYTHON_USEDEP}]
	<dev-python/ciso8601-3[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.8[${PYTHON_USEDEP}]
	<dev-python/urllib3-2[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
