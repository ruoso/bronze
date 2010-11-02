package Bronze::Types::Content;
use Moose;

=head1 NAME

Bronze::Types::Content - Base class for all Bronze Content

=head1 DESCRIPTION

The Content type is the superclass for all bronze types. It contains
just basic infraestructural attributes that should be present for
every content. The features provided by this class are:

=over

=item Multi-language

All content in Bronze is made to be multi-lingual. Locale-based
fallback should be used when a desired language is not present, the
same way as HTTP content negotiation.

=item Ownership and Basic UNIX-like permissions

Bronze implements a UNIX-like permission set for content objects. The
idea is that all content objects have a owner, a group and a bit set
permission model in a rwxrwxrwx fashion.

=back

=head1 ATTRIBUTES

=over

=item lang

The lang attribute defines the language of this content.

=cut

has lang => ( is => 'rw',
              isa => 'Str' );

=item original

When this content is a translation of another content it should point
here which content it is. If this field is undef, it's underestood
that this is an original itself.

=cut

has original => ( is => 'rw',
                  isa => 'Bronze::Types::Content',
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
                     isa => 'Int' );


1;

__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
