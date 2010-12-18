package Bronze::Types::Image;
# ABSTRACT: Support for image metadata
use Moose;
extends 'Bronze::Types::Media';
use namespace::clean -except => 'meta';

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


__PACKAGE__->meta->make_immutable;
1;
