package Bronze::Types::Image;
use Moose;
extends 'Bronze::Types::Media';

=head1 NAME

Bronze::Types::Image - Support for image metadata

=head1 DESCRIPTION

This class provides the basic image metadata support.

=head1 HIERARCHY

Bronze::Types::Image isa L<Bronze::Types::Media>

=head1 ATTRIBUTES

=over

=item width

Width of the image, in pixels

=cut

has width => ( is => 'rw',
               isa => 'Int' );


=item height

Height of the image, in pixels

=cut

has height => ( is => 'rw',
                isa => 'Int' );


=item thumbnails

The list of thumbnails for this image. This points to other images.

=cut

has thumbnails => ( is => 'rw',
                    isa => 'KiokuDB::Set' );


1;
__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
