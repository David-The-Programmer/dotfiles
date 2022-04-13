--
-- Configs for paq plugin manager
--

local paq = require("paq")
local bootstrap = require("plugins/bootstrap")
paq(bootstrap.pkgs)
