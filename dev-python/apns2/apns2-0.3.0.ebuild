# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION="A python library for interacting with the Apple Push Notification Service via HTTP/2 protocol"
HOMEPAGE="https://github.com/Pr0Ger/PyAPNs2 https://pypi.org/project/apns2/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/pyjwt-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-1.7.2[${PYTHON_USEDEP}]
	>=dev-python/hyper-0.7[${PYTHON_USEDEP}]"
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
