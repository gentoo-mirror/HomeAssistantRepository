# Copyright 1999-2019 Gentoo Authors Andreas Billmeier b (at) edevau.net
# Distributed under the terms of the GNU General Public License v3.0

EAPI="7"

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

MY_P="${PN}-${PV/_beta/b}"

DESCRIPTION="A library to interface with the opentherm gateway through serial or network connection."
HOMEPAGE="https://github.com/mvn23/pyotgw https://pypi.org/project/pyotgw/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=""
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

S="${WORKDIR}/${MY_P}"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
