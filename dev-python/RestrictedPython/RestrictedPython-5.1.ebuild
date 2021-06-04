# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

MY_P=${P/_beta/b}
MY_PV=${PV/_beta/b}

DESCRIPTION="subset of Python which allows program input into a trusted environment."
HOMEPAGE="https://github.com/zopefoundation/RestrictedPython https://pypi.python.org/pypi/RestrictedPython https://pypi.org/project/RestrictedPython/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 x86 amd64-linux x86-linux"
IUSE="test"

RDEPEND=""
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}/${MY_P}"
PYTHON_MODULES="${MY_PN}"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
