# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker eutils

DESCRIPTION="ffmpeg extra codecs for Opera (i.e. mp3 and h.264)"
HOMEPAGE="http://ffmpeg.org"
SRC_URI="
	x86? ( http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${PV}-0ubuntu1_i386.deb )
	amd64? ( http://security.ubuntu.com/ubuntu/pool/universe/c/chromium-browser/chromium-codecs-ffmpeg-extra_${PV}-0ubuntu1_amd64.deb )
"

RESTRICT="mirror strip bindist"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="virtual/ffmpeg"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

QA_PRESTRIPPED="usr/lib/opera/lib_extra/libffmpeg.so"
QA_PREBUILT="usr/lib/opera/lib_extra/libffmpeg.so"

src_unpack(){
	unpack_deb "${A}"
}

src_install(){
	insinto "/usr/$(get_libdir)/opera/lib_extra"
	doins usr/lib/chromium-browser/libffmpeg.so
}
