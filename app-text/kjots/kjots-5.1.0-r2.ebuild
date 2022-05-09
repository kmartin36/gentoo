# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KDE_ORG_CATEGORY="pim"
KFMIN=5.82.0
QTMIN=5.15.2
inherit ecm kde.org

DESCRIPTION="Note taking utility by KDE"
HOMEPAGE="https://userbase.kde.org/KJots https://community.kde.org/PIM/KJots"

if [[ ${KDE_BUILD_TYPE} != live ]]; then
	SRC_URI="mirror://kde/stable/${PN}/${PV}/src/${P}.tar.xz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="5"
IUSE="speech"

DEPEND="
	dev-libs/grantlee:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtprintsupport-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-apps/akonadi-20.12.2:5
	>=kde-apps/akonadi-notes-20.12.2:5
	>=kde-apps/kmime-20.12.2:5
	>=kde-apps/kontactinterface-20.12.2:5
	>=kde-apps/kpimtextedit-20.12.2:5[speech(+)=]
	>=kde-frameworks/kbookmarks-${KFMIN}:5
	>=kde-frameworks/kcmutils-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kconfigwidgets-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/kitemmodels-${KFMIN}:5
	>=kde-frameworks/kparts-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-unused-dep.patch"
	"${FILESDIR}/${P}-implicit-dep.patch"
	"${FILESDIR}/${P}-missing-lib.patch"
	"${FILESDIR}/${P}-akonadi-21.12.0.patch" # bug 830580
	"${FILESDIR}/${P}-speech-optional.patch" # bug 835128
	"${FILESDIR}/${P}-akonadi-22.04.0.patch" # bug 840272
)
