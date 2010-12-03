package Bronze::Types::Config;
use Moose;
extends 'Bronze::Types::AppInfo';

=head1 NAME

Bronze::Type::Config - Application configuration

=head1 DESCRIPTION

This is a special kind of data which is used to configure the
application. It should be used for infra-structural data that can be
identified by a simple key string.

=head1 HIERARCHY

Bronze::Types::Config isa L<Bronze::Types::AppInfo>

=head1 ATTRIBUTES

Only two attributes are defined here.

=over

=item key

This is the unique string to identify this data in the database.

=cut

has key => ( is => 'rw',
             isa => 'Str' );

=item value

This is a free-form string value to suit application-specific needs.

=cut

has value => ( is => 'rw',
               isa => 'Str' );

1;

=back

=head1 Indexing

Objects of this type have the "configkey" with the "key" attribute.

=cut

sub EXTRACT {
    my $self = shift;
    return
      {
       configkey => $self->key,
      };
}


__END__

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
