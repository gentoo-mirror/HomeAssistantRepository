# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Library implementing EZSP"
HOMEPAGE="https://github.com/zigpy/bellows https://pypi.org/project/bellows/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="dev-python/click[${PYTHON_USEDEP}]
     ~dev-python/click-log-0.2.0[${PYTHON_USEDEP}]
     ~dev-python/pure-pcapy3-1.0.1[${PYTHON_USEDEP}]
     dev-python/pyserial-asyncio[${PYTHON_USEDEP}]
     dev-python/voluptuous[${PYTHON_USEDEP}]
     >=dev-python/zigpy-0.20.1[${PYTHON_USEDEP}]"
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
