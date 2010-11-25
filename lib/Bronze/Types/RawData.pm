package Bronze::Types::RawData;
use Moose;
extends 'Bronze::Types::Media';

=head1 NAME

Bronze::Types::RawData - Support for raw data

=head1 DESCRIPTION

This adds support for raw data

=head1 HIERARCHY

Bronze::Types::RawData isa L<Bronze::Types::Media>

=head1 ATTRIBUTES

=over

=item display_name

Display name to be used when offering the data to download.

=cut

has display_name => ( is => 'rw',
                      isa => 'Str' );


1;
__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
