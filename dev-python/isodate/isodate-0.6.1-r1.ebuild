# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} pypy3 )

inherit distutils-r1

DESCRIPTION="ISO 8601 date/time/duration parser and formatter"
HOMEPAGE="
	https://github.com/gweis/isodate/
	https://pypi.org/project/isodate/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux"

RDEPEND="
	dev-python/six[${PYTHON_USEDEP}]
"

distutils_enable_tests unittest

python_test() {
	eunittest -s "${BUILD_DIR}/install$(python_get_sitedir)/isodate"
}
