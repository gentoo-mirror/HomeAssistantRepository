# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Switcher Water Heater Unofficial Bridge and API."
HOMEPAGE="https://pypi.org/project/aioswitcher/ https://pypi.org/project/aioswitcher/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

# only for building outside portage
# RDEPEND="~dev-python/poetry-1.0.5[${PYTHON_USEDEP}]"

RDEPEND=""
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

DOCS="README.md"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
