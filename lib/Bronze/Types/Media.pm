package Bronze::Types::Media;
use Moose;
extends 'Bronze::Types::Content';

=head1 NAME

Bronze::Types::Media - Base for all media files

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

=cut

has content_length => ( is => 'rw',
                        isa => 'Int' );


1;
__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
