# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Async Typed Python package for the nVent RAYCHEM SENZ RestAPI"
HOMEPAGE="https://github.com/milanmeu/aiosenz https://pypi.org/project/aiosenz/"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/Authlib[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
