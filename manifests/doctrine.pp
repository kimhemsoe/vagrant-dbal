$extlookup_precedence = ["%{fqdn}", "common"]

stage {
 "init": before => Stage["main"];
}

import "nodes/doctrine.pp"
