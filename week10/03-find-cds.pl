#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use Bio::Seq;
use Bio::SeqIO;
use feature 'say';
use Getopt::Long;
use Pod::Usage;

main();
    
# --------------------------------------------------
sub main {

my %opts = get_opts();
my @args = @ARGV;

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

for my $file (@ARGV) {
    my $in = Bio::SeqIO->new(-file   => $file,
                             -format => 'Genbank');

my $count = 0;
    while (my $seq = $in->next_seq){
        my @cds = grep { $_->primary_tag eq 'CDS' } $seq->top_SeqFeatures;
        $count++;
    my $seq_id = $seq->id;
        my $ncds   = scalar @cds;
        say "$seq_id has $ncds CDS";
        my $i;
        for my $cds (@cds) {
            say ++$i, ": ", $cds->get_tag_values('translation');
        }
    }
say "OK";
}
}

# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'help',
        'man_page',
    ) or pod2usage(2);

    return %args;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

03-find-cds.pl - a script

=head1 SYNOPSIS

  03-find-cds.pl 

Options:

  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

Describe what the script does, what input it expects, what output it
creates, etc.

=head1 SEE ALSO

perl.

=head1 AUTHOR

Bailey Alleen Warner E<lt>warnerbailey4@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 warnerbailey4

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut
