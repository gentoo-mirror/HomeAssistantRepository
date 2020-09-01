# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Python docstring style checker"
HOMEPAGE="https://github.com/PyCQA/pydocstyle/ https://pypi.org/project/pydocstyle/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="dev-python/snowballstemmer[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

#src_prepare() {
#	default
#	# These tests call pip.
#	# pip install fails because we are not allowed to do that inside an ebuild.
#	rm "${S}/src/tests/test_integration.py" || die
#}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
