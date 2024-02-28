# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Guppy 3 -- Guppy-PE ported to Python 3"
HOMEPAGE="https://github.com/zhuyifei1999/guppy3/ https://pypi.org/project/guppy3/"
SRC_URI="https://github.com/zhuyifei1999/${PN}/archive/refs/tags/v${PV/_p/.post}.tar.gz -> ${P}.gh.tar.gz"
# https://github.com/zhuyifei1999/guppy3/archive/refs/tags/v3.1.4.post1.tar.gz
S="${WORKDIR}"/${P/_p/.post}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

distutils_enable_tests pytest
