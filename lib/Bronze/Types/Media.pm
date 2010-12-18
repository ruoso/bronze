package Bronze::Types::Media;
# ABSTRACT: Base for all media files
use Moose;
extends 'Bronze::Types::Content';
use namespace::clean -except => 'meta';

=head1 DESCRIPTION

This is the class that represents media files in Bronze. It does not
defined how the media is stored, which is defined by a set of Roles.

=head1 HIERARCHY

Bronze::Types::Media isa L<Bronze::Types::Content>

=head1 ATTRIBUTES

=over

=item content_type

This contains the content type of the actual stored data.

=cut

has content_type => ( is => 'rw',
                      isa => 'Str' );

=item content_length

Media should have the content length saved in order to allow better
output.

=back

=cut

has content_length => ( is => 'rw',
                        isa => 'Int' );

__PACKAGE__->meta->make_immutable;

1;

