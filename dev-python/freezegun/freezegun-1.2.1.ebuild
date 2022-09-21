# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Let your Python tests travel through time"
HOMEPAGE="https://github.com/spulec/freezegun"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND=">dev-python/python-dateutil-2.7[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		$(python_gen_impl_dep sqlite)
	)
"

distutils_enable_tests pytest

PATCHES=("${FILESDIR}/${PN}-1.1.0-py310.patch")
