package Bronze::Types::RawData;
# ABSTRACT: Support for raw data
use Moose;
extends 'Bronze::Types::Media';
use namespace::clean -except => 'meta';

=head1 DESCRIPTION

This adds support for raw data

=head1 HIERARCHY

Bronze::Types::RawData isa L<Bronze::Types::Media>

=head1 ATTRIBUTES

=over

=item display_name

Display name to be used when offering the data to download.

=back

=cut

has display_name => ( is => 'rw',
                      isa => 'Str' );

__PACKAGE__->meta->make_immutable;

1;
