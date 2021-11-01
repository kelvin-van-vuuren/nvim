base16 = require("base16")

-- first load the base16 theme
base16(base16.themes("onedark"), true)

-- unload to force reload
package.loaded["colors.highlights" or false] = nil
-- then load the highlights
require "colors.highlights"
