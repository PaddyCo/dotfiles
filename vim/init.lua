_G.paddyco = {}
-- Install packer if not already installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

require('impatient')
require'partials/general'
require'partials/plugins'
require'partials/theme'
require'partials/lsp'
require'partials/terminal'
require'partials/bindings'
require'partials/statusline'

