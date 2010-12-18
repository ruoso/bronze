use Test::More;
use Test::Exception;
use strict;
use warnings;

use lib 't/lib';
use BronzeTest;
use Bronze::Types::Post;
use DateTime;

my $model = $::bronze->model($::user);
my ($id1, $id2, $id3);

lives_ok {
    my $scope = $model->new_scope;
    my $post_1 = $model->object
      ( 'Post',
        { lang => 'en',
          post_date => DateTime->now(),
          title => 'Post 1',
          content => '<p>This is the first post</p>',
          permissions => 0600,
          slug => 'post_1' });

    my $post_2 = $model->object
      ( 'Post',
        { lang => 'en',
          post_date => DateTime->now(),
          title => 'Post 2',
          content => '<p>This is the second post</p>',
          permissions => 0640,
          slug => 'post_2' });

    my $post_3 = $model->object
      ( 'Post',
        { lang => 'en',
          post_date => DateTime->now(),
          title => 'Post 3',
          content => '<p>This is the third post</p>',
          slug => 'post_3'  });

    ($id1, $id2, $id3) = $model->store($post_1, $post_2, $post_3);
};

lives_ok {
    my $scope = $model->new_scope;

    my ($post_1, $post_2, $post_3) =
      $model->lookup($id1, $id2, $id3);

    is($post_1->title, 'Post 1', 'Post Title');
    is($post_2->title, 'Post 2', 'Post Title');
    is($post_3->title, 'Post 3', 'Post Title');
};

lives_ok {
    my $scope = $model->new_scope;

    my $results = $model->search({ text => 'second' });
    my $item = $results->next;
    my @objects = @$item;
    is(scalar @objects, 1, 'one post in the bulk');
    is($objects[0]->title, 'Post 2', 'Found the correct post');
    ok(!$results->next, 'no more posts');

};


lives_ok {
    my $model = $::bronze->model(); # guest user...
    my $scope = $model->new_scope;

    my $results = $model->search({ text => 'this' });

    # even if the text "this" is present in all posts, the guest user
    # should only see the third post, because it's the only one he has
    # access to.

    my $item = $results->next;
    my @objects = @$item;
    is(scalar @objects, 1, 'one post in the bulk');
    is($objects[0]->title, 'Post 3', 'Found the correct post');
    ok(!$results->next, 'no more posts');

};

done_testing();
