#!/usr/bin/perl

use v5.18;
use warnings;

use Test2::V0;

use Object::Pad 0.800;

class Point {
   field $x;
   method clear { $x = 0 }
}

{
   ok( !eval { Point->clear },
      'method on non-instance fails' );
   like( $@, qr/^Cannot invoke method on a non-instance /,
      'message from method on non-instance' );
}

{
   my $obj = bless [], "DifferentClass";

   ok( !eval { $obj->Point::clear },
      'method on wrong class fails' );
   like( $@, qr/^Cannot invoke foreign method on non-derived instance /,
      'message from method on wrong class' );
}

done_testing;
