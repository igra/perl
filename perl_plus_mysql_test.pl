#!/usr/bin/perl
use strict;
use warnings;
use DBI;

my $user = "root";
my $pass = "12345";
my $host = "localhost";

my $dbh = DBI->connect("DBI:mysql:test_schema:$host", $user, $pass);

sub get_last_id {
   my $stmt = $dbh->prepare("select max(job_id) from jobs;");
   $stmt->execute or die "error to perform sql query";
   my @row = $stmt->fetchrow_array();
   return $row[0];
}

sub insert_new_row {
    my ($id, $technology) = @_;

    $id = $id % 2 == 0 ? $id+1 : $id; # only odd numbers as ids

    my $stmt = $dbh->prepare("insert into jobs(job_id, job_title) values($id, '$technology');");
    $stmt->execute or die "error to perform sql query";
}

sub select_all_rows() {
    my $stmt = $dbh->prepare("select * from jobs order by job_id asc");
    $stmt->execute
        or die "error to perform sql query";
    return $stmt->fetchall_arrayref();
}

insert_new_row(get_last_id()+1, "Oracle");

my $all_rows = select_all_rows();
foreach (@$all_rows) {
  print $_-> [0], " ", $_-> [1], "\n";
}

$dbh->disconnect();

exit(0);
