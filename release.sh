#!/usr/bin/env bash
#
# Copyright 2024 Kristoffer Winther Balling
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.
#
set -euf -o pipefail

TAG=${1:-}
GIT_USER_NAME="Kristoffer Winther Balling"
GIT_USER_EMAIL="balling_cc@k.wbnet.dk"
GIT_USER_SIGNINGKEY="830658948EB172F0!"

if ! command -v git-cliff &>/dev/null; then
	echo "git-cliff is not installed. Run 'cargo install git-cliff' to install it"
fi

if [ -z "${TAG}" ]; then
	echo "Please provide a tag."
	echo "Usage: ./release.sh v[X.Y.Z]"
	exit
fi

echo "Preparing ${TAG}..."
# update the changelog
git-cliff --config cliff.toml --tag "${TAG}" >CHANGELOG.md
echo "Please sign commit: chore(release): prepare for ${TAG}"
git add -A &&
	git -c user.name="${GIT_USER_NAME}" \
		-c user.email="${GIT_USER_EMAIL}" \
		-c user.signingkey="${GIT_USER_SIGNINGKEY}" \
		commit -m "chore(release): prepare for ${TAG}"
git show
# generate a changelog for the tag message
export GIT_CLIFF_TEMPLATE="\
	{% for group, commits in commits | group_by(attribute=\"group\") %}
	{{ group | upper_first }}\
	{% for commit in commits %}
		- {% if commit.breaking %}(breaking) {% endif %}{{ commit.message | upper_first }} ({{ commit.id | truncate(length=7, end=\"\") }})\
	{% endfor %}
	{% endfor %}"
changelog=$(git-cliff --config cliff_tag.toml --unreleased --strip all)
echo "Please sign tag: Release ${TAG}"
# create a signed tag
	git -c user.name="${GIT_USER_NAME}" \
		-c user.email="${GIT_USER_EMAIL}" \
		-c user.signingkey="${GIT_USER_SIGNINGKEY}" \
	tag -s -a "${TAG}" -m "Release ${TAG}" -m "$changelog"
git tag -v "${TAG}"
echo "Done!"
echo "Now push the commit (git push) and the tag (git push --tags)."
