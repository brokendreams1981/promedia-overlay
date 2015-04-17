EAPI="5"

inherit eutils
#autotools

DESCRIPTION="Calf Studio Gear - Audio plugin pack."
HOMEPAGE="http://calf.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL LGPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="dssi experimental fftw fluidsynth jack ladspa +lash +lv2 sse"
REQUIRED_USE="jack"

DEPEND=">=media-sound/lash-0.5.4-r1
	>=media-libs/dssi-1.1.1
	>=media-libs/lv2-1.8.0
	>=media-libs/ladspa-sdk-1.13-r1
	>=media-sound/fluidsynth-1.1.6
	>=media-sound/jack-audio-connection-kit-0.103.0"

RDEPEND="media-sound/jack-audio-connection-kit
	fftw? ( sci-libs/fftw:3.0 )
	dev-libs/expat"

#src_unpack() {
#    unpack ${P}.tar.gz
#}

src_prepare() {
    epatch "${FILESDIR}/0001-Fixed-the-QA-issues.patch"
}

src_configure() {
#       $(use_with dssi)
#       $(use_with ladspa)
   econf \
       $(use_enable experimental) \
       $(use_with lash) \
       $(use_with lv2) \
       $(use_enable sse)
}

#src_install() {
#    emake DESTDIR="${D}" install
#}
