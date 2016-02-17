# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

INTEL_DIST_NAME=parallel_studio_xe
INTEL_DIST_SKU=8365
INTEL_DIST_PV=2016_update1
INTEL_SUBDIR=compilers_and_libraries

inherit intel-sdp-r1

DESCRIPTION="Intel C/C++ Compiler"
HOMEPAGE="http://software.intel.com/en-us/articles/intel-composer-xe/"

LINGUAS="ja"
IUSE="doc linguas_ja"
KEYWORDS="-* ~amd64 ~x86 ~amd64-linux ~x86-linux"

DEPEND="!dev-lang/ifc[linguas_ja]"
RDEPEND="${DEPEND}
	~dev-libs/intel-common-${PV}[compiler]"

CHECKREQS_DISK_BUILD=325M

INTEL_BIN_RPMS=(
	"icc-l-all-devel")
INTEL_DAT_RPMS=(
	"icc-l-all-common"
	"icc-l-all-vars"
	"icc-l-ps-common")
INTEL_X86_RPMS=(
	"icc-l-all-32"
	"icc-l-ps"
	"icc-l-ps-ss-wrapper")
INTEL_AMD64_RPMS=(
	"icc-l-all"
	"icc-l-ps-devel"
	"icc-l-ps-ss"
	"icc-l-ps-ss-devel")

pkg_setup() {
	if use doc; then
		INTEL_DAT_RPMS+=(
			"icc-doc-16.0.1-150.noarch.rpm"
			"icc-ps-doc-16.0.1-150.noarch.rpm"
			"icc-ps-ss-doc-16.0.1-150.noarch.rpm")

		if use linguas_ja; then
			INTEL_DAT_RPMS+=(
				"icc-ps-doc-jp-16.0.1-150.noarch.rpm")
		fi
	fi

	intel-sdp-r1_pkg_setup
}
