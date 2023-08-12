local M = {}
M.save = function()
  local ok, res = pcall(vim.cmd, 'write')
  if ok then
    return
  elseif res:match('.*Vim%(write%):E32: No file name') then
    ok, res = pcall(vim.fn.input, 'File name: ')
    if ok and res and res ~= '' then
      vim.cmd('write ' .. res)
    end
  else
    vim.api.nvim_err_writeln(res)
  end
end
return M
