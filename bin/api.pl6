#!perl6

use Cro::HTTP::Router;
use App::Hootboxes::Resource::Hootbox;
use App::Hootboxes::Schema;

App::Hootboxes::Schema::deploy;

route {
#include App::Hootboxes::Resource::Hootbox::routes($model);
}
