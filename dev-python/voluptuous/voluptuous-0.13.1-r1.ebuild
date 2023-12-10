# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="A Python data validation library"
HOMEPAGE="https://github.com/alecthomas/voluptuous/"
SRC_URI="
	https://github.com/alecthomas/voluptuous/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

PATCHES=(
	"${FILESDIR}"/${PN}-0.11.5-fix-doctest.patch
)

distutils_enable_tests pytest
