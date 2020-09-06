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
KEYWORDS="amd64 arm64 x86 amd64-linux x86-linux"
#KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="abode adguard ads agent_dvr aioguardian alarmdecoder ambiclimate ambient_station amcrest androidtv apache_kafka apprise arcam_fmj asuswrt atmo atv aurora avea awair aws axis bitcoin blink blockchain bmw_connected_drive bravia-tv buienradar +caldav +cast ciscomobilityexpress cli coronavirus daikin darksky deconz delijn denonavr dexcom discogs discord dunehd dynalite dyson ecobee emulated_roku enigma enocean environment_canada envoy esphome everlights flume flunearyou foobot fronius gpiozero growatt_server growl harmony heos here hkavr holidays homekit homematic homematicip hpilo hs100 hue hydrawise iaqualink icloud ihc incomfort influxdb insteon intesishome ipma jewish_calendar joaoapps_join kef maxcube maxcube_hack meteo_france metno miio mikrotik mobile_app +mqtt musiccast myq +mysql nederlandse_spoorwegen netdata nuki nws nx584 openwrt owntracks ozw plex plugwise poolsense powerwall ps4 qnap +recorder rejseplanen ring roku roomba rxv samsungtv +scrape shodan signal simplisafe skybell sma smappee smarthab smartthings socat socialblade solax somfy sonos speedtest squeezebox +ssl synologydsm systemmonitor tellduslive tesla test tile toon tplink tradfri tuya ubee unifi vallox velbus velux vera +version vicare vizio webostv wemo wink withings wled xbox_live xknx xs1 yeelight youtube zerproc zigbee zoneminder z-wave"

# from 2020/04 cleanup to be removed or integrated later
# external deps

RDEPEND="${PYTHON_DEPS} acct-group/${PN} acct-user/${PN}
	|| ( dev-lang/python:3.7 dev-lang/python:3.8 )
	app-admin/logrotate
	dev-db/sqlite
	dev-libs/libfastjson
	>=dev-libs/xerces-c-3.1.4-r1"

# Home Assistant Core dependencies
# from setup.py
RDEPEND="${RDEPEND}
	~dev-python/aiohttp-3.6.2[${PYTHON_USEDEP}]
	~dev-python/astral-1.10.1[${PYTHON_USEDEP}]
	~dev-python/async_timeout-3.0.1[${PYTHON_USEDEP}]
	~dev-python/attrs-19.3.0[${PYTHON_USEDEP}]
	~dev-python/bcrypt-3.1.7[${PYTHON_USEDEP}]
	>=dev-python/certifi-2020.4.5.1[${PYTHON_USEDEP}]
	~dev-python/ciso8601-2.1.3[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '~dev-python/importlib_metadata-1.6.0[${PYTHON_USEDEP}]' python3_7)
	>=dev-python/jinja-2.11.1[${PYTHON_USEDEP}]
	~dev-python/pyjwt-1.7.1[${PYTHON_USEDEP}]
	~dev-python/cryptography-2.9.2[${PYTHON_USEDEP}]
	>=dev-python/pip-8.0.3-r1[${PYTHON_USEDEP}]
	~dev-python/python-slugify-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/pytz-2020.1[${PYTHON_USEDEP}]
	~dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
	~dev-python/requests-2.24.0[${PYTHON_USEDEP}]
	~dev-python/ruamel-yaml-0.15.100[${PYTHON_USEDEP}]
	~dev-python/voluptuous-0.11.7[${PYTHON_USEDEP}]
	~dev-python/voluptuous-serialize-2.4.0[${PYTHON_USEDEP}]
	~dev-python/yarl-1.4.2[${PYTHON_USEDEP}]"

# from package_constraints.txt, if not defined earlier
RDEPEND="${RDEPEND}
  ~dev-python/pynacl-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-cors-0.7.0[${PYTHON_USEDEP}]
	~dev-python/defusedxml-0.6.0[${PYTHON_USEDEP}]
	~dev-python/distro-1.5.0[${PYTHON_USEDEP}]
  ~dev-python/emoji-0.5.4[${PYTHON_USEDEP}]
	~dev-python/hass-nabucasa-0.35.0[${PYTHON_USEDEP}]
	~dev-python/home-assistant-frontend-20200811.0[${PYTHON_USEDEP}]
	>=dev-python/netdisco-2.8.2[${PYTHON_USEDEP}]
	~dev-python/sqlalchemy-1.3.18[${PYTHON_USEDEP}]
	~dev-python/zeroconf-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.6.6[${PYTHON_USEDEP}]
	!dev-python/pycrypto[${PYTHON_USEDEP}]"

# >=dev-python/idna-ssl-1.1.0[${PYTHON_USEDEP}]
# >=dev-python/immutables-0.9[${PYTHON_USEDEP}]

# still unknown origin, some from requirements_all.txt
RDEPEND="${RDEPEND}
	~dev-python/base36-0.1.1[${PYTHON_USEDEP}]
	~dev-python/colorlog-4.1.0[${PYTHON_USEDEP}]
	~dev-python/fnvhash-0.1.0[${PYTHON_USEDEP}]
	~dev-python/gTTS-token-1.1.3[${PYTHON_USEDEP}]
	~dev-python/HAP-python-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/jmespath-0.9.4[${PYTHON_USEDEP}]
	>=dev-python/jsonrpc-async-0.6[${PYTHON_USEDEP}]
	~dev-python/jsonrpc-base-1.0[${PYTHON_USEDEP}]
	~dev-python/jsonrpc-websocket-0.6[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.3.3[${PYTHON_USEDEP}]
	>=dev-python/multidict-4.5.2[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.19.1[${PYTHON_USEDEP}]
	~dev-python/passlib-1.7.1[${PYTHON_USEDEP}]
	>=dev-python/pbr-5.1.3[${PYTHON_USEDEP}]
	~dev-python/pillow-7.1.2[${PYTHON_USEDEP}]
	>=dev-python/pycparser-2.19[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/pyqrcode-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/pyrfc3339-1.1[${PYTHON_USEDEP}]
	~dev-python/pysnmp-4.4.12[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/python-jose-cryptodome-1.3.2[${PYTHON_USEDEP}]
	~dev-python/RestrictedPython-5.0[${PYTHON_USEDEP}]
	>=dev-python/ua-parser-0.8.0[${PYTHON_USEDEP}]
	=dev-python/user-agents-2.0-r1[${PYTHON_USEDEP}]
	>=dev-python/wakeonlan-1.1.6[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.56.0[${PYTHON_USEDEP}]
	~dev-python/xmltodict-0.12.0[${PYTHON_USEDEP}]
	~media-libs/mutagen-1.44.0"

# Module requirements from useflags
RDEPEND="${RDEPEND}
  abode? ( ~dev-python/abodepy-1.1.0[${PYTHON_USEDEP}] )
  adguard? ( ~dev-python/adguardhome-0.4.2[${PYTHON_USEDEP}] )
	agent_dvr? ( ~dev-python/agent-py-0.0.23[${PYTHON_USEDEP}] )
	ads? ( ~dev-python/pyads-3.2.1[${PYTHON_USEDEP}] )
  aioguardian? ( ~dev-python/aioguardian-1.0.1[${PYTHON_USEDEP}] )
	alarmdecoder? ( ~dev-python/adext-0.3[${PYTHON_USEDEP}] )
  ambiclimate? ( ~dev-python/Ambiclimate-0.2.1[${PYTHON_USEDEP}] )
  ambient_station? ( ~dev-python/aioambient-1.2.1[${PYTHON_USEDEP}] )
  amcrest? ( ~dev-python/amcrest-1.7.0[${PYTHON_USEDEP}] )
  androidtv? ( ~dev-python/androidtv-0.0.47[${PYTHON_USEDEP}]
	  ~dev-python/adb-shell-0.2.1[${PYTHON_USEDEP}] )
	apache_kafka? ( ~dev-python/aiokafka-0.6.0[${PYTHON_USEDEP}] )
  apprise? ( ~dev-python/apprise-0.8.5[${PYTHON_USEDEP}] )
  arcam_fmj? ( ~dev-python/arcam-fmj-0.5.1[${PYTHON_USEDEP}] )
  asuswrt? ( ~dev-python/aioasuswrt-1.2.7[${PYTHON_USEDEP}] )
  atmo? ( ~dev-python/pyatmo-4.0.0[${PYTHON_USEDEP}] )
  atv? ( >=dev-python/pyatv-0.3.13[${PYTHON_USEDEP}] )
  aurora? ( ~dev-python/aurorapy-0.2.6[${PYTHON_USEDEP}] )
  avea? ( ~dev-python/avea-1.4[${PYTHON_USEDEP}] )
  awair? ( ~dev-python/python-awair-0.1.1[${PYTHON_USEDEP}] )
  aws? ( ~dev-python/aiobotocore-0.11.1[${PYTHON_USEDEP}] )
  axis? ( ~dev-python/axis-33[${PYTHON_USEDEP}] )
  bitcoin? ( ~dev-python/blockchain-1.4.4[${PYTHON_USEDEP}] )
  blink? ( ~dev-python/blinkpy-0.16.3[${PYTHON_USEDEP}] )
  blockchain? ( ~dev-python/python-blockchain-api-0.0.2[${PYTHON_USEDEP}] )
  bmw_connected_drive? ( ~dev-python/bimmer-connected-0.7.7[${PYTHON_USEDEP}] )
  bravia-tv? ( ~dev-python/bravia-tv-1.0.6[${PYTHON_USEDEP}]
	  ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] )
  buienradar? ( ~dev-python/buienradar-1.0.4[${PYTHON_USEDEP}] )
  caldav? ( ~dev-python/caldav-0.6.1[${PYTHON_USEDEP}] )
  cast? ( ~dev-python/pychromecast-7.2.1[${PYTHON_USEDEP}] )
  ciscomobilityexpress? ( ~dev-python/ciscomobilityexpress-0.3.3[${PYTHON_USEDEP}] )
  cli? ( app-misc/home-assistant-cli[${PYTHON_USEDEP}] )
  coronavirus? ( ~dev-python/coronavirus-1.1.1[${PYTHON_USEDEP}] )
  daikin? ( ~dev-python/pydaikin-2.3.1[${PYTHON_USEDEP}] )
  darksky? ( ~dev-python/python-forecastio-1.4.0[${PYTHON_USEDEP}] )
	deconz? ( ~dev-python/pydeconz-72[${PYTHON_USEDEP}] )
  delijn? ( ~dev-python/pydelijn-0.5.1[${PYTHON_USEDEP}] )
  denonavr? ( ~dev-python/denonavr-0.9.4[${PYTHON_USEDEP}] )
	dexcom? ( ~dev-python/pydexcom-0.2.0[${PYTHON_USEDEP}] )
  discogs? ( ~dev-python/discogs-client-2.2.2[${PYTHON_USEDEP}] )
	discord? ( ~dev-python/discord-py-1.3.4[${PYTHON_USEDEP}] )
	dunehd? ( ~dev-python/pdunehd-1.3[${PYTHON_USEDEP}] )
  dynalite? ( ~dev-python/dynalite-devices-0.1.41[${PYTHON_USEDEP}] )
  dyson? ( ~dev-python/libpurecool-0.6.3[${PYTHON_USEDEP}] )
  ecobee? ( ~dev-python/python-ecobee-api-0.2.7[${PYTHON_USEDEP}] )
  emulated_roku? ( ~dev-python/emulated-roku-0.2.1[${PYTHON_USEDEP}] )
  enigma? ( ~dev-python/openwebifpy-3.1.1[${PYTHON_USEDEP}] )
  enocean? ( ~dev-python/enocean-0.50.0[${PYTHON_USEDEP}] )
  environment_canada? ( ~dev-python/env-canada-0.1.0[${PYTHON_USEDEP}] )
  envoy? ( ~dev-python/envoy-reader-0.16.1[${PYTHON_USEDEP}] )
  esphome? ( ~dev-python/aioesphomeapi-2.6.1[${PYTHON_USEDEP}] )
  everlights? ( ~dev-python/pyeverlights-0.1.0[${PYTHON_USEDEP}] )
  flume? ( ~dev-python/PyFlume-0.5.5[${PYTHON_USEDEP}] )
  flunearyou? ( ~dev-python/pyflunearyou-1.0.7[${PYTHON_USEDEP}] )
	foobot? ( ~dev-python/foobot_async-0.3.2[${PYTHON_USEDEP}] )
  fronius? ( ~dev-python/PyFronius-0.4.6[${PYTHON_USEDEP}] )
  gpiozero? ( ~dev-python/gpiozero-1.5.1[${PYTHON_USEDEP}] )
  growatt_server? ( ~dev-python/growattServer-0.0.4[${PYTHON_USEDEP}] )
  growl? ( ~dev-python/gntp-1.0.3[${PYTHON_USEDEP}] )
  harmony? ( ~dev-python/aioharmony-0.2.6[${PYTHON_USEDEP}] )
  heos? ( ~dev-python/pyheos-0.6.0[${PYTHON_USEDEP}] )
  here? ( ~dev-python/herepy-2.0.0[${PYTHON_USEDEP}] )
  hkavr? ( ~dev-python/hkavr-0.0.5[${PYTHON_USEDEP}] )
  holidays? ( ~dev-python/holidays-0.10.3[${PYTHON_USEDEP}] )
  homekit? ( ~dev-python/aiohomekit-0.2.46[${PYTHON_USEDEP}] )
  homematic? ( ~dev-python/pyhomematic-0.1.68[${PYTHON_USEDEP}] )
  homematicip? ( ~dev-python/homematicip-0.10.19[${PYTHON_USEDEP}] )
  hpilo? ( ~dev-python/python-hpilo-4.3[${PYTHON_USEDEP}] )
  hs100? ( >=dev-python/pyHS100-0.3.5[${PYTHON_USEDEP}] )
  hue? ( ~dev-python/aiohue-2.1.0[${PYTHON_USEDEP}] )
  hydrawise? ( ~dev-python/Hydrawiser-0.2[${PYTHON_USEDEP}] )
  iaqualink? ( ~dev-python/iaqualink-0.3.4[${PYTHON_USEDEP}] )
  icloud? ( ~dev-python/pyicloud-0.9.7[${PYTHON_USEDEP}] )
  ihc? ( ~dev-python/ihcsdk-2.7.0[${PYTHON_USEDEP}] )
  incomfort? ( ~dev-python/incomfort-client-0.4.0[${PYTHON_USEDEP}] )
  influxdb? ( dev-db/influxdb ~dev-python/influxdb-5.2.3[${PYTHON_USEDEP}]
	  ~dev-python/influxdb-client-1.8.0[${PYTHON_USEDEP}] )
	insteon? ( ~dev-python/pyinsteon-1.0.7[${PYTHON_USEDEP}] )
  intesishome? ( ~dev-python/pyintesishome-1.7.5[${PYTHON_USEDEP}] )
  ipma? ( ~dev-python/pyipma-2.0.5[${PYTHON_USEDEP}] )
  jewish_calendar? ( ~dev-python/hdate-0.9.3[${PYTHON_USEDEP}] )
	joaoapps_join? ( ~dev-python/python-join-api-0.0.6[${PYTHON_USEDEP}] )
  kef? ( ~dev-python/aiokef-0.2.13[${PYTHON_USEDEP}]
	  ~dev-python/getmac-0.8.2[${PYTHON_USEDEP}] )
  maxcube? ( ~dev-python/maxcube-api-0.1.0[${PYTHON_USEDEP}] )
	meteo_france? ( ~dev-python/meteofrance-api-0.1.1[${PYTHON_USEDEP}] )
  metno? ( ~dev-python/PyMetno-0.7.1[${PYTHON_USEDEP}] )
  miio? ( ~dev-python/python-miio-0.5.3[${PYTHON_USEDEP}] )
  mikrotik? ( ~dev-python/librouteros-3.0.0[${PYTHON_USEDEP}] )
  mobile_app? ( ~dev-python/pynacl-1.3.0[${PYTHON_USEDEP}] )
  mqtt? ( ~dev-python/paho-mqtt-1.5.0[${PYTHON_USEDEP}] app-misc/mosquitto )
  musiccast? ( >=dev-python/pymusiccast-0.1.6[${PYTHON_USEDEP}] )
  myq? ( ~dev-python/pymyq-2.0.5[${PYTHON_USEDEP}] )
  mysql? ( || ( dev-python/mysqlclient[${PYTHON_USEDEP}]
	  dev-python/mysql-python[${PYTHON_USEDEP}] ) virtual/mysql )
  nederlandse_spoorwegen? ( ~dev-python/nsapi-3.0.4[${PYTHON_USEDEP}] )
  netdata? ( ~dev-python/netdata-0.2.0[${PYTHON_USEDEP}] )
	nuki? ( ~dev-python/pynuki-1.3.8[${PYTHON_USEDEP}] )
	nws? ( ~dev-python/pynws-1.2.1[${PYTHON_USEDEP}] )
  nx584? ( ~dev-python/pynx584-0.5[${PYTHON_USEDEP}] )
  openwrt? ( ~dev-python/openwrt-luci-rpc-1.1.3[${PYTHON_USEDEP}] )
  owntracks? ( ~dev-python/pynacl-1.3.0[${PYTHON_USEDEP}] virtual/mqtt )
  ozw? ( ~dev-python/python-openzwave-mqtt-1.0.2[${PYTHON_USEDEP}] )
  plex? ( ~dev-python/PlexAPI-4.0.0[${PYTHON_USEDEP}] )
  plugwise? ( ~dev-python/Plugwise-Smile-1.1.0[${PYTHON_USEDEP}] )
	poolsense? ( ~dev-python/poolsense-0.0.8[${PYTHON_USEDEP}] )
  powerwall? ( ~dev-python/tesla-powerwall-0.2.12[${PYTHON_USEDEP}] )
	ps4? ( ~dev-python/pyps4-2ndscreen-1.1.1[${PYTHON_USEDEP}] )
  qnap? ( ~dev-python/qnapstats-0.3.0[${PYTHON_USEDEP}] )
	rejseplanen? ( ~dev-python/rjpl-0.3.6[${PYTHON_USEDEP}] )
  ring? ( ~dev-python/ring-doorbell-0.6.0[${PYTHON_USEDEP}] )
  roku? ( ~dev-python/rokuecp-0.5.0[${PYTHON_USEDEP}] )
  roomba? ( ~dev-python/roombapy-1.6.1[${PYTHON_USEDEP}] )
  rxv? ( ~dev-python/rxv-0.6.0[${PYTHON_USEDEP}] )
  samsungtv? ( ~dev-python/samsungctl-0.7.1[${PYTHON_USEDEP}]
	  ~dev-python/samsungtvws-1.4.0[${PYTHON_USEDEP}] )
  scrape? ( ~dev-python/beautifulsoup-4.9.0[${PYTHON_USEDEP}] )
  shodan? ( ~dev-python/shodan-1.23.0[${PYTHON_USEDEP}] )
  signal? ( ~dev-python/pysignalclirestapi-0.3.4[${PYTHON_USEDEP}] )
  simplisafe? ( ~dev-python/simplisafe-python-9.3.0[${PYTHON_USEDEP}] )
	skybell? ( ~dev-python/skybellpy-0.6.1[${PYTHON_USEDEP}] )
	sma? ( ~dev-python/pysma-0.3.5[${PYTHON_USEDEP}] )
	smappee? ( ~dev-python/pysmappee-0.1.5[${PYTHON_USEDEP}] )
	smarthab? ( ~dev-python/SmartHab-0.21[${PYTHON_USEDEP}] )
	smartthings? ( ~dev-python/pysmartthings-0.7.3[${PYTHON_USEDEP}] )
  socat? ( net-misc/socat )
  socialblade? ( ~dev-python/socialbladeclient-0.2[${PYTHON_USEDEP}] )
  solax? ( ~dev-python/solax-0.2.3[${PYTHON_USEDEP}] )
  somfy? ( ~dev-python/pymfy-0.9.0[${PYTHON_USEDEP}] )
  sonos? ( >=dev-python/pysonos-0.0.32[${PYTHON_USEDEP}] )
  speedtest? ( ~net-analyzer/speedtest-cli-2.1.2[${PYTHON_USEDEP}] )
  squeezebox? ( ~dev-python/pysqueezebox-0.2.4[${PYTHON_USEDEP}] )
  ssl? (  dev-libs/openssl:0 app-crypt/certbot net-proxy/haproxy )
  synologydsm? ( ~dev-python/python-synology-0.8.2[${PYTHON_USEDEP}] )
  systemmonitor? ( >=dev-python/psutil-5.7.0[${PYTHON_USEDEP}] )
  tellduslive? ( ~dev-python/tellduslive-0.10.11[${PYTHON_USEDEP}] )
	tesla? ( ~dev-python/teslajsonpy-0.10.1[${PYTHON_USEDEP}] )
  tile? ( ~dev-python/pytile-4.0.0[${PYTHON_USEDEP}] )
  toon? ( ~dev-python/toonapi-0.2.0[${PYTHON_USEDEP}] )
	tplink? ( ~dev-python/pyHS100-0.3.5.1[${PYTHON_USEDEP}] )
  tradfri? ( >=dev-python/pytradfri-6.4.0[${PYTHON_USEDEP}] )
	tuya? ( ~dev-python/tuyaha-0.0.7[${PYTHON_USEDEP}] )
  ubee? ( ~dev-python/pyubee-0.10[${PYTHON_USEDEP}] )
  unifi? ( ~dev-python/aiounifi-23[${PYTHON_USEDEP}] )
  vallox? ( ~dev-python/vallox-websocket-api-2.4.0[${PYTHON_USEDEP}] )
  velbus? ( ~dev-python/python-velbus-2.0.43[${PYTHON_USEDEP}] )
  velux? ( ~dev-python/pyvlx-0.2.16[${PYTHON_USEDEP}] )
  vera? ( ~dev-python/pyvera-0.3.9[${PYTHON_USEDEP}] )
  version? ( ~dev-python/pyhaversion-3.2.0[${PYTHON_USEDEP}] )
  vicare? ( ~dev-python/PyViCare-0.2.0[${PYTHON_USEDEP}] )
	vizio? ( ~dev-python/pyvizio-0.1.49[${PYTHON_USEDEP}] )
  webostv? ( ~dev-python/aiopylgtv-0.3.3[${PYTHON_USEDEP}] )
  wemo? ( >=dev-python/pywemo-0.4.46[${PYTHON_USEDEP}] )
  wink? ( ~dev-python/pubnubsub-handler-1.0.8[${PYTHON_USEDEP}] )
  withings? ( ~dev-python/withings-api-2.1.6[${PYTHON_USEDEP}] )
  wled? ( ~dev-python/wled-0.4.3[${PYTHON_USEDEP}] )
	xbox_live? ( ~dev-python/xboxapi-2.0.1[${PYTHON_USEDEP}] )
  xknx? ( ~dev-python/xknx-0.11.3[${PYTHON_USEDEP}] )
  xs1? ( ~dev-python/xs1-api-client-3.0.0[${PYTHON_USEDEP}] )
  yeelight? ( ~dev-python/yeelight-0.5.2[${PYTHON_USEDEP}] )
  youtube? ( ~dev-python/youtube_dl-2020.7.28[${PYTHON_USEDEP}] )
	zerproc? ( ~dev-python/pyzerproc-0.2.5[${PYTHON_USEDEP}] )
  zigbee? ( ~dev-python/zigpy-deconz-0.9.2[${PYTHON_USEDEP}]
					~dev-python/zigpy-0.22.2[${PYTHON_USEDEP}]
					~dev-python/zigpy-xbee-0.12.1[${PYTHON_USEDEP}]
					~dev-python/bellows-0.18.1[${PYTHON_USEDEP}]
					~dev-python/zigpy-zigate-0.6.1[${PYTHON_USEDEP}]
					~dev-python/zha-quirks-0.0.43[${PYTHON_USEDEP}] )
  zoneminder? ( ~dev-python/zm-py-0.4.0[${PYTHON_USEDEP}] )
  z-wave? ( ~dev-python/pynacl-1.3.0[${PYTHON_USEDEP}]
					~dev-python/homeassistant-pyozw-0.1.10[${PYTHON_USEDEP}]
					~dev-python/pydispatcher-2.0.5[${PYTHON_USEDEP}] )"

DEPEND="${RDEPEND}
		test? (
			~dev-python/asynctest-0.13.0[${PYTHON_USEDEP}]
			~dev-python/codecov-2.1.0[${PYTHON_USEDEP}]
			~dev-python/coverage-5.2.1[${PYTHON_USEDEP}]
			~dev-python/mock-open-1.4.0[${PYTHON_USEDEP}]
			~dev-python/mypy-0.780[${PYTHON_USEDEP}]
			~dev-python/pre-commit-2.6.0[${PYTHON_USEDEP}]
			dev-python/pylint[${PYTHON_USEDEP}]
			~dev-python/astroid-2.3.3[${PYTHON_USEDEP}]
			~dev-python/pylint-strict-informational-0.1[${PYTHON_USEDEP}]
			~dev-python/pytest-aiohttp-0.3.0[${PYTHON_USEDEP}]
			~dev-python/pytest-cov-2.10.0[${PYTHON_USEDEP}]
			~dev-python/pytest-test-groups-1.0.3[${PYTHON_USEDEP}]
			~dev-python/pytest-sugar-0.9.3[${PYTHON_USEDEP}]
			~dev-python/pytest-timeout-1.3.4[${PYTHON_USEDEP}]
			~dev-python/pytest-xdist-1.32.0[${PYTHON_USEDEP}]
			~dev-python/pytest-5.4.3[${PYTHON_USEDEP}]
			~dev-python/requests-mock-1.8.0[${PYTHON_USEDEP}]
			~dev-python/responses-0.10.6[${PYTHON_USEDEP}]
		  dev-python/mock[${PYTHON_USEDEP}]
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
	  eapply "${FILESDIR}/maxcube_TypeError_01114_dirty_hack.patch"
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
