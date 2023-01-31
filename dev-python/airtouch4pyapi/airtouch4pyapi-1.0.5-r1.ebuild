# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="An api allowing control of AC state (temperature, on/off, mode) of an Airtouch 4 controller locally over TCP"
HOMEPAGE="https://github.com/LonePurpleWolf/airtouch4pyapi https://pypi.org/project/airtouch4pyapi/"
COMMIT="34783888846783c058fe79cec16feda45504f701"
SRC_URI="https://github.com/LonePurpleWolf/${PN}/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
