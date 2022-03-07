# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit readme.gentoo-r1 distutils-r1

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/esphome/esphome.git"
	EGIT_BRANCH="dev"
	S="${WORKDIR}/${P}/"
else
	MY_P=${P/_beta/b}
	MY_PV=${PV/_beta/b}
	SRC_URI="https://github.com/${PN}/${PN}/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${MY_P}/"
fi

DESCRIPTION="Make creating custom firmwares for ESP32/ESP8266 super easy."
HOMEPAGE="https://github.com/esphome/esphome https://pypi.org/project/esphome/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 x86 ~amd64-linux ~x86-linux"
IUSE="+server test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	server? ( acct-group/${PN} acct-user/${PN} )
	~dev-python/voluptuous-0.12.2[${PYTHON_USEDEP}]
	~dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	~dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}]
	~dev-python/colorama-0.4.4[${PYTHON_USEDEP}]
	server? ( ~www-servers/tornado-6.1[${PYTHON_USEDEP}] )
	~dev-python/tzlocal-4.1[${PYTHON_USEDEP}]
	>=dev-python/tzdata-2021.1[${PYTHON_USEDEP}]
	~dev-python/pyserial-3.5[${PYTHON_USEDEP}]
	~dev-embedded/platformio-5.2.4
	~dev-embedded/esptool-3.2[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	~dev-embedded/esphome-dashboard-20220116.0[${PYTHON_USEDEP}]
	dev-python/aioesphomeapi[${PYTHON_USEDEP}]
	dev-python/zeroconf[${PYTHON_USEDEP}]
	~dev-python/kconfiglib-13.7.1[${PYTHON_USEDEP}]"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/asyncmock[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		)"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
The ESPHome dashboard listens on port 6052
ESPHome configuration is in: /etc/${PN}
dashboard command line arguments are configured in: /etc/conf.d/${PN}
logging is to: /var/log/${PN}/{dashboard,warnings}.log
support at https://git.edevau.net/onkelbeh/HomeAssistantRepository
"

src_prepare() {
	sed "s/aioesphomeapi==10.8.1/aioesphomeapi/g" -i requirements.txt || die
	sed "s/click==8.0.3/click/g" -i requirements.txt || die
	sed "s/zeroconf==0.37.0/zeroconf/g" -i requirements.txt || die
	eapply_user
}

python_install_all() {
	dodoc ${DOCS}
	distutils-r1_python_install_all
	if use server; then
		keepdir "/etc/${PN}"
		fowners -R "${PN}:${PN}" "/etc/${PN}"
		keepdir "/var/log/${PN}"
		fowners -R "${PN}:${PN}" "/var/log/${PN}"
		newconfd "${FILESDIR}/${PN}.conf.d" "${PN}"
		newinitd "${FILESDIR}/${PN}.init.d-r3" "${PN}"
		readme.gentoo_create_doc
	fi
}

pkg_postinst() {
	if use server; then
		readme.gentoo_print_elog
	fi
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
