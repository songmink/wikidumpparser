#!/usr/bin/perl
use warnings;
use strict;
use XML::Twig;
use utf8::all;

# file input on a command line
my $file = $ARGV[0];

my $twigPage = XML::Twig->new(twig_handlers => {page => \&title});
$twigPage->parsefile($file);
my $page_title;
my $page_id;

sub title {
    my ($twig_obj, $page_element) = @_;
    if($page_element->children('title')){
        #$page_id = $page_element->first_child('id')->text();
        $page_title =  $page_element->first_child('title')->text();
    }
}

my $twigUser = XML::Twig->new(twig_handlers => {contributor => \&contributor});
$twigUser->parsefile($file);

sub contributor {
    my ($twig_obj, $contributor_element) = @_;
    #print $page_id, ", ";
    print $page_title, ",";
    if($contributor_element->children('id')){
        #print $contributor_element->first_child('id')->text(), ",";
        print $contributor_element->first_child('username')->text(), "\n";
    }
    if($contributor_element->children('ip')){
        #print "-1,";
        print $contributor_element->first_child('ip')->text(), "\n";
    }
}
