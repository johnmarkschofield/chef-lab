name              "bootstrap"
maintainer        "John Mark Schofield"
maintainer_email  "jms@schof.org"
license           "MIT"
description       "Bootstrap config for chef-lab"
version           "0.1"

%w{ debian ubuntu }.each do |os|
  supports os
end
