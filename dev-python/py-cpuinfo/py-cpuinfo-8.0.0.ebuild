# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Get CPU info with pure Python 2 & 3"
HOMEPAGE="
	https://github.com/workhorsy/py-cpuinfo/
	https://pypi.org/project/py-cpuinfo/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

distutils_enable_tests setup.py
