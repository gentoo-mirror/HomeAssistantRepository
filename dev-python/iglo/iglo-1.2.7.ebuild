# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION="Control iGlo based RGB lights"
HOMEPAGE="http://github.com/jesserockz/python-iglo https://pypi.org/project/iglo/"
# SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
# SRC_URI="https://github.com/jesserockz/python-iglo/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://github.com/onkelbeh/python-iglo/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
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

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
