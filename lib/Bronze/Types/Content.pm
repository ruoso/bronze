package Bronze::Types::Content;
use Moose;
extends 'Bronze::Types::Data';
use Bronze::Types::Constraints 'PublishStatus';
use DateTime;

=head1 NAME

Bronze::Type::Content - Superclass for the actual content

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

=cut

has layout_tags => ( is => 'rw',
                     isa => 'KiokuDB::Set' );


=back

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
       qw(tags layout_tags categories),
      };
}

1;

__END__

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
