# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Converts a Python dictionary or other native data type into a valid XML string."
HOMEPAGE="https://github.com/quandyfactory/dicttoxml https://pypi.org/project/dicttoxml/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

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

PATCHES=(
	# https://github.com/quandyfactory/dicttoxml/pull/73/files
	"${FILESDIR}/${P}-py3.10.patch"
)

distutils_enable_tests pytest
