#! /usr/bin/env perl
# Copyright 2022 The OpenSSL Project Authors. All Rights Reserved.
#
# Licensed under the Apache License 2.0 (the "License").  You may not use
# this file except in compliance with the License.  You can obtain a copy
# in the file LICENSE in the source distribution or at
# https://www.openssl.org/source/license.html

use strict;
use warnings;

package OpenSSL::copyright;

sub year_of {
    my $file = shift;

    return $ENV{'OSSL_COPYRIGHT_YEAR'} if defined $ENV{'OSSL_COPYRIGHT_YEAR'};

    # Use the file date for backward compatibility.
    my $YEAR = [localtime([stat($file)]->[9])]->[5] + 1900;

    # See if git's available
    open my $FH,
       "git log -1 --date=short --format=format:%cd $file 2>/dev/null|"
           or return $YEAR;
    my $LINE = <$FH>;
    close $FH;
    $LINE =~ s/^([0-9]*)-.*/$1/ if $LINE;
    $YEAR = $LINE if $LINE;
    return $YEAR;
}

sub latest {
    my $l = 0;
    foreach my $f (@_ ) {
        my $y = year_of($f);
        $l = $y if $y > $l;
    }
    return $l
}
1;
