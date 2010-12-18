package Bronze::Types::Post;
use Moose;
extends 'Bronze::Types::HTML';
use DateTime;
use namespace::clean -except => 'meta';

=head1 NAME

Bronze::Types::Post - Time-oriented content

=head1 DESCRIPTION

A post represent a content that is time-oriented

=head1 HIERARCHY

Bronze::Types::Post isa L<Bronze::Types::HTML>

=head1 ATTRIBUTES

=over

=item post_date

This is the chronological time to which this post refers to.

=cut

has post_date => ( is => 'rw',
                   isa => 'DateTime' );


=item comments

This is the list of comments associated to this post.

=cut

has comments => ( is => 'rw',
                  isa => 'KiokuDB::Set' );

__PACKAGE__->meta->make_immutable;

1;
__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
