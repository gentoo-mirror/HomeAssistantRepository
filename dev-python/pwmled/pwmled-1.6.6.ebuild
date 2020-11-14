# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6..8} )

inherit distutils-r1

DESCRIPTION="Control LEDs connected to a micro controller using pwm."
HOMEPAGE="https://github.com/soldag/python-pwmled/ https://pypi.org/project/pwmled/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm ~arm64"
IUSE="test"

DOCS="README.md"

RDEPEND="~dev-libs/pigpio-1.35[${PYTHON_USEDEP}]
	~dev-python/Adafruit-Blinka-5.5.1[${PYTHON_USEDEP}]
	~dev-python/adafruit-circuitpython-pca9685-3.3.2[${PYTHON_USEDEP}]
	~dev-python/python-singleton-0.1.2[${PYTHON_USEDEP}]"
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
