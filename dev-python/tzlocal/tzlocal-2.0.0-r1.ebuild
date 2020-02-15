# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="tzinfo object for the local timezone"
HOMEPAGE="https://github.com/regebro/tzlocal"
SRC_URI="mirror://pypi/t/${PN}/${P}.tar.gz"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64 arm64 x86 amd64-linux x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDPEND="dev-python/pytz[${PYTHON_USEDEP}]"

python_test() {
	unset TZ
	"${PYTHON}" -m unittest discover || die "Testing failed with ${EPYTHON}"
}
