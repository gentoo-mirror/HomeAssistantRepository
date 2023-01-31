# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Communicate with VOC"
HOMEPAGE="https://github.com/molobrakos/volvooncall https://pypi.org/project/volvooncall/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="console mqtt test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	console? (
			 dev-python/certifi[${PYTHON_USEDEP}]
			 >=sci-geosciences/geopy-1.14.0[${PYTHON_USEDEP}] )
	mqtt? (
			 dev-python/certifi[${PYTHON_USEDEP}]
			 dev-python/amqtt[${PYTHON_USEDEP}] )"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
