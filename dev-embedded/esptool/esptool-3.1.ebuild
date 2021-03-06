# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="A serial utility to communicate & flash code to Espressif ESP8266 & ESP32 chips."
HOMEPAGE="https://github.com/espressif/esptool https://pypi.org/project/esptool/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPLv2+"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 x86 ~amd64-linux ~x86-linux"
IUSE="test"

DOCS=""

RDEPEND=""
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
