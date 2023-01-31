# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="A Python wrapper for the Discord API forked from discord.py"
HOMEPAGE="https://github.com/nextcord/nextcord https://pypi.org/project/nextcord/"
MY_PN=${PN/-/.}
MY_PV=${PV/_alpha/a}
SRC_URI="mirror://pypi/${P:0:1}/${MY_PN}/${MY_PN}-${MY_PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${MY_PN}-${MY_PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
