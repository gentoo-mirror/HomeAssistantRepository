# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Easily forge ICMP packets and make your own ping and traceroute."
HOMEPAGE="https://github.com/ValentinBELYN/icmplib https://pypi.org/project/icmplib/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

distutils_enable_tests pytest
