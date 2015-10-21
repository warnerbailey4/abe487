#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';

my $file = shift or die "Please provide a sequence or file.\n";
open my $fh, '<', $file;

my $seq = '';
while(my $line = <$fh>) {
    chomp($line);
    $seq .= $line;
}    

$seq =~ s/([AG])(AATT[CG])/$1^$2/g;
say $seq;
