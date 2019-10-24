# Copyright 1999-2019 Gentoo Authors Andreas Billmeier b (at) edevau.net
# Distributed under the terms of the GNU General Public License v3.0

EAPI="7"

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

MY_PN=${PN/-/.}
MY_P=${MY_PN}-${PV}

DESCRIPTION="A python wrapper for the Discord API"
HOMEPAGE="https://github.com/Rapptz/discord.py https://pypi.org/project/discord.py/"
#SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
#SRC_URI="https://github.com/Rapptz/discord.py/archive/v1.2.3.tar.gz"
SRC_URI="https://github.com/Rapptz/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

S=${WORKDIR}/${MY_P}

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
