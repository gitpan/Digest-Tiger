package Digest::Tiger;

# Digest::Tiger perl module written by Clinton Wong.
# This program is free software; you can redistribute it and/or 
# modify it under the same terms as Perl itself.

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;
require DynaLoader;
require AutoLoader;

@ISA = qw(Exporter DynaLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw(
	
);
$VERSION = '0.01';

bootstrap Digest::Tiger $VERSION;

# Preloaded methods go here.

sub hexhash {
  my ($buffer) = @_;

  my $hash = Digest::Tiger::hash($buffer);
  my $hexhash = unpack("H*", $hash);
  $hexhash = uc($hexhash);

  return $hexhash;
}


# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__


=head1 NAME

Digest::Tiger - a module that implements the tiger hash

=head1 SYNOPSIS

 use Digest::Tiger;

 # hash() returns a 192 bit hash
 my $hash = Digest::Tiger::hash('Tiger')

 # hexhash() returns a hex representation of the 192 bits...
 # $hexhash should be '9F00F599072300DD276ABB38C8EB6DEC37790C116F9D2BDF'
 my $hexhash = Digest::Tiger::hexhash('Tiger')

=head1 DESCRIPTION

A perl module that implements the tiger hash, which is believed
to be secure and runs quickly on 64-bit processors.

=head1 AUTHOR

Perl interface by Clinton Wong, reference C code used by
Digest::Tiger supplied by Ross Anderson and Eli Biham.

This module is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.  

=head1 SEE ALSO

 http://www.cs.technion.ac.il/~biham/Reports/Tiger/

=cut

