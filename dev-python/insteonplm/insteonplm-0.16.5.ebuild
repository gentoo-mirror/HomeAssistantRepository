# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Python API for controlling Insteon PowerLinc Modems"
HOMEPAGE="https://github.com/nugget/python-insteonplm https://pypi.org/project/insteonplm/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="~dev-python/pyserial-3.2.0[${PYTHON_USEDEP}]
		 dev-python/pyserial-asyncio[${PYTHON_USEDEP}]
		 dev-python/async_timeout[${PYTHON_USEDEP}]
		 dev-python/aiohttp[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	sed -i "s/pyserial==3.2.0/pyserial/g" -i setup.py || die
	sed "s/packages=find_packages()/packages=find_packages(exclude=['tests','tests.*'])/g" -i setup.py || die
	eapply_user
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
