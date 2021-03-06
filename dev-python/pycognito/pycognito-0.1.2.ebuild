# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Python class to integrate Boto3's Cognito client so it is easy to login users. With SRP support."
HOMEPAGE="https://github.com/pvizeli/pycognito https://pypi.org/project/pycognito/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

# cannot use >=dev-python/boto3-1.10.49 with 0.108.3
RDEPEND="dev-python/boto3[${PYTHON_USEDEP}]
		 >=dev-python/envs-1.3[${PYTHON_USEDEP}]
		 >=dev-python/python-jose-3.1.0[${PYTHON_USEDEP}]
		 >=dev-python/requests-2.22.0[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
