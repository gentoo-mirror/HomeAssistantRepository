# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{7,8} )
inherit readme.gentoo-r1 eutils distutils-r1

MY_PN=${PN}-core
MY_PV=${PV/_beta/b}
MY_P=${MY_PN}-${MY_PV}

DESCRIPTION="Open-source home automation platform running on Python on 3.7"
HOMEPAGE="https://home-assistant.io https://git.edevau.net/onkelbeh/HomeAssistantRepository"
SRC_URI="https://github.com/home-assistant/core/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="abode adguard ambiclimate ambient_station amcrest androidtv apprise asuswrt atmo atv aurora avea axis bitcoin blockchain bmw_connected_drive braviatv buienradar +cast cli ciscomobilityexpress coronavirus daikin darksky denonavr discogs dyson emulated_roku enigma enocean esphome everlights envoy flume flunearyou fronius +frontend gpiozero growl harmony heos here hkavr holidays homekit homematic homematicip hpilo hs100 hue incomfort influxdb ipma jewish_calendar kef maxcube maxcube_hack miio mikrotik mobile_app +mqtt musiccast +mysql nederlandse_spoorwegen openwrt owntracks plex plugwise qnap +recorder ring roku rxv samsungtv signal sma socat socialblade somfy sonos shodan simplisafe speedtest +ssl test tradfri ubee unify vallox vera velbus webostv wemo wink withings wled wwlln xknx yeelight youtube z-wave zigbee zoneminder"

RDEPEND="${PYTHON_DEPS} acct-group/${PN} acct-user/${PN}
	|| ( dev-lang/python:3.7 dev-lang/python:3.8 )
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	>=dev-libs/xerces-c-3.1.4-r1
	mqtt? ( ~dev-python/hbmqtt-0.9.5[${PYTHON_USEDEP}]
	~dev-python/paho-mqtt-1.5.0[${PYTHON_USEDEP}] )"

# Home Assistant Core
RDEPEND="${RDEPEND}
	~dev-python/aiohttp-3.6.1[${PYTHON_USEDEP}]
	~dev-python/astral-1.10.1[${PYTHON_USEDEP}]
	~dev-python/async_timeout-3.0.1[${PYTHON_USEDEP}]
	~dev-python/attrs-19.3.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-3.1.7[${PYTHON_USEDEP}]
	>=dev-python/certifi-2019.11.28[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.1.3[${PYTHON_USEDEP}]
	~dev-python/importlib_metadata-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.11.1[${PYTHON_USEDEP}]
	~dev-python/pyjwt-1.7.1[${PYTHON_USEDEP}]
	~dev-python/cryptography-2.8[${PYTHON_USEDEP}]
	>=dev-python/pip-8.0.3-r1[${PYTHON_USEDEP}]
	~dev-python/python-slugify-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.3[${PYTHON_USEDEP}]
	~dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
	~dev-python/requests-2.23.0[${PYTHON_USEDEP}]
	~dev-python/ruamel-yaml-0.15.100[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.11.7[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.3.0[${PYTHON_USEDEP}]"

# from package_constraints.txt
RDEPEND="${RDEPEND}
	>=dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/distro-1.4.0[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.32.2[${PYTHON_USEDEP}]
	~app-misc/home-assistant-frontend-20200407.2[${PYTHON_USEDEP}]
	>=dev-python/netdisco-2.6.0[${PYTHON_USEDEP}]
	~dev-python/sqlalchemy-1.3.15[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.25.0[${PYTHON_USEDEP}]
	|| ( >=dev-python/pycryptodome-3.7.3[${PYTHON_USEDEP}] dev-python/pycrypto[${PYTHON_USEDEP}] )"

RDEPEND="${RDEPEND}
	>=app-crypt/acme-0.32.0[${PYTHON_USEDEP}]
	~dev-python/aiobotocore-0.11.1[${PYTHON_USEDEP}]
	>=dev-python/asn1crypto-0.24.0[${PYTHON_USEDEP}]
	~dev-python/beautifulsoup-4.8.2[${PYTHON_USEDEP}]
	~dev-python/blinkpy-0.14.2[${PYTHON_USEDEP}]
	~dev-python/boto3-1.9.252[${PYTHON_USEDEP}]
	~dev-python/caldav-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/cdu-0.1.3[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '~dev-python/contextvars-2.4[${PYTHON_USEDEP}]' python3_6)
	>=dev-python/chardet-3.0.4[${PYTHON_USEDEP}]
	~dev-python/colorlog-4.1.0[${PYTHON_USEDEP}]
	>=dev-python/coverage-4.5.2[${PYTHON_USEDEP}]
	~dev-python/docopt-0.6.2[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.14[${PYTHON_USEDEP}]
	>=dev-python/ecdsa-0.13[${PYTHON_USEDEP}]
	>=dev-python/envs-1.3[${PYTHON_USEDEP}]
	>=dev-python/future-0.17.1[${PYTHON_USEDEP}]
	~dev-python/gTTS-token-1.1.3[${PYTHON_USEDEP}]
	~dev-python/HAP-python-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/idna-2.8[${PYTHON_USEDEP}]
	>=dev-python/idna-ssl-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.1.6[${PYTHON_USEDEP}]
	>=dev-python/immutables-0.9[${PYTHON_USEDEP}]
	>=dev-python/jmespath-0.9.4[${PYTHON_USEDEP}]
	>=dev-python/jose-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsonrpc-async-0.6[${PYTHON_USEDEP}]
	~dev-python/jsonrpc-base-1.0[${PYTHON_USEDEP}]
	~dev-python/jsonrpc-websocket-0.6[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.3.3[${PYTHON_USEDEP}]
	>=dev-python/multidict-4.5.2[${PYTHON_USEDEP}]
	>=dev-python/nose-1.3.7[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.18.1[${PYTHON_USEDEP}]
	~dev-python/passlib-1.7.1[${PYTHON_USEDEP}]
	>=dev-python/pbr-5.1.3[${PYTHON_USEDEP}]
	~dev-python/pillow-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.7.0[${PYTHON_USEDEP}]
	>=dev-python/pycparser-2.19[${PYTHON_USEDEP}]
	~dev-python/pyhaversion-3.3.0[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-19.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/PyQRCode-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/pyrfc3339-1.1[${PYTHON_USEDEP}]
	~dev-python/pysnmp-4.4.12[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/python-jose-cryptodome-1.3.2[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.9.1[${PYTHON_USEDEP}]
	~dev-python/RestrictedPython-5.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-40.8.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.12.0[${PYTHON_USEDEP}]
	~dev-python/transitions-0.6.9[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/ua-parser-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.3[${PYTHON_USEDEP}]
	=dev-python/user-agents-2.0-r1[${PYTHON_USEDEP}]
	>=dev-python/wakeonlan-1.1.6[${PYTHON_USEDEP}]
	=dev-python/warrant-0.6.1-r1[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.56.0[${PYTHON_USEDEP}]
	~dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}]
	>=media-libs/mutagen-1.43.0"

# Module requirements from useflags
RDEPEND="${RDEPEND}
	abode? ( ~dev-python/abodepy-0.18.1[${PYTHON_USEDEP}] )
	adguard? ( ~dev-python/adguardhome-0.4.2[${PYTHON_USEDEP}] )
	ambiclimate? ( ~dev-python/Ambiclimate-0.2.1[${PYTHON_USEDEP}] )
	ambient_station? ( ~dev-python/aioambient-1.1.1[${PYTHON_USEDEP}] )
	amcrest? ( ~dev-python/amcrest-1.7.0[${PYTHON_USEDEP}] )
	androidtv? ( ~dev-python/androidtv-0.0.39[${PYTHON_USEDEP}]
			~dev-python/adb-shell-0.1.1[${PYTHON_USEDEP}] )
	apprise? ( ~dev-python/apprise-0.8.5[${PYTHON_USEDEP}] )
	asuswrt? ( ~dev-python/aioasuswrt-1.2.3[${PYTHON_USEDEP}] )
	atmo? ( ~dev-python/pyatmo-3.3.0[${PYTHON_USEDEP}] )
	atv? ( >=dev-python/pyatv-0.3.13[${PYTHON_USEDEP}] )
	aurora? ( ~dev-python/aurorapy-0.2.6[${PYTHON_USEDEP}] )
	avea? ( ~dev-python/avea-1.4[${PYTHON_USEDEP}] )
	axis? ( ~dev-python/axis-25[${PYTHON_USEDEP}] )
	bitcoin? ( ~dev-python/blockchain-1.4.4[${PYTHON_USEDEP}] )
	blockchain? ( ~dev-python/python-blockchain-api-0.0.2[${PYTHON_USEDEP}] )
	bmw_connected_drive? ( ~dev-python/bimmer-connected-0.7.1[${PYTHON_USEDEP}] )
	braviatv? ( ~dev-python/braviatv-1.0.1 )
	buienradar? ( ~dev-python/buienradar-1.0.4[${PYTHON_USEDEP}] )
	cast? ( ~dev-python/pychromecast-4.2.0[${PYTHON_USEDEP}] )
	cli? ( app-misc/home-assistant-cli[${PYTHON_USEDEP}] )
	ciscomobilityexpress? ( ~dev-python/ciscomobilityexpress-0.3.3[${PYTHON_USEDEP}] )
	coronavirus? ( ~dev-python/coronavirus-1.1.0[${PYTHON_USEDEP}] )
	daikin? ( ~dev-python/pydaikin-1.6.3[${PYTHON_USEDEP}] )
	darksky? ( ~dev-python/python-forecastio-1.4.0[${PYTHON_USEDEP}] )
	denonavr? ( ~dev-python/denonavr-0.8.1[${PYTHON_USEDEP}] )
	discogs? ( ~dev-python/discogs_client-2.2.2[${PYTHON_USEDEP}] )
	dyson? ( ~dev-python/libpurecool-0.6.1[${PYTHON_USEDEP}] )
	emulated_roku? ( ~dev-python/emulated-roku-0.2.1[${PYTHON_USEDEP}] )
	enigma? ( ~dev-python/openwebifpy-3.1.1[${PYTHON_USEDEP}] )
	esphome? ( ~dev-python/aioesphomeapi-2.6.1[${PYTHON_USEDEP}] )
	everlights? ( ~dev-python/pyeverlights-0.1.0[${PYTHON_USEDEP}] )
	enocean? ( ~dev-python/enocean-0.50.0[${PYTHON_USEDEP}] )
	envoy? ( ~dev-python/envoy-reader-0.11.0[${PYTHON_USEDEP}] )
	flume? ( ~dev-python/PyFlume-0.3.0[${PYTHON_USEDEP}] )
	flunearyou? ( ~dev-python/pyflunearyou-1.0.3[${PYTHON_USEDEP}] )
	fronius? ( ~dev-python/PyFronius-0.4.6[${PYTHON_USEDEP}] )
	gpiozero? ( ~dev-python/gpiozero-1.5.1[${PYTHON_USEDEP}] )
	growl? ( ~dev-python/gntp-1.0.3[${PYTHON_USEDEP}] )
	harmony? ( ~dev-python/aioharmony-0.1.13[${PYTHON_USEDEP}] )
	heos? ( ~dev-python/pyheos-0.6.0[${PYTHON_USEDEP}] )
	here? ( ~dev-python/herepy-2.0.0[${PYTHON_USEDEP}] )
	hpilo? ( ~dev-python/python-hpilo-4.3[${PYTHON_USEDEP}] )
	hkavr? ( ~dev-python/hkavr-0.0.5[${PYTHON_USEDEP}] )
	holidays? ( ~dev-python/holidays-0.10.1[${PYTHON_USEDEP}] )
	homekit? ( ~dev-python/aiohomekit-0.2.37[${PYTHON_USEDEP}] )
	homematic? ( ~dev-python/pyhomematic-0.1.65[${PYTHON_USEDEP}] )
	homematicip? ( ~dev-python/homematicip-0.10.17[${PYTHON_USEDEP}] )
	hs100? ( >=dev-python/pyHS100-0.3.5[${PYTHON_USEDEP}] )
	hue? ( ~dev-python/aiohue-2.1.0[${PYTHON_USEDEP}] )
	incomfort? ( ~dev-python/incomfort-client-0.4.0[${PYTHON_USEDEP}] )
	influxdb? ( dev-db/influxdb
			~dev-python/influxdb-5.2.3[${PYTHON_USEDEP}] )
	ipma? ( ~dev-python/pyipma-2.0.5[${PYTHON_USEDEP}] )
	jewish_calendar? ( ~dev-python/hdate-0.9.3[${PYTHON_USEDEP}] )
	kef? ( ~dev-python/aiokef-0.2.9[${PYTHON_USEDEP}] ~dev-python/getmac-0.8.1[${PYTHON_USEDEP}] )
	maxcube? ( ~dev-python/maxcube-api-0.1.0[${PYTHON_USEDEP}] )
	miio? ( ~dev-python/python-miio-0.4.8[${PYTHON_USEDEP}] )
	mikrotik? ( ~dev-python/librouteros-3.0.0[${PYTHON_USEDEP}] )
	mobile_app? ( ~dev-python/pynacl-1.3.0[${PYTHON_USEDEP}] )
	mqtt? ( virtual/mqtt )
	musiccast? ( >=dev-python/pymusiccast-0.1.6[${PYTHON_USEDEP}] )
	mysql? ( || ( dev-python/mysqlclient[${PYTHON_USEDEP}]
			dev-python/mysql-python[${PYTHON_USEDEP}] )
			virtual/mysql )
	nederlandse_spoorwegen? ( ~dev-python/nsapi-3.0.3[${PYTHON_USEDEP}] )
	openwrt? ( ~dev-python/openwrt-luci-rpc-1.1.2[${PYTHON_USEDEP}] )
	owntracks? ( ~dev-python/pynacl-1.3.0[${PYTHON_USEDEP}]
		virtual/mqtt )
	plex? ( ~dev-python/PlexAPI-3.3.0[${PYTHON_USEDEP}] )
	plugwise? ( ~dev-python/haanna-0.14.3[${PYTHON_USEDEP}] )
	qnap? ( ~dev-python/qnapstats-0.3.0[${PYTHON_USEDEP}] )
	roku? ( ~dev-python/roku-4.1.0[${PYTHON_USEDEP}] )
	ring? ( ~dev-python/ring-doorbell-0.6.0[${PYTHON_USEDEP}] )
	rxv? ( ~dev-python/rxv-0.6.0[${PYTHON_USEDEP}]
			~dev-python/defusedxml-0.6.0[${PYTHON_USEDEP}] )
	samsungtv? ( ~dev-python/samsungctl-0.7.1[${PYTHON_USEDEP}]
			~dev-python/samsungtvws-1.4.0[${PYTHON_USEDEP}] )
	signal? ( ~dev-python/pysignalclirestapi-0.2.4[${PYTHON_USEDEP}] )
	sma? ( ~dev-python/pysma-0.3.5[${PYTHON_USEDEP}] )
	socat? ( net-misc/socat )
	socialblade? ( ~dev-python/socialbladeclient-0.2[${PYTHON_USEDEP}] )
	somfy? ( ~dev-python/pymfy-0.7.1[${PYTHON_USEDEP}] )
	sonos? ( >=dev-python/pysonos-0.0.25[${PYTHON_USEDEP}] )
	shodan? ( ~dev-python/shodan-1.22.0[${PYTHON_USEDEP}] )
	simplisafe? ( ~dev-python/simplisafe-python-9.0.6[${PYTHON_USEDEP}] )
	speedtest? ( ~net-analyzer/speedtest-cli-2.1.2[${PYTHON_USEDEP}] )
	ssl? ( 	dev-libs/openssl:0
			app-crypt/certbot
			net-proxy/haproxy )
	tradfri? ( >=dev-python/pytradfri-6.4.0[${PYTHON_USEDEP}] )
	ubee? ( ~dev-python/pyubee-0.10[${PYTHON_USEDEP}] )
	unify? ( ~dev-python/aiounify-15[${PYTHON_USEDEP}] )
	vallox? ( ~dev-python/vallox-websocket-api-2.4.0[${PYTHON_USEDEP}] )
	vera? ( ~dev-python/pyvera-0.3.7[${PYTHON_USEDEP}] )
	velbus? ( ~dev-python/python-velbus-2.0.43[${PYTHON_USEDEP}] )
	webostv? ( ~dev-python/aiopylgtv-0.3.3[${PYTHON_USEDEP}] )
	wemo? ( >=dev-python/pywemo-0.4.34[${PYTHON_USEDEP}] )
	wink? ( ~dev-python/pubnubsub-handler-1.0.8[${PYTHON_USEDEP}] )
	withings? ( ~dev-python/withings-api-2.1.3[${PYTHON_USEDEP}] )
	wled? ( ~dev-python/wled-0.3.0[${PYTHON_USEDEP}] )
	wwlln? ( ~dev-python/aiowwlln-2.0.2[${PYTHON_USEDEP}] )
	xknx? ( ~dev-python/xknx-0.11.2[${PYTHON_USEDEP}] )
	yeelight? ( ~dev-python/yeelight-0.5.1[${PYTHON_USEDEP}] )
	youtube? ( ~dev-python/youtube_dl-2020.3.24[${PYTHON_USEDEP}] )
	zigbee? ( ~dev-python/zigpy-deconz-0.8.0[${PYTHON_USEDEP}]
			~dev-python/zigpy-homeassistant-0.18.2[${PYTHON_USEDEP}]
			~dev-python/zigpy-xbee-homeassistant-0.11.0[${PYTHON_USEDEP}]
			~dev-python/bellows-homeassistant-0.15.2[${PYTHON_USEDEP}]
			~dev-python/zigpy-zigate-0.5.1[${PYTHON_USEDEP}]
			~dev-python/zha-quirks-0.0.38[${PYTHON_USEDEP}] )
	zoneminder? ( ~dev-python/zm-py-0.4.0[${PYTHON_USEDEP}] )
	z-wave? ( ~dev-python/pynacl-1.3.0[${PYTHON_USEDEP}]
			~dev-python/homeassistant-pyozw-0.1.10[${PYTHON_USEDEP}]
			~dev-python/pydispatcher-2.0.5[${PYTHON_USEDEP}] )"

DEPEND="${RDEPEND}
		test? (
			  ~dev-python/asynctest-0.12.2[${PYTHON_USEDEP}]
			  ~dev-python/coveralls-1.2.0[${PYTHON_USEDEP}]
			  ~dev-python/flake8-docstrings-1.3.0[${PYTHON_USEDEP}]
			  ~dev-python/flake8-3.7.5[${PYTHON_USEDEP}]
			  ~dev-python/mock-open-1.3.1[${PYTHON_USEDEP}]
			  dev-python/mock[${PYTHON_USEDEP}]
			  ~dev-python/mypy-0.660[${PYTHON_USEDEP}]
			  ~dev-python/pydocstyle-3.0.0[${PYTHON_USEDEP}]
			  ~dev-python/pylint-2.2.2[${PYTHON_USEDEP}]
			  ~dev-python/pytest-aiohttp-0.3.0[${PYTHON_USEDEP}]
			  ~dev-python/pytest-cov-2.6.1[${PYTHON_USEDEP}]
			  ~dev-python/pytest-sugar-0.9.2[${PYTHON_USEDEP}]
			  ~dev-python/pytest-timeout-1.3.3[${PYTHON_USEDEP}]
			  ~dev-python/pytest-4.2.1[${PYTHON_USEDEP}]
			  ~dev-python/requests-mock-1.5.2[${PYTHON_USEDEP}]
			  dev-python/nose[${PYTHON_USEDEP}]
			  dev-python/coverage[${PYTHON_USEDEP}]
			   )"

INSTALL_DIR="/opt/${PN}"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
The HA interface listens on port 8123
hass configuration is in: /etc/${PN}
daemon command line arguments are configured in: /etc/conf.d/${PN}
logging is to: /var/log/${PN}/{server,errors,stdout}.log
The sqlite db is by default in: /etc/${PN}
support at https://git.edevau.net/onkelbeh/HomeAssistantRepository
"

S="${WORKDIR}/core-${MY_PV}"

DOCS="README.rst"

src_prepare() {
	# https://github.com/home-assistant/home-assistant/issues/28811
	if use maxcube_hack ; then
	  eapply "${FILESDIR}/maxcube_TypeError_dirty_hack.patch"
		#sed -e 's;if cube.is_windowshutter(device);if device.type == 4;' \
		#    -i components/maxcube/binary_sensor.py \
		#		|| die
		#sed -e 's;if cube.is_thermostat(device) or cube.is_wallthermostat(device);if device.type == 3 or device.type == 1;' \
		#    -i components/maxcube/climate.py \
		#		|| die
	fi
	eapply_user
}

python_install_all() {
	dodoc ${DOCS}
	distutils-r1_python_install_all
	keepdir "$INSTALL_DIR"
	keepdir "/etc/${PN}"
	fowners -R "${PN}:${PN}" "/etc/${PN}"
	keepdir "/var/log/${PN}"
	fowners -R "${PN}:${PN}" "/var/log/${PN}"
	newconfd "${FILESDIR}/${PN}.conf.d" "${PN}"
	newinitd "${FILESDIR}/${PN}.init.d" "${PN}"
	dobin "${FILESDIR}/hasstest"
	if use socat ; then
		newinitd "${FILESDIR}/socat-zwave.init.d" "socat-zwave"
		sed -i -e 's/# need socat-zwave/need socat-zwave/g' "${D}/etc/init.d/${PN}" || die
	fi
	if use mqtt ; then
		sed -i -e 's/# need mosquitto/need mosquitto/g' "${D}/etc/init.d/${PN}" || die
	fi
	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}.logrotate" "${PN}"
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
