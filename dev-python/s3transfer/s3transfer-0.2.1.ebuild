# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )
inherit distutils-r1

DESCRIPTION="An Amazon S3 Transfer Manager"
HOMEPAGE="https://github.com/boto/s3transfer"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86 ~amd64-linux ~x86-linux ~arm64"
IUSE="test"

# botocore>=1.12.36,<2.0.0
CDEPEND="
	>=dev-python/botocore-1.12.36[${PYTHON_USEDEP}]
	<dev-python/botocore-2.0.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/futures[${PYTHON_USEDEP}]' 'python2_7')
"
# Pin mock to 1.3.0 if testing failures due to mock occur.
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		${CDEPEND}
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/nose[${PYTHON_USEDEP}]
	)
"
RDEPEND="${CDEPEND}"

#PATCHES=( "${FILESDIR}/s3transfer-0.1.13-tests.patch" )
python_test() {
	nosetests -v tests/unit/ tests/functional/ || die "tests failed under ${EPYTHON}"
}
