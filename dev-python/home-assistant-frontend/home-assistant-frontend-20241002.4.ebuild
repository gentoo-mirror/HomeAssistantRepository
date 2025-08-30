# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3_11 python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="The Home Assistant frontend"
HOMEPAGE="https://github.com/home-assistant/frontend https://pypi.org/project/home-assistant-frontend/"
SRC_URI="https://hasf.edevau.net/${P:0:1}/${PN}/${P}.tar.xz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"
DOCS="README.md"
RDEPEND="~dev-python/user-agents-2.0[${PYTHON_USEDEP}]"
