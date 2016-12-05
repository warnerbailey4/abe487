#!/usr/bin/perl

use strict;
use warnings;

my $infasta  = shift;
my $outfasta = shift;
if (!defined($infasta) or !defined($outfasta)) {
    die "PLease enter in two defined files\n";
}
else {
    open(my $in_fh,  '<', $infasta)  or die "Cannot open $infasta: $!\n";
    open(my $out_fh, '>', $outfasta) or die "Cannot open $outfasta: $!\n";
    my $header;
    my $sequence = '';
    while (my $line = <$in_fh>) {
        chomp($line);

        if ($line =~ /^>/) {
            if (length($sequence) > 0) {
                print($out_fh $header, " reverse-complement\n", $sequence,
                    "\n");
                $sequence = '';
            }
            $header = $line;    # header is updated with current sequence name
        }
        else {
            $line =~ tr/atcgATCG/tagcTAGC/;
            $sequence = reverse($line) . $sequence;
        }
    }
    if (length($sequence) > 0) {
        print($out_fh $header, " reverse-complement\n", $sequence, "\n");
    }
    close($out_fh);
    close($in_fh);
}

