# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{6,7,8,9} pypy3  )

inherit distutils-r1

DESCRIPTION="Core utilities for Python packages"
HOMEPAGE="https://github.com/pypa/packaging https://pypi.org/project/packaging/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="|| ( Apache-2.0 BSD-2 )"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/pyparsing-2.1.10[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
DEPEND="
	test? (
		dev-python/pretend[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	"${FILESDIR}/${PN}-16.8-distutils.patch"
)

python_test() {
	pytest --capture=no --strict -vv || die
}

pkg_preinst() {
	# https://bugs.gentoo.org/585146
	cd "${HOME}" || die

	_cleanup() {
		local pyver=$("${PYTHON}" -c "from distutils.sysconfig import get_python_version; print(get_python_version())")
		local egginfo="${ROOT}$(python_get_sitedir)/${P}-py${pyver}.egg-info"
		if [[ -d ${egginfo} ]]; then
			rm -rv "${egginfo}" || die "Failed to remove egg-info directory"
		fi
	}
	python_foreach_impl _cleanup
}
