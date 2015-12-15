node /aio/ {

include mysql::server
include keystone
include keystone::db::mysql
#include keystone::endpoint

}
