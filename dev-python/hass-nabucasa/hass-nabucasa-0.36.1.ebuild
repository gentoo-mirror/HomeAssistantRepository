# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7,8} )

inherit distutils-r1

DESCRIPTION="Home Assistant cloud integration by Nabu Casa, inc."
HOMEPAGE="https://github.com/NabuCasa/hass-nabucasa/ https://www.nabucasa.com/ https://pypi.org/project/hass-nabucasa/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 x86 amd64-linux x86-linux"
IUSE="test"

RDEPEND="~dev-python/pycognito-0.1.4[${PYTHON_USEDEP}]
		 ~dev-python/snitun-0.20[${PYTHON_USEDEP}]
		 ~app-crypt/acme-1.7.0
		 >=dev-python/cryptography-2.8[${PYTHON_USEDEP}]
		 >=dev-python/attrs-19.3.0[${PYTHON_USEDEP}]
		 >=dev-python/pytz-2019.3[${PYTHON_USEDEP}]
		 >=dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]
		 ~dev-python/atomicwrites-1.4.0[${PYTHON_USEDEP}]"
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
