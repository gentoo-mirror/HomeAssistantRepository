# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python API for interacting with Netdata."
HOMEPAGE="https://github.com/fabaff/python-netdata https://pypi.org/project/netdata/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/httpx-0.26.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.8.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
