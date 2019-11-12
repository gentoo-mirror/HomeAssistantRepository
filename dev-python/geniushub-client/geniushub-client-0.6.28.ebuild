# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="A aiohttp-based client for Genius Hub systems"
HOMEPAGE="https://github.com/zxdavb/geniushub-client https://pypi.org/project/geniushub-client/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=""
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	~dev-python/aiohttp-3.5.4[${PYTHON_USEDEP}]
	~dev-python/async-timeout-3.0.1[${PYTHON_USEDEP}]
	~dev-python/attrs-19.1.0[${PYTHON_USEDEP}]
	~dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	~dev-python/docopt-0.6.2[${PYTHON_USEDEP}]
	~dev-python/idna-2.8[${PYTHON_USEDEP}]
	~dev-python/idna-ssl-1.1.0[${PYTHON_USEDEP}]
	~dev-python/multidict-4.5.2[${PYTHON_USEDEP}]
	~dev-python/typing-extensions-3.7.2[${PYTHON_USEDEP}]
	~dev-python/yarl-1.3.0[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
