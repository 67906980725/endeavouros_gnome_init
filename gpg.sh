#!/usr/bin/env bash

source ./install.sh

import()
{
    gpg --import "$HOME/.gnupg/private-keys-v1.d/private-gpg.key"
    gpg --import "$HOME/.gnupg/private-keys-v1.d/public-gpg.key"

    # others
    cd $HOME/.gnupg/public-keys
    # exa | xargs gpg --import
    ls | xargs gpg --import
}
import