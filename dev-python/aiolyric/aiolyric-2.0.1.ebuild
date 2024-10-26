# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="AIO package for the Honeywell Lyric Platform."
HOMEPAGE="https://github.com/timmo001/aiolyric https://pypi.org/project/aiolyric/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.7.3[${PYTHON_USEDEP}]
	>=dev-python/incremental-22.10.0[${PYTHON_USEDEP}]"

src_prepare() {
	touch requirements_setup.txt || die
	touch requirements.txt || die
	eapply_user
}

distutils_enable_tests pytest
