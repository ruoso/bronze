package Bronze::Types::Content;
# ABSTRACT: Superclass for the actual content
use Moose;
extends 'Bronze::Types::Data';
use Bronze::Types::Constraints 'PublishStatus';
use DateTime;
use namespace::clean -except => 'meta';

=head1 DESCRIPTION

This class is the superclass for all the content types in bronze.

=head1 HIERARCHY

Bronze::Types::Content isa L<Bronze::Types::Data>

=head1 ATTRIBUTES

=over

=item status

This refers to the different statuses that a content might have. See
L<Bronze::Types::Constraints> for a complete description of the
different states.

=cut

has status => ( is => 'rw',
                isa => PublishStatus,
                default => 'draft' );

=item slug

Slug defines the friendly name this content should be refered to.

=cut

has slug => ( is => 'rw',
              isa => 'Str' );

=item categories

A set with the categories associated with this content.

=cut

has categories => ( is => 'rw',
                    isa => 'KiokuDB::Set' );

=item tags

A set with the tags associated with this content.

=cut

has tags => ( is => 'rw',
              isa => 'KiokuDB::Set' );

=item layout_tags

A set with the layout annotations for this content.


=back

=cut

has layout_tags => ( is => 'rw',
                     isa => 'KiokuDB::Set' );


=head1 Indexing

This type indexes: "status", "slug", "tags", "layout_tags" and
"categories". All the taxonomies are indexed by their system_name.

=cut

sub EXTRACT {
    my $self = shift;
    return
      {
       status => $self->status,
       slug   => $self->slug,
       map { my $attr = $_;
             [ map { $_->system_name } $self->$attr->members ] }
       grep { defined $self->$_ }
       qw(tags layout_tags categories),
      };
}


__PACKAGE__->meta->make_immutable;
1;
