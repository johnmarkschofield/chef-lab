name              "chefserver"
maintainer        "John Mark Schofield"
maintainer_email  "jms@schof.org"
license           "MIT"
description       "Install and configure the chef server"
version           "0.1"
depends           "bootstrap"

%w{ debian ubuntu }.each do |os|
  supports os
end
