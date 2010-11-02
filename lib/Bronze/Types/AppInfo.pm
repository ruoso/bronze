package Bronze::Types::AppInfo;
use Moose;
extends 'Bronze::Types::Content';

=head1 NAME

Bronze::Type::AppInfo - Application specific content

=head1 DESCRIPTION

This is a special kind of content which is used to configure the
application. It should be used for infra-structural content that can
be identified by a simple key string.

=head1 HIERARCHY

Bronze::Types::AppInfo isa L<Bronze::Types::Content>

=head1 ATTRIBUTES

Only two attributes are defined here.

=over

=item key

This is the unique string to identify this content in the database.

=cut

has key => ( is => 'rw',
             isa => 'Str' );

=item value

This is a free-form string value to suit application-specific needs.

=cut

has value => ( is => 'rw',
               isa => 'Str' );

1;

__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
