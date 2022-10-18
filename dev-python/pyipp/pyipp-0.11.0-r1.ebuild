# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Asynchronous Python client for Internet Printing Protocol (IPP)."
HOMEPAGE="https://github.com/ctalkington/python-ipp https://pypi.org/project/pyipp/"
MY_PN="python-ipp"
SRC_URI="https://github.com/ctalkington/${MY_PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.6.2[${PYTHON_USEDEP}]
	>=dev-python/deepmerge-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.4.2[${PYTHON_USEDEP}]"
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

distutils_enable_tests pytest
