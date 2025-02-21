# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="A user for ${PN}"
ACCT_USER_GROUPS=( ${PN} dialout )
ACCT_USER_ID=-1

acct-user_add_deps
