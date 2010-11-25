package Bronze::Types::HTML;
use Moose;
extends 'Bronze::Types::Content';

=head1 NAME

Bronze::Types::HTML - Base for all text content

=head1 DESCRIPTION

This class represents all text contents.

=head1 HIERARCHY

Bronze::Types::HTML isa L<Bronze::Types::Content>

=head1 ATTRIBUTES

=over

=item title

This contains the title of the content.

=cut

has title => ( is => 'rw',
               isa => 'Str' );

=item content

This contains the actual content in HTML.

=cut

has content => ( is => 'rw',
                 isa => 'Str' );


=item media

This contains the media associated with this content.

=cut

has media => ( is => 'rw',
               isa => 'KiokuDB::Set' );


1;

__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
