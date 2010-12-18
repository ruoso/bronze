package Bronze::Types::Data;
# ABSTRACT: Base class for all Bronze Data
use Moose;
use namespace::clean -except => 'meta';

=head1 DESCRIPTION

The Data type is the superclass for all bronze types. It contains
just basic infraestructural attributes that should be present for
every data. The features provided by this class are:

=over

=item Multi-language

All data in Bronze is made to be multi-lingual. Locale-based
fallback should be used when a desired language is not present, the
same way as HTTP content negotiation.

=item Ownership and Basic UNIX-like permissions

Bronze implements a UNIX-like permission set for data objects. The
idea is that all data objects have a owner, a group and a bit set
permission model in a rwxrwxrwx fashion.

=back

=head1 ATTRIBUTES

=over

=item lang

The lang attribute defines the language of this data.

=cut

has lang => ( is => 'rw',
              isa => 'Str' );

=item original

When this data is a translation of another data it should point
here which data it is. If this field is undef, it's underestood
that this is an original itself.

=cut

has original => ( is => 'rw',
                  isa => 'Bronze::Types::Data',
                  weak_ref => 1 );

=item translations

This is a set of the objects that are a translation of this object.

=cut

has translations => ( is => 'rw',
                      isa => 'KiokuDB::Set' );

=item owner

This contains the owner identification. It is implemented as a string
to allow different types of integrations.

=cut

has owner => ( is => 'rw',
               isa => 'Str' );

=item group

This contains the group identification. It is implemented as a string
to allow different types of integrations.

=cut

has group => ( is => 'rw',
               isa => 'Str' );


=item permissions

This represents the permission for this object. It is implemented in
the same way as the Unix permissions. But note that it is stored as an
integer so you should perform operations in octal, such as:

  # others can read?
  $obj->permissions & 0004
  # others can write?
  $obj->permissions & 0002
  # group can read?
  $obj->permissions & 0040
  # group can write?
  $obj->permissions & 0020
  # user can read?
  $obj->permissions & 0400
  # user can write?
  $obj->permissions & 0200

=cut

has permissions => ( is => 'rw',
                     default => 0644 );


=back

=head1 Indexing

The indexing turns the "permissions", "owner" and "group" into a
"accessible" index key, which describes who can see this data. The
index value will be "any" if anyone can see this content, "g:$group"
for the group that can read and "u:$owner" for the user that can read
the content.

The lang is also indexed.

=cut

sub EXTRACT {
    my $self = shift;

    my @accessible;
    if ($self->permissions & 0004) {
        push @accessible, 'any';
    }
    if ($self->group && $self->permissions & 0040) {
        push @accessible, 'g:'.$self->group;
    }
    if ($self->owner && $self->permissions & 0400) {
        push @accessible, 'u:'.$self->owner;
    }
    return
      {
       lang => $self->lang,
       @accessible ? ( accessible => \@accessible ) : (),
      };
}

__PACKAGE__->meta->make_immutable;
1;
