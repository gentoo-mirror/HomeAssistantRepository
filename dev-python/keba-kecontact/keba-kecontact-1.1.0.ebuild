# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{5..9} )

inherit distutils-r1

MY_PN=${PN/-/_}
MY_P=${MY_PN}-${PV}

DESCRIPTION="A python library to communicate with the KEBA charging stations via udp"
HOMEPAGE="https://github.com/dannerph/keba-kecontact https://pypi.org/project/keba-kecontact/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${MY_P}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS="README.md"

RDEPEND=""
BDEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
